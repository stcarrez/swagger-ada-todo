--  Todo API
--  Todo API
--
--  The version of the OpenAPI document: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by OpenAPI-Generator 6.1.0-SNAPSHOT.
--  https://openapi-generator.tech
--  Do not edit the class manually.

pragma Warnings (Off, "*is not referenced");
pragma Warnings (Off, "*no entities of*are referenced");
with OpenAPI.Servers;
with Todos.Models;
with Security.Permissions;
package Todos.Skeletons is
   pragma Style_Checks ("-bmrIu");
   pragma Warnings (Off, "*use clause for package*");
   use Todos.Models;
   type Server_Type is limited interface;

   --  Write a todo
   package ACL_Write_Todo is new Security.Permissions.Definition ("write:todo");

   --  Read a todo
   package ACL_Read_Todo is new Security.Permissions.Definition ("read:todo");



   --  Create a todo
   procedure Create_Todo
      (Server : in out Server_Type;
       Title : in OpenAPI.UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out OpenAPI.Servers.Context_Type) is abstract;

   --  Delete the todo
   --  Delete the todo
   procedure Delete_Todo
      (Server : in out Server_Type;
       Todo_Id : in OpenAPI.Long;
       Context : in out OpenAPI.Servers.Context_Type) is abstract;

   --  List the available tasks
   --  The list of tasks can be filtered by their status.
   procedure List_Todos
      (Server : in out Server_Type;
       Status : in OpenAPI.Nullable_UString;
       Result  : out Todos.Models.Todo_Type_Vectors.Vector;
       Context : in out OpenAPI.Servers.Context_Type) is abstract;

   --  Redirect to the UI
   --  Default operation to redirect to the UI index page.
   procedure Redirect_Todos
      (Server : in out Server_Type
       ;
       Context : in out OpenAPI.Servers.Context_Type) is abstract;

   --  Update the todo
   --  Update the todo title and status
   procedure Update_Todo
      (Server : in out Server_Type;
       Todo_Id : in OpenAPI.Long;
       Title : in OpenAPI.Nullable_UString;
       Status : in OpenAPI.Nullable_UString;
       Result  : out Todos.Models.Todo_Type;
       Context : in out OpenAPI.Servers.Context_Type) is abstract;

   generic
      type Implementation_Type is limited new Server_Type with private;
      URI_Prefix : String := "";
   package Skeleton is

      procedure Register (Server : in out OpenAPI.Servers.Application_Type'Class);


      --  Create a todo
      procedure Create_Todo
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);


      --  Delete the todo
      procedure Delete_Todo
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);


      --  List the available tasks
      procedure List_Todos
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);


      --  Redirect to the UI
      procedure Redirect_Todos
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);


      --  Update the todo
      procedure Update_Todo
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);

   end Skeleton;

   generic
      type Implementation_Type is limited new Server_Type with private;
      URI_Prefix : String := "";
   package Shared_Instance is

      procedure Register (Server : in out OpenAPI.Servers.Application_Type'Class);


      --  Create a todo
      procedure Create_Todo
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);


      --  Delete the todo
      procedure Delete_Todo
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);


      --  List the available tasks
      procedure List_Todos
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);


      --  Redirect to the UI
      procedure Redirect_Todos
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);


      --  Update the todo
      procedure Update_Todo
         (Req     : in out OpenAPI.Servers.Request'Class;
          Reply   : in out OpenAPI.Servers.Response'Class;
          Stream  : in out OpenAPI.Servers.Output_Stream'Class;
          Context : in out OpenAPI.Servers.Context_Type);


   private
      protected Server is

         --  Create a todo
         procedure Create_Todo
            (Title : in OpenAPI.UString;
       Result  : out Todos.Models.Todo_Type;
             Context : in out OpenAPI.Servers.Context_Type);

         --  Delete the todo
         procedure Delete_Todo
            (Todo_Id : in OpenAPI.Long;
             Context : in out OpenAPI.Servers.Context_Type);

         --  List the available tasks
         procedure List_Todos
            (Status : in OpenAPI.Nullable_UString;
       Result  : out Todos.Models.Todo_Type_Vectors.Vector;
             Context : in out OpenAPI.Servers.Context_Type);

         --  Redirect to the UI
         procedure Redirect_Todos (Context : in out OpenAPI.Servers.Context_Type);

         --  Update the todo
         procedure Update_Todo
            (Todo_Id : in OpenAPI.Long;
             Title : in OpenAPI.Nullable_UString;
             Status : in OpenAPI.Nullable_UString;
       Result  : out Todos.Models.Todo_Type;
             Context : in out OpenAPI.Servers.Context_Type);

      private
         Impl : Implementation_Type;
      end Server;
   end Shared_Instance;

end Todos.Skeletons;
