--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with Game_Assets.Misc_Objects;

with GESTE.Maths_Types; use GESTE.Maths_Types;

package body Projectile is

   Empty_Tile  : constant GESTE_Config.Tile_Index :=
     Game_Assets.Misc_Objects.Item.Empty_Tile.Tile_Id;

   procedure Move_Tile (This : in out Instance)
     with Inline;

   ---------------
   -- Move_Tile --
   ---------------

   procedure Move_Tile (This : in out Instance) is
   begin
      This.Sprite.Move
        ((Integer (This.Obj.Position.X) - GESTE_Config.Tile_Size / 2,
         Integer (This.Obj.Position.Y) - GESTE_Config.Tile_Size / 2));
   end Move_Tile;

   ----------
   -- Init --
   ----------

   procedure Init (This : in out Instance) is
   begin
      This.Is_Alive := False;
   end Init;

   -----------
   -- Alive --
   -----------

   function Alive (This : Instance) return Boolean
   is (This.Is_Alive);

   -----------
   -- Spawn --
   -----------

   procedure Spawn (This         : in out Instance;
                    Pos          :        GESTE.Maths_Types.Point;
                    Time_To_Live :        GESTE.Maths_Types.Value;
                    Priority     :        GESTE.Layer_Priority)
   is
   begin
      This.Obj.Set_Mass (1.0);
      This.Obj.Set_Position (Pos);
      Move_Tile (This);
      This.Time_To_Live := Time_To_Live;
      This.Is_Alive := True;
      This.Sprite.Set_Tile (This.Sprite.Init_Frame);

      GESTE.Add (This.Sprite'Unchecked_Access, Priority);
   end Spawn;

   ------------
   -- Remove --
   ------------

   procedure Remove (This : in out Instance) is
   begin
      This.Sprite.Set_Tile (Empty_Tile);
      This.Time_To_Live := 0.1;
   end Remove;

   ----------------
   -- Set_Sprite --
   ----------------

   procedure Set_Sprite (This : in out Instance;
                         Id   :        GESTE_Config.Tile_Index)
   is
   begin
      This.Sprite.Set_Tile (Id);
   end Set_Sprite;

   ---------------
   -- Posistion --
   ---------------

   function Position (This : Instance) return GESTE.Pix_Point
   is ((Integer (This.Obj.Position.X), Integer (This.Obj.Position.Y)));

   ---------------
   -- Set_Speed --
   ---------------

   procedure Set_Speed (This : in out Instance;
                        S    :        GESTE.Maths_Types.Vect)
   is
   begin
      This.Obj.Set_Speed (S);
   end Set_Speed;

   ------------
   -- Update --
   ------------

   procedure Update (This    : in out Instance;
                     Elapsed :        GESTE.Maths_Types.Value)
   is
   begin
      if This.Alive then
         if This.Time_To_Live < 0.0 then
            This.Is_Alive := False;
            GESTE.Remove (This.Sprite'Unchecked_Access);
         else
            This.Obj.Step (Elapsed);

            Move_Tile (This);

            This.Time_To_Live := This.Time_To_Live - Elapsed;
         end if;
      end if;
   end Update;

end Projectile;
