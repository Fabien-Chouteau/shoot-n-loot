--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with HAL; use HAL;

with GESTE;
with GESTE.Tile_Bank;
with GESTE.Grid;
with GESTE.Sprite;

with GESTE_Config; use GESTE_Config;

with Render;
with Game;
with Sound;

with PyGamer.Time;
with PyGamer.Controls;
use PyGamer;

with Game_Assets.title_screen;
with Game_Assets.Tileset;
with Game_Assets.Tileset_Collisions;
with Game_Assets.Misc_Objects;

package body Menus is

   Tile_Bank : aliased GESTE.Tile_Bank.Instance
     (Game_Assets.Tileset.Tiles'Access,
      Game_Assets.Tileset_Collisions.Tiles'Access,
      Game_Assets.Palette'Access);

   Back_Grid : aliased GESTE.Grid.Instance
     (Game_Assets.title_screen.Back.Data'Access,
      Tile_Bank'Access);

   Menu_Grid : aliased GESTE.Grid.Instance
     (Game_Assets.title_screen.Menu.Data'Access,
      Tile_Bank'Access);

   Help_Grid : aliased GESTE.Grid.Instance
     (Game_Assets.title_screen.Help.Data'Access,
      Tile_Bank'Access);

   Credits_Grid : aliased GESTE.Grid.Instance
     (Game_Assets.title_screen.Credits.Data'Access,
      Tile_Bank'Access);

   Cursor : aliased GESTE.Sprite.Instance
     (Tile_Bank'Access, Game_Assets.Misc_Objects.Item.Menu_Cursor.Tile_Id);

   type Selection_Kind is (Play, Help, Credits);

   Current_Selection : Selection_Kind := Play;

   Current_Screen    : Selection_Kind := Play;

   Cursor_Position : constant array (Selection_Kind) of GESTE.Pix_Point :=
     (Play    => (6 * Tile_Size, 10 * Tile_Size),
      Help    => (6 * Tile_Size, 11 * Tile_Size),
      Credits => (6 * Tile_Size, 12 * Tile_Size));

   Time_In_Game : Time.Time_Ms := 0;

   procedure Scroll_Screen (Screen : Selection_Kind);

   -------------------
   -- Scroll_Screen --
   -------------------

   procedure Scroll_Screen (Screen : Selection_Kind) is
   begin
      GESTE.Remove_All;

      Back_Grid.Move ((0, 0));
      GESTE.Add (Back_Grid'Access, 0);

      case Screen is
         when Play =>

            Cursor.Move ((Cursor_Position (Current_Selection)));
            GESTE.Add (Cursor'Access, 1);

            Menu_Grid.Move ((0, 0));
            GESTE.Add (Menu_Grid'Access, 1);

         when Help =>
            Help_Grid.Move ((0, 0));
            GESTE.Add (Help_Grid'Access, 1);
         when Credits =>
            Credits_Grid.Move ((0, 0));
            GESTE.Add (Credits_Grid'Access, 1);
      end case;

      Render.Scroll_New_Scene (Render.Background_Color);

      Current_Screen := Screen;

   end Scroll_Screen;

   ---------
   -- Run --
   ---------

   procedure Run is
      Period : constant Time.Time_Ms := 1000 / 60;
      Next_Release : Time.Time_Ms;
   begin
      Scroll_Screen (Play);
      Next_Release := Time.Clock;

      Sound.Play_Main_Theme;

      loop
         Controls.Scan;

         case Current_Screen is
            when Play =>

               --  Next menu item selection
               if Controls.Falling (Controls.Down)
                 or else
                  Controls.Falling (Controls.Sel)
               then
                  Sound.Play_Coin;
                  if Current_Selection = Selection_Kind'Last then
                     Current_Selection := Selection_Kind'First;
                  else
                     Current_Selection :=
                       Selection_Kind'Succ (Current_Selection);
                  end if;
               end if;

               --  Previous menu item selection
               if Controls.Falling (Controls.Up) then
                  Sound.Play_Coin;
                  if Current_Selection = Selection_Kind'First then
                     Current_Selection := Selection_Kind'Last;
                  else
                     Current_Selection :=
                       Selection_Kind'Pred (Current_Selection);
                  end if;
               end if;

               --  Enter menu page or return to start playing
               if Controls.Falling (Controls.Start)
                 or else
                  Controls.Falling (Controls.A)
                 or else
                  Controls.Falling (Controls.B)
               then
                  if Current_Selection = Play then
                     GESTE.Remove_All;

                     Sound.Play_Gameplay;

                     --  Start the game and wait for result
                     if Game.Game_Loop (Time_In_Game) then
                        --  Victory! Let's have a look at the credits
                        Scroll_Screen (Credits);
                     else
                        --  Game-over, back to the title screen
                        Scroll_Screen (Play);
                     end if;
                     Sound.Play_Main_Theme;
                  else
                     Scroll_Screen (Current_Selection);
                  end if;
                  Next_Release := Time.Clock;
               end if;

               --  Move the cursor
               Cursor.Move ((Cursor_Position (Current_Selection)));

            when others =>
               if (for some Button in Controls.Buttons
                   => Controls.Falling (Button))
               then
                  Scroll_Screen (Play);
                  Next_Release := Time.Clock;
               end if;
         end case;

         Sound.Tick;

         Render.Render_Dirty (Render.Background_Color);

         Time.Delay_Until (Next_Release);
         Next_Release := Next_Release + Period;
      end loop;
   end Run;

end Menus;
