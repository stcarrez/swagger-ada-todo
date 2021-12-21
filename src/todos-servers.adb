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

   overriding
   procedure Redirect_Todos
     (Server : in out Server_Type;
      Context : in out Swagger.Servers.Context_Type) is
   begin
      Context.Set_Status (301);
      Context.Set_Location ("/v1/ui/index.html");
   end Redirect_Todos;

   --  Create a todo
   overriding
   procedure Create_Todo
      (Server : in out Server_Type;
       Title : in Swagger.UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out Swagger.Servers.Context_Type) is
      pragma Unreferenced (Context);
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
         Context.Set_Status (204);
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
      pragma Unreferenced (Context);
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
       Title : in Swagger.Nullable_UString;
       Status : in Swagger.Nullable_UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out Swagger.Servers.Context_Type) is
      Pos : constant Todo_Maps.Cursor := Server.Tasks.Find (Todo_Id);
   begin
      if not Todo_Maps.Has_Element (Pos) then
         Context.Set_Error (404, "Todo does not exist");
      else
         Result := Todo_Maps.Element (Pos);
         if not Title.Is_Null then
            Result.Title := Title.Value;
         end if;
         if not Status.Is_Null then
            Result.Status := Status.Value;
            if Status.Value = "done" then
               Result.Done_Date := (Is_Null => False, Value => Ada.Calendar.Clock);
            end if;
         end if;
         Server.Tasks.Include (Result.Id, Result);
      end if;
   end Update_Todo;

end Todos.Servers;
