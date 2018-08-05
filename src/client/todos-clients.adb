--  Todo API
--  Todo API
--
--  OpenAPI spec version: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by the swagger code generator 3.2.0-SNAPSHOT.
--  https://openapi-generator.tech
--  Do not edit the class manually.
with Swagger.Streams;
package body Todos.Clients is

   --  Create a todo
   procedure Create_Todo
      (Client : in out Client_Type;
       Title : in Swagger.UString;
       Result : out Todos.Models.Todo_Type) is
      URI   : Swagger.Clients.URI_Type;
      Req   : Swagger.Clients.Request_Type;
      Reply : Swagger.Value_Type;
   begin
      Client.Set_Accept ((1 => Swagger.Clients.APPLICATION_JSON));
      Client.Initialize (Req, (1 => Swagger.Clients.APPLICATION_FORM));
      Req.Stream.Write_Entity ("title", Title);

      URI.Set_Path ("/todos");
      Client.Call (Swagger.Clients.POST, URI, Req, Reply);
      Todos.Models.Deserialize (Reply, "", Result);
   end Create_Todo;

   --  Delete the todo
   --  Delete the todo
   procedure Delete_Todo
      (Client : in out Client_Type;
       Todo_Id : in Swagger.Long) is
      URI   : Swagger.Clients.URI_Type;
   begin


      URI.Set_Path ("/todos/{todoId}");
      URI.Set_Path_Param ("todoId", Swagger.To_String (Todo_Id));
      Client.Call (Swagger.Clients.DELETE, URI);
   end Delete_Todo;

   --  List the available tasks
   --  The list of tasks can be filtered by their status.
   procedure List_Todos
      (Client : in out Client_Type;
       Status : in Swagger.Nullable_UString;
       Result : out Todos.Models.Todo_Type_Vectors.Vector) is
      URI   : Swagger.Clients.URI_Type;
      Reply : Swagger.Value_Type;
   begin
      Client.Set_Accept ((1 => Swagger.Clients.APPLICATION_JSON));

      URI.Add_Param ("status", Status);
      URI.Set_Path ("/todos");
      Client.Call (Swagger.Clients.GET, URI, Reply);
      Todos.Models.Deserialize (Reply, "", Result);
   end List_Todos;

   --  Update the todo
   --  Update the todo title and status
   procedure Update_Todo
      (Client : in out Client_Type;
       Todo_Id : in Swagger.Long;
       Title : in Swagger.Nullable_UString;
       Status : in Swagger.Nullable_UString;
       Result : out Todos.Models.Todo_Type) is
      URI   : Swagger.Clients.URI_Type;
      Req   : Swagger.Clients.Request_Type;
      Reply : Swagger.Value_Type;
   begin
      Client.Set_Accept ((1 => Swagger.Clients.APPLICATION_JSON));
      Client.Initialize (Req, (1 => Swagger.Clients.APPLICATION_FORM));
      Req.Stream.Write_Entity ("title", Title);
      Req.Stream.Write_Entity ("status", Status);

      URI.Set_Path ("/todos/{todoId}");
      URI.Set_Path_Param ("todoId", Swagger.To_String (Todo_Id));
      Client.Call (Swagger.Clients.PUT, URI, Req, Reply);
      Todos.Models.Deserialize (Reply, "", Result);
   end Update_Todo;
end Todos.Clients;
