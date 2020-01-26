--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with GESTE;
with PyGamer.Time;

package Score_Display is

   procedure Init (Pos : GESTE.Pix_Point);

   procedure Update (Time_In_Game : PyGamer.Time.Time_Ms);

end Score_Display;

