--  Todo API
--  Todo API
--  ------------ EDIT NOTE ------------
--  This file was generated with swagger-codegen.  You can modify it to implement
--  the server.  After you modify this file, you should add the following line
--  to the .swagger-codegen-ignore file:
--
--  src/todos-servers.adb
--
--  Then, you can drop this edit note comment.
--  ------------ EDIT NOTE ------------
with Ada.Calendar;
package body Todos.Servers is

   use type Swagger.UString;

   --  Create a todo
   overriding
   procedure Create_Todo
      (Server : in out Server_Type;
       Title : in Swagger.UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out Swagger.Servers.Context_Type) is
   begin
      Result.Id := Server.Next_Id;
      Result.Create_Date := Ada.Calendar.Clock;
      Result.Status := Swagger.To_UString ("waiting");
      Result.Title := Title;
      Server.Next_Id := Server.Next_Id + 1;
      Server.Tasks.Insert (Result.Id, Result);
   end Create_Todo;

   --  Delete the todo
   --  Supprime le test/travail soit avant son execution, soit après son execution.
   overriding
   procedure Delete_Todo
      (Server : in out Server_Type;
       Todo_Id : in Swagger.Long;
       Context : in out Swagger.Servers.Context_Type) is
      Pos : Todo_Maps.Cursor := Server.Tasks.Find (Todo_Id);
   begin
      if not Todo_Maps.Has_Element (Pos) then
         Context.Set_Error (404, "Todo does not exist");
      else
         Server.Tasks.Delete (Pos);
         Context.Set_Status (204, "No content");
      end if;
   end Delete_Todo;

   --  List the available tasks
   --  List the available tasks
   overriding
   procedure List_Todos
      (Server : in out Server_Type;
       Status : in Swagger.Nullable_UString;
       Result  : out Todos.Models.Todo_Type_Vectors.Vector;
       Context : in out Swagger.Servers.Context_Type) is
   begin
      for T of Server.Tasks loop
         if Status.Is_Null or else T.Status = Status.Value then
            Result.Append (T);
         end if;
      end loop;
   end List_Todos;

   --  Update the todo
   --  Update the todo title and status
   overriding
   procedure Update_Todo
      (Server : in out Server_Type;
       Todo_Id : in Swagger.Long;
       Title : in Swagger.UString;
       Status : in Swagger.UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out Swagger.Servers.Context_Type) is
      Pos : constant Todo_Maps.Cursor := Server.Tasks.Find (Todo_Id);
   begin
      if not Todo_Maps.Has_Element (Pos) then
         Context.Set_Error (404, "Todo does not exist");
      else
         Result := Todo_Maps.Element (Pos);
         Result.Title := Title;
         Result.Status := Status;
         Server.Tasks.Include (Result.Id, Result);
      end if;
   end Update_Todo;

end Todos.Servers;
