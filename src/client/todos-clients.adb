--  Todo API
--  Todo API
--
--  The version of the OpenAPI document: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by OpenAPI-Generator 7.0.1-2023-08-27.
--  https://openapi-generator.tech
--  Do not edit the class manually.

pragma Warnings (Off, "*is not referenced");
with OpenAPI.Streams;
package body Todos.Clients is
   pragma Style_Checks ("-bmrIu");

   Media_List_1 : constant OpenAPI.Mime_List := (
     1 => OpenAPI.Mime_Json   );
   Media_List_2 : constant OpenAPI.Mime_List := (
     1 => OpenAPI.Mime_Form   );


   --  Create a todo
   procedure Create_Todo
      (Client : in out Client_Type;
       Title : in OpenAPI.UString;
       Result : out Todos.Models.Todo_Type) is
      URI   : OpenAPI.Clients.URI_Type;
      Req   : OpenAPI.Clients.Request_Type;
      Reply : OpenAPI.Value_Type;
   begin
      Client.Set_Accept (Media_List_1);

      Client.Initialize (Req, Media_List_2);
      Req.Stream.Write_Entity ("title", Title);

      URI.Set_Path ("/todos");
      Client.Call (OpenAPI.Clients.POST, URI, Req, Reply);
      Todos.Models.Deserialize (Reply, "", Result);
   end Create_Todo;

   --  Delete the todo
   --  Delete the todo
   procedure Delete_Todo
      (Client : in out Client_Type;
       Todo_Id : in OpenAPI.Long) is
      URI   : OpenAPI.Clients.URI_Type;
   begin


      URI.Set_Path ("/todos/{todoId}");
      URI.Set_Path_Param ("todoId", OpenAPI.To_String (Todo_Id));
      Client.Call (OpenAPI.Clients.DELETE, URI);
   end Delete_Todo;

   --  List the available tasks
   --  The list of tasks can be filtered by their status.
   procedure List_Todos
      (Client : in out Client_Type;
       Status : in OpenAPI.Nullable_UString;
       Result : out Todos.Models.Todo_Type_Vectors.Vector) is
      URI   : OpenAPI.Clients.URI_Type;
      Reply : OpenAPI.Value_Type;
   begin
      Client.Set_Accept (Media_List_1);


      URI.Add_Param ("status", Status);
      URI.Set_Path ("/todos");
      Client.Call (OpenAPI.Clients.GET, URI, Reply);
      Todos.Models.Deserialize (Reply, "", Result);
   end List_Todos;

   --  Redirect to the UI
   --  Default operation to redirect to the UI index page.
   procedure Redirect_Todos
      (Client : in out Client_Type) is
      URI   : OpenAPI.Clients.URI_Type;
   begin


      URI.Set_Path ("/");
      Client.Call (OpenAPI.Clients.GET, URI);
   end Redirect_Todos;

   --  Update the todo
   --  Update the todo title and status
   procedure Update_Todo
      (Client : in out Client_Type;
       Todo_Id : in OpenAPI.Long;
       Title : in OpenAPI.Nullable_UString;
       Status : in OpenAPI.Nullable_UString;
       Result : out Todos.Models.Todo_Type) is
      URI   : OpenAPI.Clients.URI_Type;
      Req   : OpenAPI.Clients.Request_Type;
      Reply : OpenAPI.Value_Type;
   begin
      Client.Set_Accept (Media_List_1);

      Client.Initialize (Req, Media_List_2);
      Req.Stream.Write_Entity ("title", Title);
      Req.Stream.Write_Entity ("status", Status);

      URI.Set_Path ("/todos/{todoId}");
      URI.Set_Path_Param ("todoId", OpenAPI.To_String (Todo_Id));
      Client.Call (OpenAPI.Clients.PUT, URI, Req, Reply);
      Todos.Models.Deserialize (Reply, "", Result);
   end Update_Todo;
end Todos.Clients;
