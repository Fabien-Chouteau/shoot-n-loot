--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with Game_Assets.Tileset;
with Game_Assets.Tileset_Collisions;
with Game_Assets.Misc_Objects;

with GESTE_Config; use GESTE_Config;
with GESTE.Tile_Bank;
with GESTE.Sprite.Animated;

with Sound;

package body Monsters is

   package Item renames Game_Assets.Misc_Objects.Item;

   Tile_Bank : aliased GESTE.Tile_Bank.Instance
     (Game_Assets.Tileset.Tiles'Access,
      Game_Assets.Tileset_Collisions.Tiles'Access,
      Game_Assets.Palette'Access);

   Empty_Tile  : constant GESTE_Config.Tile_Index := Item.Empty_Tile.Tile_Id;

   type Monster_Rec is record
      Sprite      : aliased GESTE.Sprite.Animated.Instance
                              (Tile_Bank'Access,
                               GESTE_Config.No_Tile);
      Origin      : GESTE.Pix_Point;
      Pos         : GESTE.Pix_Point;
      Alive       : Boolean := False;
      Going_Right : Boolean := True;
      Offset      : Natural := 0;
   end record;

   Monster_Array : array (1 .. Max_Nbr_Of_Monsters) of Monster_Rec;
   Last_Monster  : Natural := 0;
   Nbr_Killed    : Natural := 0;

   Anim_Step_Duration : constant := 10;

   Monster_Animation : aliased constant GESTE.Sprite.Animated.Animation_Array :=
     ((Item.M1.Tile_Id, Anim_Step_Duration),
      (Item.M2.Tile_Id, Anim_Step_Duration),
      (Item.M3.Tile_Id, Anim_Step_Duration),
      (Item.M4.Tile_Id, Anim_Step_Duration),
      (Item.M5.Tile_Id, Anim_Step_Duration),
      (Item.M6.Tile_Id, Anim_Step_Duration),
      (Item.M7.Tile_Id, Anim_Step_Duration));

   ----------
   -- Init --
   ----------

   procedure Init (Objects : Object_Array) is
   begin
      Last_Monster := 0;
      Nbr_Killed := 0;
      for Monster of Objects loop
         Last_Monster := Last_Monster + 1;

         declare
            M : Monster_Rec renames Monster_Array (Last_Monster);
         begin

            M.Sprite.Set_Animation (Monster_Animation'Access, Looping => True);

            M.Alive := True;

            M.Origin := (Integer (Monster.X), Integer (Monster.Y) - 8);
            M.Pos := M.Origin;

            M.Sprite.Move (M.Origin);

            GESTE.Add (M.Sprite'Access, 2);
         end;
      end loop;
   end Init;

   ---------------
   -- Check_Hit --
   ---------------

   function Check_Hit (Pt     : GESTE.Pix_Point;
                       Lethal : Boolean)
                       return Boolean
   is
   begin
      for M of Monster_Array (Monster_Array'First .. Last_Monster) loop
         if M.Alive
           and then
            Pt.X in M.Pos.X .. M.Pos.X + Tile_Size
           and then
            Pt.Y in M.Pos.Y .. M.Pos.Y + Tile_Size
         then
            if Lethal then
               --  Replace the monster by an empty tile to erase it from the
               --  screen.
               M.Sprite.Set_Animation (GESTE.Sprite.Animated.No_Animation,
                                       Looping => False);
               M.Sprite.Set_Tile (Empty_Tile);

               M.Alive := False;

               Nbr_Killed := Nbr_Killed + 1;

               Sound.Play_Monster_Dead;
            end if;

            return True;
         end if;
      end loop;

      return False;
   end Check_Hit;

   ----------------
   -- All_Killed --
   ----------------

   function All_Killed return Boolean
   is (Nbr_Killed = Last_Monster);

   ------------
   -- Update --
   ------------

   procedure Update is
   begin
      for M of Monster_Array (Monster_Array'First .. Last_Monster) loop

         if M.Alive then
            M.Sprite.Signal_Frame;

            M.Pos := (M.Origin.X + M.Offset / 5, M.Origin.Y);
            M.Sprite.Move (M.Pos);

            if M.Going_Right then
               if M.Offset >= GESTE_Config.Tile_Size * 2 * 5 then
                  M.Going_Right := False;
               else
                  M.Offset := M.Offset + 1;
               end if;
            else
               if M.Offset = 0 then
                  M.Going_Right := True;
               else
                  M.Offset := M.Offset - 1;
               end if;
            end if;
         end if;
      end loop;

   end Update;

end Monsters;
