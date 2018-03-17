with Todos.Clients;
with Todos.Models;
with Swagger;
with Util.Properties;
with Util.Log.Loggers;
with Util.Http.Clients.Curl;
with Ada.IO_Exceptions;
with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Calendar.Formatting;
with Ada.Exceptions;
with Swagger.Clients;
with Swagger.Credentials.OAuth;
procedure Todos.Client is

   use Ada.Text_IO;

   procedure Usage;
   procedure Configure (Path   : in String;
                        Client : in out Todos.Clients.Client_Type;
                        Cred   : in out Swagger.Credentials.OAuth.OAuth2_Credential_Type);
   procedure Print (Todo : in Todos.Models.Todo_Type);

   procedure Configure (Path   : in String;
                        Client : in out Todos.Clients.Client_Type;
                        Cred   : in out Swagger.Credentials.OAuth.OAuth2_Credential_Type) is
      Config    : Util.Properties.Manager;
   begin
      Config.Load_Properties (Path);
      Util.Log.Loggers.Initialize (Config);
      declare
         Server : constant String := Config.Get ("server_url");
         Scope  : constant String := Config.Get ("scope", "read:todo,write:todo");
      begin
         Cred.Set_Application_Identifier (Config.Get ("client_id"));
         Cred.Set_Application_Secret (Config.Get ("client_secret"));
         Cred.Set_Provider_URI (Server & "/oauth/token");
         Cred.Request_Token (Config.Get ("username"), Config.Get ("password"), Scope);
         Client.Set_Server (Server);
      end;

   exception
      when Ada.IO_Exceptions.Name_Error =>
         Put_Line ("Cannot read configuration file: " & Path);
         raise;
   end Configure;

   procedure Print (Todo : in Todos.Models.Todo_Type) is
   begin
      Put (Swagger.Long'Image (Todo.Id));
      Set_Col (6);
      Put (Swagger.To_String (Todo.Status));
      Set_Col (15);
      Put (Ada.Calendar.Formatting.Image (Todo.Create_Date));
      Set_Col (40);
      if Todo.Done_Date.Is_Null then
         Put ("-");
      else
         Put (Ada.Calendar.Formatting.Image (Todo.Done_Date.Value));
      end if;
      Set_Col (60);
      Put (Swagger.To_String (Todo.Title));
      New_Line;
   end Print;

   procedure Usage is
   begin
      Put_Line ("Usage: todos {list|add|del|close|update} {params}");
      Put_Line ("  list                    List the todos");
      Put_Line ("  add <title>             Add a todo");
      Put_Line ("  del <id>                Delete the todo with the given <id>");
      Put_Line ("  close <id>              Change the todo status to 'close'");
      Put_Line ("  update <id> <title>     Update the todo title");
   end Usage;

   Arg_Count : constant Natural := Ada.Command_Line.Argument_Count;
begin
   if Arg_Count < 1 then
      Usage;
      return;
   end if;
   Util.Http.Clients.Curl.Register;
   declare
      Command  : constant String := Ada.Command_Line.Argument (1);
      Cred     : aliased Swagger.Credentials.OAuth.OAuth2_Credential_Type;
      C        : Todos.Clients.Client_Type;
      Title    : Swagger.UString;
      Todo     : Todos.Models.Todo_Type;
      List     : Todos.Models.Todo_Type_Vectors.Vector;
   begin
      Configure ("client.properties", C, Cred);

      C.Set_Credentials (Cred'Access);
      if Arg_Count = 2 and Command = "add" then
         Title := Swagger.To_UString (Ada.Command_Line.Argument (2));
         C.Create_Todo (Title, Todo);
         Put_Line ("Created todo " & Swagger.Long'Image (Todo.Id));
         Print (Todo);

      elsif Arg_Count = 1 and Command = "list" then
         C.List_Todos ((Is_Null => True, Value => <>), List);
         for T of List loop
            Print (T);
         end loop;

      elsif Arg_Count = 2 and Command = "del" then
         C.Delete_Todo (Todo_Id => Swagger.Long'Value (Ada.Command_Line.Argument (2)));

      elsif Arg_Count = 2 and Command = "close" then
         C.Update_Todo (Todo_Id => Swagger.Long'Value (Ada.Command_Line.Argument (2)),
                        Title   => (Is_Null => True, Value => <>),
                        Status  => (Is_Null => False, Value => Swagger.To_UString ("done")),
                        Result  => Todo);
         Print (Todo);

      elsif Arg_Count = 2 and Command = "update" then
         Title := Swagger.To_UString (Ada.Command_Line.Argument (2));
         C.Update_Todo (Todo_Id => Swagger.Long'Value (Ada.Command_Line.Argument (2)),
                        Title   => (Is_Null => False, Value => Title),
                        Status  => (Is_Null => True, Value => <>),
                        Result  => Todo);
         Print (Todo);

      else
         Usage;
      end if;

   exception
      when Swagger.Clients.Not_Found =>
         Put_Line ("The todo does not exist.");

      when Swagger.Clients.Authorization_Error =>
         Put_Line ("Authorization failed");

      when E : Constraint_Error =>
         Put_Line ("Constraint error raised: " & Ada.Exceptions.Exception_Message (E));

      when Util.Http.Clients.Connection_Error =>
         Put_Line ("Cannot connect to the server.");

      when Ada.IO_Exceptions.Name_Error =>
         Put_Line ("Cannot read configuration file");

   end;
end Todos.Client;
