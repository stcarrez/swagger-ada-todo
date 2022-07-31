--  Todo API
--  Todo API
--
--  The version of the OpenAPI document: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by OpenAPI-Generator 6.1.0-SNAPSHOT.
--  https://openapi-generator.tech
--  Do not edit the class manually.

with Todos.Models;
with OpenAPI.Clients;
package Todos.Clients is
   pragma Style_Checks ("-bmrIu");

   type Client_Type is new OpenAPI.Clients.Client_Type with null record;

   --  Create a todo
   procedure Create_Todo
      (Client : in out Client_Type;
       Title : in OpenAPI.UString;
       Result : out Todos.Models.Todo_Type);

   --  Delete the todo
   --  Delete the todo
   procedure Delete_Todo
      (Client : in out Client_Type;
       Todo_Id : in OpenAPI.Long);

   --  List the available tasks
   --  The list of tasks can be filtered by their status.
   procedure List_Todos
      (Client : in out Client_Type;
       Status : in OpenAPI.Nullable_UString;
       Result : out Todos.Models.Todo_Type_Vectors.Vector);

   --  Redirect to the UI
   --  Default operation to redirect to the UI index page.
   procedure Redirect_Todos
      (Client : in out Client_Type);

   --  Update the todo
   --  Update the todo title and status
   procedure Update_Todo
      (Client : in out Client_Type;
       Todo_Id : in OpenAPI.Long;
       Title : in OpenAPI.Nullable_UString;
       Status : in OpenAPI.Nullable_UString;
       Result : out Todos.Models.Todo_Type);

end Todos.Clients;
