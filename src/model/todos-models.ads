--  Todo API
--  Todo API
--
--  OpenAPI spec version: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by the swagger code generator 2.3.1.
--  https://github.com/swagger-api/swagger-codegen.git
--  Do not edit the class manually.
with Swagger.Streams;
with Ada.Containers.Vectors;
package Todos.Models is



   type Todo_Type is
     record
       Id : Swagger.Long;
       Title : Swagger.UString;
       Create_Date : Swagger.Datetime;
       Done_Date : Swagger.Nullable_Date;
       Status : Swagger.UString;
     end record;

   package Todo_Type_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Positive,
                                  Element_Type => Todo_Type);

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Todo_Type);

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Todo_Type_Vectors.Vector);

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Todo_Type);

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Todo_Type_Vectors.Vector);



   --  ------------------------------
   --  a User
   --  A User who manages todos
   --  ------------------------------
   type User_Type is
     record
       Id : Swagger.Long;
       Username : Swagger.UString;
       First_Name : Swagger.UString;
       Last_Name : Swagger.UString;
       Email : Swagger.UString;
       Password : Swagger.UString;
       Phone : Swagger.UString;
       User_Status : Integer;
     end record;

   package User_Type_Vectors is
      new Ada.Containers.Vectors (Index_Type   => Positive,
                                  Element_Type => User_Type);

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in User_Type);

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in User_Type_Vectors.Vector);

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out User_Type);

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out User_Type_Vectors.Vector);



end Todos.Models;
