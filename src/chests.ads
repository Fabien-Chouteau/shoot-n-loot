--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with Game_Assets; use Game_Assets;
with GESTE;
package Chests is

   Max_Nbr_Of_Chests : constant := 3;

   procedure Init (Objects : Object_Array)
     with Pre => Objects'Length <= Max_Nbr_Of_Chests;

   procedure Check_Chest_Found (Pt : GESTE.Pix_Point);

   function All_Open return Boolean;

   procedure Update;

end Chests;
