--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with Sound;

with Game_Assets.Tileset;
with Game_Assets.Tileset_Collisions;
with Game_Assets.Misc_Objects;       use Game_Assets.Misc_Objects;

with GESTE_Config;    use GESTE_Config;
with GESTE.Tile_Bank;
with GESTE.Sprite;

package body Chests is

   Closed_Tile : constant GESTE_Config.Tile_Index := Item.Chest_Closed.Tile_Id;
   Open_Tile   : constant GESTE_Config.Tile_Index := Item.Chest_Open.Tile_Id;
   Coin_Tile   : constant GESTE_Config.Tile_Index := Item.Coin.Tile_Id;
   Empty_Tile  : constant GESTE_Config.Tile_Index := Item.Empty_Tile.Tile_Id;

   Tile_Bank : aliased GESTE.Tile_Bank.Instance
     (Game_Assets.Tileset.Tiles'Access,
      Game_Assets.Tileset_Collisions.Tiles'Access,
      Game_Assets.Palette'Access);

   type Chest_Rec is record
      Sprite   : aliased GESTE.Sprite.Instance (Tile_Bank'Access, Closed_Tile);
      Coin     : aliased GESTE.Sprite.Instance (Tile_Bank'Access, Empty_Tile);
      Coin_TTL : Natural := 0;
      Pos      : GESTE.Pix_Point;
      Open     : Boolean := False;
   end record;

   Chest_Array : array (1 .. Max_Nbr_Of_Chests) of Chest_Rec;
   Last_Chest  : Natural := 0;
   Nbr_Open    : Natural := 0;

   ----------
   -- Init --
   ----------

   procedure Init (Objects : Object_Array) is
   begin
      Last_Chest := 0;
      Nbr_Open := 0;
      for Chest of Objects loop
         Last_Chest := Last_Chest + 1;

         declare
            C : Chest_Rec renames Chest_Array (Last_Chest);
         begin

            C.Pos := (Integer (Chest.X), Integer (Chest.Y) - 8);
            C.Sprite.Move (C.Pos);
            C.Sprite.Set_Tile (Closed_Tile);
            C.Open := False;
            C.Sprite.Flip_Horizontal (Chest.Flip_Horizontal);
            C.Coin_TTL := 0;
            GESTE.Add (Chest_Array (Last_Chest).Sprite'Access, 2);
         end;
      end loop;
   end Init;

   -----------------------
   -- Check_Chest_Found --
   -----------------------

   procedure Check_Chest_Found (Pt : GESTE.Pix_Point) is
   begin
      for Chest of Chest_Array (Chest_Array'First .. Last_Chest) loop
         if not Chest.Open
           and then
            Pt.X in Chest.Pos.X .. Chest.Pos.X + Tile_Size
           and then
            Pt.Y in Chest.Pos.Y .. Chest.Pos.Y + Tile_Size
         then
            Chest.Sprite.Set_Tile (Open_Tile);
            Chest.Open := True;

            Chest.Coin.Set_Tile (Coin_Tile);
            Chest.Coin.Move ((Chest.Pos.X, Chest.Pos.Y - 8));
            Chest.Coin_TTL := 60;
            GESTE.Add (Chest.Coin'Access, 4);

            Sound.Play_Coin;

            Nbr_Open := Nbr_Open + 1;

            --  Don't try to open more than one chest as they shouldn't be on
            --  the same tile.
            return;
         end if;
      end loop;
   end Check_Chest_Found;

   --------------
   -- All_Open --
   --------------

   function All_Open return Boolean
   is (Nbr_Open = Last_Chest);

   ------------
   -- Update --
   ------------

   procedure Update is
   begin
      for Chest of Chest_Array (Chest_Array'First .. Last_Chest) loop
         if Chest.Coin_TTL > 0 then
            Chest.Coin_TTL := Chest.Coin_TTL - 1;

            if Chest.Coin_TTL = 1 then
               Chest.Coin.Set_Tile (Empty_Tile);
            elsif Chest.Coin_TTL = 0 then
               GESTE.Remove (Chest.Coin'Access);
            end if;
         end if;
      end loop;
   end Update;

end Chests;
