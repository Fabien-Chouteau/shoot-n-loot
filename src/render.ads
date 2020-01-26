--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with Interfaces; use Interfaces;

with GESTE;
with GESTE_Config;

package Render is

   procedure Push_Pixels (Buffer : GESTE.Output_Buffer);

   procedure Set_Drawing_Area (Area : GESTE.Pix_Rect);

   procedure Render_All (Background : GESTE_Config.Output_Color);

   procedure Render_Dirty (Background : GESTE_Config.Output_Color);

   procedure Scroll_New_Scene (Background : GESTE_Config.Output_Color);

   function Background_Color return GESTE_Config.Output_Color;

   function To_RGB565 (R, G, B : Unsigned_8) return Unsigned_16;

end Render;
