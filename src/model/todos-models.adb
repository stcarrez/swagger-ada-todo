--  Todo API
--  Todo API
--
--  OpenAPI spec version: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by the swagger code generator 2.4.0-SNAPSHOT.
--  https://github.com/swagger-api/swagger-codegen.git
--  Do not edit the class manually.

package body Todos.Models is

   use Swagger.Streams;



   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Todo_Type) is
   begin
      Into.Start_Entity (Name);
      Serialize (Into, "id", Value.Id);
      Into.Write_Entity ("title", Value.Title);
      Into.Write_Entity ("create_date", Value.Create_Date);
      Into.Write_Entity ("done_date", Value.Done_Date);
      Into.Write_Entity ("status", Value.Status);
      Into.End_Entity (Name);
   end Serialize;

   procedure Serialize (Into  : in out Swagger.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Todo_Type_Vectors.Vector) is
   begin
      Into.Start_Array (Name);
      for Item of Value loop
         Serialize (Into, "", Item);
      end loop;
      Into.End_Array (Name);
   end Serialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Todo_Type) is
      Object : Swagger.Value_Type;
   begin
      Swagger.Streams.Deserialize (From, Name, Object);
      Swagger.Streams.Deserialize (Object, "id", Value.Id);
      Swagger.Streams.Deserialize (Object, "title", Value.Title);
      Swagger.Streams.Deserialize (Object, "create_date", Value.Create_Date);
      Swagger.Streams.Deserialize (Object, "done_date", Value.Done_Date);
      Swagger.Streams.Deserialize (Object, "status", Value.Status);
   end Deserialize;

   procedure Deserialize (From  : in Swagger.Value_Type;
                          Name  : in String;
                          Value : out Todo_Type_Vectors.Vector) is
      List : Swagger.Value_Array_Type;
      Item : Todo_Type;
   begin
      Value.Clear;
      Swagger.Streams.Deserialize (From, Name, List);
      for Data of List loop
         Deserialize (Data, "", Item);
         Value.Append (Item);
      end loop;
   end Deserialize;



end Todos.Models;
