with Interfaces;

package GESTE_Config is

   type Color_Index is range  0 ..  77;

   subtype Output_Color is Interfaces.Unsigned_16;

   Transparent : constant Output_Color :=  10067;

   Tile_Size : constant :=  8;

   type Tile_Index is range 0 .. 194;
   No_Tile : constant Tile_Index := 0;
end GESTE_Config;
