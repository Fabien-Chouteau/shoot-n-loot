--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with GESTE;

package Player is

   procedure Spawn;

   procedure Move (Pt : GESTE.Pix_Point);

   function Position return GESTE.Pix_Point;

   function Is_Alive return Boolean;

   procedure Update;

   procedure Jump;
   procedure Fire;
   procedure Move_Left;
   procedure Move_Right;
end Player;
