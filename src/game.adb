--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with HAL; use HAL;

with Levels;
with Player;
with Render;
with Monsters;
with Chests;
with Score_Display;
with Sound;

with PyGamer.Controls;
use PyGamer;

with GESTE_Config; use GESTE_Config;
with GESTE;
with GESTE.Text;
with GESTE.Tile_Bank;
with GESTE.Grid;

with Game_Assets;
with Game_Assets.Tileset;
with Game_Assets.Tileset_Collisions;
with Game_Assets.title_screen;

package body Game is

   Tile_Bank : aliased GESTE.Tile_Bank.Instance
     (Game_Assets.Tileset.Tiles'Access,
      Game_Assets.Tileset_Collisions.Tiles'Access,
      Game_Assets.Palette'Access);

   Gameover_Grid : aliased GESTE.Grid.Instance
     (Game_Assets.title_screen.Gameover.Data'Access,
      Tile_Bank'Access);

   Victory_Grid : aliased GESTE.Grid.Instance
     (Game_Assets.title_screen.Victory.Data'Access,
      Tile_Bank'Access);

   Back_Grid : aliased GESTE.Grid.Instance
     (Game_Assets.title_screen.Back.Data'Access,
      Tile_Bank'Access);

   procedure Game_Over;
   procedure Victory (Time_In_Game : Time.Time_Ms);

   ---------------
   -- Game_Over --
   ---------------

   procedure Game_Over is
      Period : constant Time.Time_Ms := 1000 / 60;
      Next_Release : Time.Time_Ms;
   begin

      Sound.Play_Gameover;

      Gameover_Grid.Move ((0, 0));
      GESTE.Add (Gameover_Grid'Access, 10);
      Render.Render_All (Render.Background_Color);

      Next_Release := Time.Clock + Period;

      loop
         Controls.Scan;
         if (for some Button in Controls.Buttons
             => Controls.Falling (Button))
         then
            GESTE.Remove_All;
            return;
         end if;

         Sound.Tick;

         Time.Delay_Until (Next_Release);
         Next_Release := Next_Release + Period;
      end loop;
   end Game_Over;

   -------------
   -- Victory --
   -------------

   procedure Victory (Time_In_Game : Time.Time_Ms) is
      Period : constant Time.Time_Ms := 1000 / 60;
      Next_Release : Time.Time_Ms;
   begin
      Sound.Play_Victory;

      GESTE.Remove_All;

      Back_Grid.Move ((0, 0));
      GESTE.Add (Back_Grid'Access, 1);

      Victory_Grid.Move ((0, 0));
      GESTE.Add (Victory_Grid'Access, 2);

      Score_Display.Init ((10 * Tile_Size, 12 * Tile_Size));
      Score_Display.Update (Time_In_Game);

      Render.Scroll_New_Scene (Render.Background_Color);

      Next_Release := Time.Clock + Period;

      loop
         Controls.Scan;
         if (for some Button in Controls.Buttons
             => Controls.Falling (Button))
         then
            return;
         end if;

         Sound.Tick;
         Time.Delay_Until (Next_Release);
         Next_Release := Next_Release + Period;
      end loop;
   end Victory;

   ---------------
   -- Game_Loop --
   ---------------

   function Game_Loop (Time_In_Game : in out PyGamer.Time.Time_Ms)
                       return Boolean
   is
      use type Levels.Level_Id;

      Current_Level : Levels.Level_Id := Levels.Lvl_0;

      Period : constant Time.Time_Ms := 1000 / 60;
      Next_Release : Time.Time_Ms;

      Frame_Count : UInt32 := 0;

      Exit_Open : Boolean := False;
   begin
      Time_In_Game := 0;

      Levels.Enter (Current_Level);
      Score_Display.Update (Time_In_Game);

      Render.Scroll_New_Scene (Render.Background_Color);

      Next_Release := Time.Clock + Period;

      loop
         --  Check game-over
         if not Player.Is_Alive then
            Game_Over;
            return False;
         end if;

         --  Open exit and check victory
         if not Exit_Open
           and then
            Chests.All_Open
           and then
            Monsters.All_Killed
         then
            Exit_Open := True;
            Levels.Open_Exit;
         end if;

         if Exit_Open then

            if Levels.Test_Exit (Player.Position) then
               Sound.Play_Exit_Taken;
               if Current_Level = Levels.Level_Id'Last then
                  Victory (Time_In_Game);
                  return True;
               end if;

               Current_Level := Levels.Level_Id'Succ (Current_Level);

               Levels.Enter (Current_Level);
               Exit_Open := False;
               Score_Display.Update (Time_In_Game);
               Render.Scroll_New_Scene (Render.Background_Color);

               Next_Release := Time.Clock + Period;
            end if;
         end if;


         Controls.Scan;
         if Controls.Falling (Controls.A) then
            Player.Jump;
         end if;
         if Controls.Falling (Controls.B) then
            Player.Fire;
         end if;
         if Controls.Pressed (Controls.Left) then
            Player.Move_Left;
         end if;
         if Controls.Pressed (Controls.Right) then
            Player.Move_Right;
         end if;

         Player.Update;
         Monsters.Update;
         Chests.Check_Chest_Found (Player.Position);
         Chests.Update;
         Score_Display.Update (Time_In_Game);

         Render.Render_Dirty (Render.Background_Color);
         Frame_Count := Frame_Count + 1;

         Sound.Tick;

         Time.Delay_Until (Next_Release);
         Next_Release := Next_Release + Period;
         Time_In_Game := Time_In_Game + Period;
      end loop;
   end Game_Loop;
end Game;
