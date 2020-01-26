--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with HAL; use HAL;

with GESTE_Config; use GESTE_Config;
with GESTE.Sprite;
with GESTE.Tile_Bank;

with Game_Assets.Tileset;
with Game_Assets.Tileset_Collisions;
with Game_Assets.Misc_Objects;
use Game_Assets;

package body Score_Display is

   Tile_Bank : aliased GESTE.Tile_Bank.Instance
     (Tileset.Tiles'Access,
      Tileset_Collisions.Tiles'Access,
      Palette'Access);

   Digit_Sprites : array (1 .. 6) of aliased GESTE.Sprite.Instance
     (Tile_Bank'Access, Misc_Objects.Item.D0.Tile_Id);

   Tiles : constant array (0 .. 9) of Tile_Index :=
     (
      0 => Misc_Objects.Item.D0.Tile_ID,
      1 => Misc_Objects.Item.D1.Tile_ID,
      2 => Misc_Objects.Item.D2.Tile_ID,
      3 => Misc_Objects.Item.D3.Tile_ID,
      4 => Misc_Objects.Item.D4.Tile_ID,
      5 => Misc_Objects.Item.D5.Tile_ID,
      6 => Misc_Objects.Item.D6.Tile_ID,
      7 => Misc_Objects.Item.D7.Tile_ID,
      8 => Misc_Objects.Item.D8.Tile_ID,
      9 => Misc_Objects.Item.D9.Tile_ID);

   ----------
   -- Init --
   ----------

   procedure Init (Pos : GESTE.Pix_Point) is
      X : Integer := Pos.X;
   begin
      for Digit of Digit_Sprites loop
         Digit.Move ((X, Pos.Y));
         GESTE.Add (Digit'Unchecked_Access, 50);
         X := X + 8;
      end loop;
   end Init;

   ------------
   -- Update --
   ------------

   procedure Update (Time_In_Game : PyGamer.Time.Time_Ms) is
      Tmp : PyGamer.Time.Time_Ms := Time_In_Game / 10;

      Cnt : Natural := 1;
   begin
      for Digit of reverse Digit_Sprites loop

         if Cnt = 3 then
            Digit.Set_Tile (Misc_Objects.Item.Dot.Tile_Id);
         else
            Digit.Set_Tile (Tiles (Integer (Tmp mod 10)));

            Tmp := Tmp / 10;
         end if;
         Cnt := Cnt + 1;
      end loop;
   end Update;

end Score_Display;
