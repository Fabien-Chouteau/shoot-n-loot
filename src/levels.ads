--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with GESTE;

package Levels is

   type Level_Id is (Lvl_0, Lvl_1, Lvl_2, Lvl_3, Lvl_4, Lvl_5, Lvl_6, Lvl_7,
                     Lvl_8);

   procedure Enter (Id : Level_Id);
   --  Setup a level

   procedure Open_Exit;
   --  Open the exit tile of the current level

   function Test_Exit (Pt : GESTE.Pix_Point) return Boolean;
   --  Return True if Pt is within the exit tile of the current level

end Levels;
