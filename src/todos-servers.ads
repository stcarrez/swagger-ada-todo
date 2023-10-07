--  Todo API
--  Todo API
--  ------------ EDIT NOTE ------------
--  This file was generated with openapi-generator.  You can modify it to implement
--  the server.  After you modify this file, you should add the following line
--  to the .openapi-generator-ignore file:
--
--  src/todos-servers.ads
--
--  Then, you can drop this edit note comment.
--  ------------ EDIT NOTE ------------
with OpenAPI.Servers;
with Todos.Models;
with Todos.Skeletons;
with Ada.Containers.Ordered_Maps;
package Todos.Servers is
   use Todos.Models;

   package Todo_Maps is new
     Ada.Containers.Ordered_Maps (Key_Type     => OpenAPI.Long,
                                  Element_Type => Todos.Models.Todo_Type,
                                  "<"          => "<",
                                  "="          => "=");

   type Server_Type is limited new Todos.Skeletons.Server_Type with record
      Tasks   : Todo_Maps.Map;
      Next_Id : OpenAPI.Long := 1;
   end record;

   overriding
   procedure Redirect_Todos
      (Server : in out Server_Type;
       Context : in out OpenAPI.Servers.Context_Type);

   --  Create a todo
   overriding
   procedure Create_Todo
      (Server : in out Server_Type;
       Title : in OpenAPI.UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out OpenAPI.Servers.Context_Type);

   --  Delete the todo
   --  Supprime le test/travail soit avant son execution, soit après son execution.
   overriding
   procedure Delete_Todo
      (Server : in out Server_Type;
       Todo_Id : in OpenAPI.Long;
       Context : in out OpenAPI.Servers.Context_Type);

   --  List the available tasks
   --  List the available tasks
   overriding
   procedure List_Todos
      (Server : in out Server_Type;
       Status : in OpenAPI.Nullable_UString;
       Result  : out Todos.Models.Todo_Type_Vectors.Vector;
       Context : in out OpenAPI.Servers.Context_Type);

   --  Update the todo
   --  Update the todo title and status
   overriding
   procedure Update_Todo
      (Server : in out Server_Type;
       Todo_Id : in OpenAPI.Long;
       Title : in OpenAPI.Nullable_UString;
       Status : in OpenAPI.Nullable_UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out OpenAPI.Servers.Context_Type);

   package Server_Impl is
      new Todos.Skeletons.Shared_Instance (Server_Type);

end Todos.Servers;
