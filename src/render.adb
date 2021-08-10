--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with HAL;            use HAL;
with PyGamer.Screen;
with PyGamer.Time;
with PyGamer.Controls;
use PyGamer;

with Sound;

package body Render is

   Buffer_Size : constant Positive :=
     PyGamer.Screen.Width * PyGamer.Screen.Height;

   Render_Buffer : GESTE.Output_Buffer (1 .. Buffer_Size);

   -----------------
   -- Push_Pixels --
   -----------------

   procedure Push_Pixels (Buffer : GESTE.Output_Buffer) is
   begin
      PyGamer.Screen.Push_Pixels (Buffer'Address, Buffer'Length);
   end Push_Pixels;

   ----------------------
   -- Set_Drawing_Area --
   ----------------------

   procedure Set_Drawing_Area (Area : GESTE.Pix_Rect) is
   begin
      PyGamer.Screen.End_Pixel_TX;

      PyGamer.Screen.Set_Address (X_Start => HAL.UInt16 (Area.TL.X),
                                  X_End   => HAL.UInt16 (Area.BR.X),
                                  Y_Start => HAL.UInt16 (Area.TL.Y),
                                  Y_End   => HAL.UInt16 (Area.BR.Y));

      PyGamer.Screen.Start_Pixel_TX;
   end Set_Drawing_Area;

   ----------------
   -- Render_All --
   ----------------

   procedure Render_All (Background : GESTE_Config.Output_Color) is
   begin
      GESTE.Render_All
        (((0, 0), (Screen.Width - 1, Screen.Height - 1)),
         Background,
         Render_Buffer,
         Push_Pixels'Access,
         Set_Drawing_Area'Access);

      PyGamer.Screen.End_Pixel_TX;
   end Render_All;

   ------------------
   -- Render_Dirty --
   ------------------

   procedure Render_Dirty (Background : GESTE_Config.Output_Color) is
   begin
      GESTE.Render_Dirty
        (((0, 0), (Screen.Width - 1, Screen.Height - 1)),
         Background,
         Render_Buffer,
         Push_Pixels'Access,
         Set_Drawing_Area'Access);

      PyGamer.Screen.End_Pixel_TX;
   end Render_Dirty;

   ----------------------
   -- Scroll_New_Scene --
   ----------------------

   procedure Scroll_New_Scene (Background : GESTE_Config.Output_Color)
   is
      Period : constant Time.Time_Ms := 1000 / 60;
      Next_Release : Time.Time_Ms := Time.Clock + Period;
      Scroll : UInt8 := PyGamer.Screen.Width;
      Step : constant := 2;
      X    : Natural := 0;
   begin
      for Count in 1 .. PyGamer.Screen.Width / Step loop
         Scroll := Scroll - Step;

         Screen.Scroll (Scroll);

         --  Render one column of pixel at Width - Scroll
         GESTE.Render_All
           (((X, 0),
            (X + Step - 1, Screen.Height - 1)),
            Background,
            Render_Buffer,
            Push_Pixels'Access,
            Set_Drawing_Area'Access);

         X := X + Step;
         Screen.End_Pixel_TX;

         Sound.Tick;
         Controls.Scan;
         Time.Delay_Until (Next_Release);
         Next_Release := Next_Release + Period;
      end loop;
   end Scroll_New_Scene;

   ----------------------
   -- Background_Color --
   ----------------------

   function Background_Color return GESTE_Config.Output_Color
   is (To_RGB565 (51, 153, 204));

   ---------------
   -- To_RGB565 --
   ---------------

   function To_RGB565 (R, G, B : Unsigned_8) return Unsigned_16 is
      R16 : constant Unsigned_16 :=
        Shift_Right (Unsigned_16 (R), 3) and 16#1F#;
      G16 : constant Unsigned_16 :=
        Shift_Right (Unsigned_16 (G), 2) and 16#3F#;
      B16 : constant Unsigned_16 :=
        Shift_Right (Unsigned_16 (B), 3) and 16#1F#;
      RGB : constant Unsigned_16 :=
        (Shift_Left (R16, 11) or Shift_Left (G16, 5) or B16);
   begin
      return Shift_Right (RGB and 16#FF00#, 8) or
        (Shift_Left (RGB, 8) and 16#FF00#);
   end To_RGB565;

end Render;
