--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with Game_Assets; use Game_Assets;

with GESTE;

package Monsters is

   Max_Nbr_Of_Monsters : constant := 5;

   procedure Init (Objects : Object_Array)
     with Pre => Objects'Length <= Max_Nbr_Of_Monsters;

   function Check_Hit (Pt     : GESTE.Pix_Point;
                       Lethal : Boolean)
                       return Boolean;
   --  Return True if the Pt is within one of the monter. If Lethal is True, the
   --  monster is killed.

   function All_Killed return Boolean;

   procedure Update;

end Monsters;
