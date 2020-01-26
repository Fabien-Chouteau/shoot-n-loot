--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with Interfaces;

with VirtAPU; use VirtAPU;

with PyGamer.Audio; use PyGamer.Audio;

with Music_2;

package body Sound is

   C_32nd     : constant Command := (Wait_Ticks, 1);
   C_16th     : constant Command := (Wait_Ticks, C_32nd.Ticks * 2);
   C_8th     : constant Command := (Wait_Ticks, C_16th.Ticks * 2);
   C_Quarter : constant Command := (Wait_Ticks, C_8th.Ticks * 2);
   C_Half    : constant Command := (Wait_Ticks, C_Quarter.Ticks * 2);
   C_Whole   : constant Command := (Wait_Ticks, C_Half.Ticks * 2);
   C_Double  : constant Command := (Wait_Ticks, C_Whole.Ticks * 2);

   Coin_Seq : aliased constant Command_Array :=
     ((Set_Decay, 10),
      (Set_Mode, Pulse),
      (Set_Width, 25),
      (Set_Sweep, None, 1, 0),
      B4,
      (Wait_Ticks, 3),
      E5,
      (Wait_Ticks, 5),
      Off
     );

   Monster_Dead_Seq : aliased constant Command_Array :=
     ((Set_Decay, 20),
      (Set_Mode, Pulse),
      (Set_Width, 25),
      (Set_Sweep, Down, 10, 1),
      C3, C_Quarter, Off
     );

   Game_Over_Seq : aliased constant Command_Array :=
     ((Set_Decay, 20),
      (Set_Mode, Pulse),
      (Set_Width, 25),
      Fs3, C_Quarter, Off,
      C_Half,
      Cs3, C_8th, Off, C_8th,
      C_Quarter,
      C3, Off, C_8th,
      Cs3, Off, C_8th,
      C3, C_Half, Off
     );

   Exit_Open_Seq : aliased constant Command_Array :=
     ((Set_Decay, 20),
      (Set_Mode, Pulse),
      (Set_Width, 25),
      (Set_Sweep, None, 1, 0),
      C4, C_16th, Off, C_16th,
      Ds4, C_16th, Off, C_16th,
      G4, C_16th, Off, C_16th,
      As4, C_16th, Off
     );

   Exit_Taken_Seq : aliased constant Command_Array :=
     ((Set_Decay, 20),
      (Set_Mode, Pulse),
      (Set_Width, 25),
      (Set_Sweep, None, 1, 0),
      As4, C_16th, Off, C_16th,
      G4, C_16th, Off, C_16th,
      Ds4, C_16th, Off, C_16th,
      C4, C_16th, Off
     );

   Victory_Seq : aliased constant Command_Array :=
     ((Set_Decay, 20),
      (Set_Mode, Pulse),
      (Set_Width, 25),
      C_Double,
      C4, C_16th, Off, C_16th,
      Ds4, C_16th, Off, C_16th,
      G4, C_16th, Off, C_16th,
      As4, C_16th, Off, C_16th,
      As4, C_16th, Off, C_16th,
      As4, C_16th, Off, C_16th,
      Ds5, C_16th, Off, C_16th,
      As4, C_16th, Off, C_16th
     );

   Jump_Seq : aliased constant Command_Array :=
     ((Set_Decay, 20),
      (Set_Mode, Pulse),
      (Set_Sweep, Up, 7, 2),
      (Note_On, 220.0),
      C_8th,
      Off
     );

   Gun_Seq : aliased constant Command_Array :=
     ((Set_Mode, Noise_1),
      (Set_Decay, 15),
      (Set_Sweep, Up, 13, 0),
      (Set_Mode, Noise_1),
      (Note_On, 2000.0),
      Off
     );

   Kick : aliased constant Command_Array :=
     ((Set_Decay, 6),
      (Set_Sweep, Up, 7, 0),
      (Set_Mode, Noise_2),
      (Note_On, 150.0),
      Off
     );

   Snare : aliased constant Command_Array :=
     ((Set_Decay, 6),
      (Set_Mode, Noise_1),
      (Note_On, 2000.0),
      Off
     );

   Hi_Hat : aliased constant Command_Array :=
     ((Set_Decay, 2),
      (Set_Mode, Noise_1),
      (Note_On, 10000.0),
      Off
     );

   Beat_1 : constant Command_Array :=
     Kick & C_Half &
     Hi_Hat & C_Half &
     Snare & C_Half &
     Hi_Hat & C_Half &
     Kick & C_Half &
     Hi_Hat & C_Half &
     Snare & C_Half &
     Hi_Hat & C_Half;

   Beat_2 : constant Command_Array :=
     Kick & C_Half &
     Hi_Hat & C_Half &
     Snare & C_Half &
     Hi_Hat & C_Half &
     Kick & C_Half &
     Hi_Hat & C_Half &
     Snare & C_Half &
     Snare & C_Half;

   Beat_3 : constant Command_Array :=
     Kick & C_Half &
     Hi_Hat & C_Half &
     Snare & C_Half &
     Hi_Hat & C_Half &
     Kick & C_Half &
     Hi_Hat & C_Half &
     Snare & C_Half &
     Snare & C_Quarter &
     Snare & C_Quarter;

   Drums_Seq : aliased constant Command_Array :=
     Beat_1 & Beat_2 & Beat_3 & Beat_2;

   Bass_1 : constant Command_Array :=
     C2 & C_Half & Off &
     C_Half &
     C2 & C_Half & Off &
     C_Half &
     C2 & C_Half & Off &
     Ds2 & C_Half & Off &
     C_Half &
     Gs2 & C_Half & Off;

   Bass_2 : constant Command_Array :=
     C_Half &
     Ds2 & C_Half & Off &
     C_Half &
     Fs2 & C_Half & Off &
     C_Half &
     Ds2 & C_Half & Off &
     Fs2 & C_Half & Off &
     Ds2 & C_Half & Off;

   Bass_3 : constant Command_Array :=
     C_Half &
     Ds2 & C_Half & Off &
     C_Half &
     Fs2 & C_Half & Off &
     C_Half &
     Gs2 & C_Half & Off &
     Fs2 & C_Half & Off &
     C_Half;

   Bass_Seq : aliased constant Command_Array :=
     Bass_1 & Bass_2 & Bass_1 & Bass_3;

   Lead_1 : constant Command_Array :=
     C4 & Off &
     C_Whole & C_Whole & C_Half &
     Ds4 & Off &
     C_Whole &
     G4 &  Off &
     C_Whole & C_Whole & C_Whole &
     Fs4 & Off &
     C_Half &
     Gs4 & Off &
     C_Half &
     Ds4 & Off &
     C_Half;

   Lead_2 : constant Command_Array :=
     C4 & Off &
     C_Whole & C_Whole & C_Half &
     Ds4 & Off &
     C_Whole &
     Gs3 &  Off &
     C_Whole & C_Whole & C_Whole &
     G3 & Off &
     C_Half &
     As3 & Off &
     C_Half &
     B3 & Off &
     C_Half;

   Lead_3 : constant Command_Array :=
     C4 & Off &
     C_Whole & C_Whole & C_Half &
     G4 & Off &
     C_Half &
     As4 & Off &
     C_Half &
     Fs4 & Off &
     C_Whole & C_Whole & C_Whole &
     Gs4 & Off &
     C_Half &
     G4 & Off &
     C_Half &
     Ds4 & Off &
     C_Half;

   Lead_Seq : aliased constant Command_Array :=
     Lead_1 & Lead_2 & Lead_3 & Lead_2;

   Sample_Rate : constant Sample_Rate_Kind := SR_22050;
   APU : VirtAPU.Instance (5, 22_050);

   Player_FX : constant VirtAPU.Channel_ID := 1;
   World_FX  : constant VirtAPU.Channel_ID := 2;
   Drums     : constant VirtAPU.Channel_ID := 3;
   Bass      : constant VirtAPU.Channel_ID := 4;
   Lead      : constant VirtAPU.Channel_ID := 5;

   procedure Next_Samples is new VirtAPU.Next_Samples_UInt
     (Interfaces.Unsigned_16, PyGamer.Audio.Data_Array);

   procedure Audio_Callback (Left, Right : out PyGamer.Audio.Data_Array);

   --------------------
   -- Audio_Callback --
   --------------------

   procedure Audio_Callback (Left, Right : out PyGamer.Audio.Data_Array) is
   begin
      Next_Samples (APU, Left);
      Right := Left;
   end Audio_Callback;

   ----------
   -- Tick --
   ----------

   procedure Tick is
   begin
      APU.Tick;
   end Tick;

   ---------------
   -- Play_Coin --
   ---------------

   procedure Play_Coin is
   begin
      APU.Run (World_FX, Coin_Seq'Access);
   end Play_Coin;

   -----------------------
   -- Play_Monster_Dead --
   -----------------------

   procedure Play_Monster_Dead is
   begin
      APU.Run (World_FX, Monster_Dead_Seq'Access);
   end Play_Monster_Dead;

   --------------
   -- Play_Gun --
   --------------

   procedure Play_Gun is
   begin
      APU.Run (Player_FX, Gun_Seq'Access);
   end Play_Gun;

   ---------------
   -- Play_Jump --
   ---------------

   procedure Play_Jump is
   begin
      APU.Run (Player_FX, Jump_Seq'Access);
   end Play_Jump;

   --------------------
   -- Play_Exit_Open --
   --------------------

   procedure Play_Exit_Open is
   begin
      APU.Run (World_FX, Exit_Open_Seq'Access);
   end Play_Exit_Open;

   ---------------------
   -- Play_Exit_Taken --
   ---------------------

   procedure Play_Exit_Taken is
   begin
      APU.Run (World_FX, Exit_Taken_Seq'Access);
   end Play_Exit_Taken;

   -------------------
   -- Play_Gameover --
   -------------------

   procedure Play_Gameover is
   begin
      APU.Set_Volume (Drums, 0);
      APU.Note_Off (Bass);
      APU.Run (Bass, Empty_Seq, Looping => False);

      APU.Set_Volume (Bass, 0);
      APU.Note_Off (Bass);
      APU.Run (Bass, Empty_Seq, Looping => False);

      APU.Set_Volume (Lead, 50);
      APU.Run (Lead, Game_Over_Seq'Access, Looping => False);
   end Play_Gameover;

   ------------------
   -- Play_Victory --
   ------------------

   procedure Play_Victory is
   begin
      APU.Set_Volume (Drums, 0);
      APU.Note_Off (Bass);
      APU.Run (Bass, Empty_Seq, Looping => False);

      APU.Set_Volume (Bass, 0);
      APU.Note_Off (Bass);
      APU.Run (Bass, Empty_Seq, Looping => False);

      APU.Set_Volume (Lead, 50);
      APU.Run (Lead, Victory_Seq'Access, Looping => False);
   end Play_Victory;


   ---------------------
   -- Play_Main_Theme --
   ---------------------

   procedure Play_Main_Theme is
   begin
      APU.Run (Drums, Drums_Seq'Access, Looping => True);
      APU.Set_Volume (Drums, 50);

      APU.Set_Mode (Bass, Triangle);
      APU.Set_Decay (Bass, 7);
      APU.Set_Volume (Bass, 50);
      APU.Run (Bass, Bass_Seq'Access, Looping => True);

      APU.Set_Mode (Lead, Pulse);
      APU.Set_Decay (Lead, 40);
      APU.Set_Width (Lead, 25);
      APU.Set_Volume (Lead, 50);
      APU.Run (Lead, Lead_Seq'Access, Looping => True);
   end Play_Main_Theme;

   -------------------
   -- Play_Gameplay --
   -------------------

   procedure Play_Gameplay is
   begin
      APU.Run (Drums, Music_2.Drums'Access, Looping => True);
      APU.Set_Volume (Drums, 50);

      APU.Set_Mode (Bass, Triangle);
      APU.Set_Decay (Bass, 7);
      APU.Set_Volume (Bass, 50);
      APU.Run (Bass, Music_2.Bass'Access, Looping => True);

      APU.Set_Volume (Lead, 0);
      APU.Note_Off (Lead);
      APU.Run (Lead, Empty_Seq, Looping => False);
   end Play_Gameplay;

begin
   PyGamer.Audio.Set_Callback (Audio_Callback'Access, Sample_Rate);

   APU.Set_Rhythm (120, 60);

end Sound;
