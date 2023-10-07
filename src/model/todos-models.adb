--  Todo API
--  Todo API
--
--  The version of the OpenAPI document: 1.0.0
--  Contact: Stephane.Carrez@gmail.com
--
--  NOTE: This package is auto generated by OpenAPI-Generator 7.0.1-2023-08-27.
--  https://openapi-generator.tech
--  Do not edit the class manually.

package body Todos.Models is
   pragma Style_Checks ("-bmrIu");

   pragma Warnings (Off, "*use clause for package*");

   use OpenAPI.Streams;

   procedure Serialize (Into  : in out OpenAPI.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Todos.Models.Todo_Type) is
   begin
      Into.Start_Entity (Name);
      Into.Write_Long_Entity ("id", Value.Id);
      Into.Write_Entity ("title", Value.Title);
      Into.Write_Entity ("create_date", Value.Create_Date);
      if not Value.Done_Date.Is_Null then
         Into.Write_Entity ("done_date", Value.Done_Date);
      end if;
      Into.Write_Entity ("status", Value.Status);
      Into.End_Entity (Name);
   end Serialize;

   procedure Serialize (Into  : in out OpenAPI.Streams.Output_Stream'Class;
                        Name  : in String;
                        Value : in Todo_Type_Vectors.Vector) is
   begin
      Into.Start_Array (Name);
      for Item of Value loop
         Serialize (Into, "", Item);
      end loop;
      Into.End_Array (Name);
   end Serialize;

   procedure Deserialize (From  : in OpenAPI.Value_Type;
                          Name  : in String;
                          Value : out Todos.Models.Todo_Type) is
      Object : OpenAPI.Value_Type;
   begin
      OpenAPI.Streams.Deserialize (From, Name, Object);
      OpenAPI.Streams.Deserialize (Object, "id", Value.Id);
      OpenAPI.Streams.Deserialize (Object, "title", Value.Title);
      OpenAPI.Streams.Deserialize (Object, "create_date", Value.Create_Date);
      OpenAPI.Streams.Deserialize (Object, "done_date", Value.Done_Date);
      OpenAPI.Streams.Deserialize (Object, "status", Value.Status);
   end Deserialize;

   procedure Deserialize (From  : in OpenAPI.Value_Type;
                          Name  : in String;
                          Value : in out Todo_Type_Vectors.Vector) is
      List : OpenAPI.Value_Array_Type;
      Item : Todos.Models.Todo_Type;
   begin
      Value.Clear;
      OpenAPI.Streams.Deserialize (From, Name, List);
      for Data of List loop
         Deserialize (Data, "", Item);
         Value.Append (Item);
      end loop;
   end Deserialize;


end Todos.Models;
