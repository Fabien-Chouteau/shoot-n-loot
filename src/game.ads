--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with PyGamer.Time;

package Game is

   function Game_Loop (Time_In_Game : in out PyGamer.Time.Time_Ms)
                       return Boolean;
   --  Return True if the player won the game, False for game-over

end Game;
