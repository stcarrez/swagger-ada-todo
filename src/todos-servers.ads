--  Todo API
--  Todo API
--  ------------ EDIT NOTE ------------
--  This file was generated with swagger-codegen.  You can modify it to implement
--  the server.  After you modify this file, you should add the following line
--  to the .swagger-codegen-ignore file:
--
--  src/todos-servers.ads
--
--  Then, you can drop this edit note comment.
--  ------------ EDIT NOTE ------------
with Swagger.Servers;
with Todos.Models;
with Todos.Skeletons;
with Ada.Containers.Ordered_Maps;
package Todos.Servers is
   use Todos.Models;

   package Todo_Maps is new
     Ada.Containers.Ordered_Maps (Key_Type     => Swagger.Long,
                                  Element_Type => Todos.Models.Todo_Type,
                                  "<"          => "<",
                                  "="          => "=");

   type Server_Type is limited new Todos.Skeletons.Server_Type with record
      Tasks   : Todo_Maps.Map;
      Next_Id : Swagger.Long := 1;
   end record;

   --  Create a todo
   overriding
   procedure Create_Todo
      (Server : in out Server_Type;
       Title : in Swagger.UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out Swagger.Servers.Context_Type);

   --  Delete the todo
   --  Supprime le test/travail soit avant son execution, soit après son execution.
   overriding
   procedure Delete_Todo
      (Server : in out Server_Type;
       Todo_Id : in Swagger.Long;
       Context : in out Swagger.Servers.Context_Type);

   --  List the available tasks
   --  List the available tasks
   overriding
   procedure List_Todos
      (Server : in out Server_Type;
       Status : in Swagger.Nullable_UString;
       Result  : out Todos.Models.Todo_Type_Vectors.Vector;
       Context : in out Swagger.Servers.Context_Type);

   --  Update the todo
   --  Update the todo title and status
   overriding
   procedure Update_Todo
      (Server : in out Server_Type;
       Todo_Id : in Swagger.Long;
       Title : in Swagger.UString;
       Status : in Swagger.UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out Swagger.Servers.Context_Type);

   package Server_Impl is
      new Todos.Skeletons.Shared_Instance (Server_Type);

end Todos.Servers;
