--  Todo API
--  Todo API
--
--  The version of the OpenAPI document: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by OpenAPI-Generator 5.0.0-SNAPSHOT.
--  https://openapi-generator.tech
--  Do not edit the class manually.

with Todos.Models;
with Swagger.Clients;
package Todos.Clients is

   type Client_Type is new Swagger.Clients.Client_Type with null record;

   --  Create a todo
   procedure Create_Todo
      (Client : in out Client_Type;
       Title : in Swagger.UString;
       Result : out Todos.Models.Todo_Type);

   --  Delete the todo
   --  Delete the todo
   procedure Delete_Todo
      (Client : in out Client_Type;
       Todo_Id : in Swagger.Long);

   --  List the available tasks
   --  The list of tasks can be filtered by their status.
   procedure List_Todos
      (Client : in out Client_Type;
       Status : in Swagger.Nullable_UString;
       Result : out Todos.Models.Todo_Type_Vectors.Vector);

   --  Update the todo
   --  Update the todo title and status
   procedure Update_Todo
      (Client : in out Client_Type;
       Todo_Id : in Swagger.Long;
       Title : in Swagger.Nullable_UString;
       Status : in Swagger.Nullable_UString;
       Result : out Todos.Models.Todo_Type);

end Todos.Clients;
