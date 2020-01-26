--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with GESTE_Config; use GESTE_Config;
with GESTE.Grid;
with GESTE.Tile_Bank;
with GESTE.Sprite;

with Monsters;
with Chests;
with Player;
with Score_Display;
with Sound;

with Game_Assets; use Game_Assets;
with Game_Assets.Tileset;
with Game_Assets.Tileset_Collisions;
with Game_Assets.level_0;
with Game_Assets.level_1;
with Game_Assets.level_2;
with Game_Assets.level_3;
with Game_Assets.level_4;
with Game_Assets.level_5;
with Game_Assets.level_6;
with Game_Assets.level_7;
with Game_Assets.level_8;
with Game_Assets.Misc_Objects; use Game_Assets.Misc_Objects;

package body Levels is

   Tile_Bank : aliased GESTE.Tile_Bank.Instance
     (Tileset.Tiles'Access,
      Tileset_Collisions.Tiles'Access,
      Palette'Access);

   Level_0_Back : aliased GESTE.Grid.Instance
     (Game_Assets.level_0.Back.Data'Access,
      Tile_Bank'Access);
   Level_0_Front : aliased GESTE.Grid.Instance
     (level_0.Front.Data'Access,
      Tile_Bank'Access);
   Level_0_Backcolor : aliased GESTE.Grid.Instance
     (level_0.Backcolor.Data'Access,
      Tile_Bank'Access);

   Level_1_Back : aliased GESTE.Grid.Instance
     (Game_Assets.level_1.Back.Data'Access,
      Tile_Bank'Access);
   Level_1_Front : aliased GESTE.Grid.Instance
     (level_1.Front.Data'Access,
      Tile_Bank'Access);
   Level_1_Backcolor : aliased GESTE.Grid.Instance
     (level_1.Backcolor.Data'Access,
      Tile_Bank'Access);

   Level_2_Back : aliased GESTE.Grid.Instance
     (level_2.Back.Data'Access,
      Tile_Bank'Access);
   Level_2_Front : aliased GESTE.Grid.Instance
     (level_2.Front.Data'Access,
      Tile_Bank'Access);
   Level_2_Backcolor : aliased GESTE.Grid.Instance
     (level_2.Backcolor.Data'Access,
      Tile_Bank'Access);

   Level_3_Back : aliased GESTE.Grid.Instance
     (level_3.Back.Data'Access,
      Tile_Bank'Access);
   Level_3_Front : aliased GESTE.Grid.Instance
     (level_3.Front.Data'Access,
      Tile_Bank'Access);
   Level_3_Backcolor : aliased GESTE.Grid.Instance
     (level_3.Backcolor.Data'Access,
      Tile_Bank'Access);

   Level_4_Back : aliased GESTE.Grid.Instance
     (level_4.Back.Data'Access,
      Tile_Bank'Access);
   Level_4_Front : aliased GESTE.Grid.Instance
     (level_4.Front.Data'Access,
      Tile_Bank'Access);
   Level_4_Backcolor : aliased GESTE.Grid.Instance
     (level_4.Backcolor.Data'Access,
      Tile_Bank'Access);

   Level_5_Back : aliased GESTE.Grid.Instance
     (level_5.Back.Data'Access,
      Tile_Bank'Access);
   Level_5_Front : aliased GESTE.Grid.Instance
     (level_5.Front.Data'Access,
      Tile_Bank'Access);
   Level_5_Backcolor : aliased GESTE.Grid.Instance
     (level_5.Backcolor.Data'Access,
      Tile_Bank'Access);

   Level_6_Back : aliased GESTE.Grid.Instance
     (level_6.Back.Data'Access,
      Tile_Bank'Access);
   Level_6_Front : aliased GESTE.Grid.Instance
     (level_6.Front.Data'Access,
      Tile_Bank'Access);
   Level_6_Backcolor : aliased GESTE.Grid.Instance
     (level_6.Backcolor.Data'Access,
      Tile_Bank'Access);

   Level_7_Back : aliased GESTE.Grid.Instance
     (level_7.Back.Data'Access,
      Tile_Bank'Access);
   Level_7_Front : aliased GESTE.Grid.Instance
     (level_7.Front.Data'Access,
      Tile_Bank'Access);
   Level_7_Backcolor : aliased GESTE.Grid.Instance
     (level_7.Backcolor.Data'Access,
      Tile_Bank'Access);

   Level_8_Back : aliased GESTE.Grid.Instance
     (level_8.Back.Data'Access,
      Tile_Bank'Access);
   Level_8_Front : aliased GESTE.Grid.Instance
     (level_8.Front.Data'Access,
      Tile_Bank'Access);
   Level_8_Backcolor : aliased GESTE.Grid.Instance
     (level_8.Backcolor.Data'Access,
      Tile_Bank'Access);

   Finish_Tile     : constant Tile_Index := Item.Exit_Portal.Tile_Id;
   Finish_Position : GESTE.Pix_Point := (0, 0);
   Finish_Sprite   : aliased GESTE.Sprite.Instance (Tile_Bank'Access,
                                                    Finish_Tile);

   procedure Set_Finish (Obj : Object);
   procedure Move_To_Spawn (Obj : Object);

   ----------------
   -- Set_Finish --
   ----------------

   procedure Set_Finish (Obj : Object) is
   begin
      Finish_Position := (Integer (Obj.X), Integer (Obj.Y) - Tile_Size);

      Finish_Sprite.Move (Finish_Position);
      Finish_Sprite.Set_Tile (Obj.Tile_Id);
      GESTE.Add (Finish_Sprite'Access, 2);
      Finish_Sprite.Enable_Collisions;
   end Set_Finish;

   -------------------
   -- Move_To_Spawn --
   -------------------

   procedure Move_To_Spawn (Obj : Object) is
   begin
      Player.Spawn;
      Player.Move ((Integer (Obj.X) + Tile_Size / 2,
                   Integer (Obj.Y) - Tile_Size / 2));
   end Move_To_Spawn;

   -----------
   -- Enter --
   -----------

   procedure Enter (Id : Level_Id) is
   begin
      GESTE.Remove_All;

      Score_Display.Init ((14 * Tile_Size, 15 * Tile_Size));

      case Id is
         when Lvl_0 =>
            Set_Finish (level_0.Markers.Finish);
            Move_To_Spawn (level_0.Markers.Spawn);

            Level_0_Backcolor.Move ((0, 0));
            GESTE.Add (Level_0_Backcolor'Access, 0);
            Level_0_Back.Move ((0, 0));
            Level_0_Back.Enable_Collisions;
            GESTE.Add (Level_0_Back'Access, 1);
            Level_0_Front.Move ((0, 0));
            Level_0_Front.Enable_Collisions;
            GESTE.Add (Level_0_Front'Access, 3);

            Chests.Init (Game_Assets.level_0.Chests.Objects);
            Monsters.Init ((1 .. 0 => <>)); -- No monsters

         when Lvl_1 =>
            Set_Finish (level_1.Markers.Finish);
            Move_To_Spawn (level_1.Markers.Spawn);

            Level_1_Backcolor.Move ((0, 0));
            GESTE.Add (Level_1_Backcolor'Access, 0);
            Level_1_Back.Move ((0, 0));
            Level_1_Back.Enable_Collisions;
            GESTE.Add (Level_1_Back'Access, 1);
            Level_1_Front.Move ((0, 0));
            Level_1_Front.Enable_Collisions;
            GESTE.Add (Level_1_Front'Access, 3);

            Chests.Init (Game_Assets.level_1.Chests.Objects);
            Monsters.Init ((1 .. 0 => <>)); -- No monsters

         when Lvl_2 =>
            Set_Finish (level_2.Markers.Finish);
            Move_To_Spawn (level_2.Markers.Spawn);

            Level_2_Backcolor.Move ((0, 0));
            GESTE.Add (Level_2_Backcolor'Access, 0);
            Level_2_Back.Move ((0, 0));
            Level_2_Back.Enable_Collisions;
            GESTE.Add (Level_2_Back'Access, 1);
            Level_2_Front.Move ((0, 0));
            Level_2_Front.Enable_Collisions;
            GESTE.Add (Level_2_Front'Access, 3);

            Chests.Init (Game_Assets.level_2.Chests.Objects);
            Monsters.Init ((1 .. 0 => <>)); -- No monsters

         when Lvl_3 =>
            Set_Finish (level_3.Markers.Finish);
            Move_To_Spawn (level_3.Markers.Spawn);

            Level_3_Backcolor.Move ((0, 0));
            GESTE.Add (Level_3_Backcolor'Access, 0);
            Level_3_Back.Move ((0, 0));
            Level_3_Back.Enable_Collisions;
            GESTE.Add (Level_3_Back'Access, 1);
            Level_3_Front.Move ((0, 0));
            Level_3_Front.Enable_Collisions;
            GESTE.Add (Level_3_Front'Access, 3);

            Monsters.Init (Game_Assets.level_3.Monsters.Objects);
            Chests.Init (Game_Assets.level_3.Chests.Objects);

         when Lvl_4 =>
            Set_Finish (level_4.Markers.Finish);
            Move_To_Spawn (level_4.Markers.Spawn);

            Level_4_Backcolor.Move ((0, 0));
            GESTE.Add (Level_4_Backcolor'Access, 0);
            Level_4_Back.Move ((0, 0));
            Level_4_Back.Enable_Collisions;
            GESTE.Add (Level_4_Back'Access, 1);
            Level_4_Front.Move ((0, 0));
            Level_4_Front.Enable_Collisions;
            GESTE.Add (Level_4_Front'Access, 3);


            Chests.Init ((1 .. 0 => <>)); -- No Chests
            Monsters.Init (Game_Assets.level_4.Monsters.Objects);

         when Lvl_5 =>
            Set_Finish (level_5.Markers.Finish);
            Move_To_Spawn (level_5.Markers.Spawn);

            Level_5_Backcolor.Move ((0, 0));
            GESTE.Add (Level_5_Backcolor'Access, 0);
            Level_5_Back.Move ((0, 0));
            Level_5_Back.Enable_Collisions;
            GESTE.Add (Level_5_Back'Access, 1);
            Level_5_Front.Move ((0, 0));
            Level_5_Front.Enable_Collisions;
            GESTE.Add (Level_5_Front'Access, 3);

            Monsters.Init (Game_Assets.level_5.Monsters.Objects);
            Chests.Init (Game_Assets.level_5.Chests.Objects);

         when Lvl_6 =>
            Set_Finish (level_6.Markers.Finish);
            Move_To_Spawn (level_6.Markers.Spawn);

            Level_6_Backcolor.Move ((0, 0));
            GESTE.Add (Level_6_Backcolor'Access, 0);
            Level_6_Back.Move ((0, 0));
            Level_6_Back.Enable_Collisions;
            GESTE.Add (Level_6_Back'Access, 1);
            Level_6_Front.Move ((0, 0));
            Level_6_Front.Enable_Collisions;
            GESTE.Add (Level_6_Front'Access, 3);

            Monsters.Init (Game_Assets.level_6.Monsters.Objects);
            Chests.Init (Game_Assets.level_6.Chests.Objects);

         when Lvl_7 =>
            Set_Finish (level_7.Markers.Finish);
            Move_To_Spawn (level_7.Markers.Spawn);

            Level_7_Backcolor.Move ((0, 0));
            GESTE.Add (Level_7_Backcolor'Access, 0);
            Level_7_Back.Move ((0, 0));
            Level_7_Back.Enable_Collisions;
            GESTE.Add (Level_7_Back'Access, 1);
            Level_7_Front.Move ((0, 0));
            Level_7_Front.Enable_Collisions;
            GESTE.Add (Level_7_Front'Access, 3);

            Monsters.Init (Game_Assets.level_7.Monsters.Objects);
            Chests.Init (Game_Assets.level_7.Chests.Objects);

         when Lvl_8 =>
            Set_Finish (level_8.Markers.Finish);
            Move_To_Spawn (level_8.Markers.Spawn);

            Level_8_Backcolor.Move ((0, 0));
            GESTE.Add (Level_8_Backcolor'Access, 0);
            Level_8_Back.Move ((0, 0));
            Level_8_Back.Enable_Collisions;
            GESTE.Add (Level_8_Back'Access, 1);
            Level_8_Front.Move ((0, 0));
            Level_8_Front.Enable_Collisions;
            GESTE.Add (Level_8_Front'Access, 3);

            Monsters.Init (Game_Assets.level_8.Monsters.Objects);
            Chests.Init (Game_Assets.level_8.Chests.Objects);

      end case;
   end Enter;

   ---------------
   -- Open_Exit --
   ---------------

   procedure Open_Exit is
   begin
      Finish_Sprite.Set_Tile (Finish_Tile);
      Finish_Sprite.Enable_Collisions (False);
      Sound.Play_Exit_Open;
   end Open_Exit;

   ---------------
   -- Test_Exit --
   ---------------

   function Test_Exit (Pt : GESTE.Pix_Point) return Boolean
   is (Pt.X in Finish_Position.X .. Finish_Position.X + Tile_Size
       and then
       Pt.Y in Finish_Position.Y .. Finish_Position.Y + Tile_Size);

end Levels;
