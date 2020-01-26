--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with VirtAPU; use VirtAPU;

package Music_2 is

   C_32nd     : constant Command := (Wait_Ticks, 1);
   C_16th     : constant Command := (Wait_Ticks, C_32nd.Ticks * 2);
   C_8th     : constant Command := (Wait_Ticks, C_16th.Ticks * 2);
   C_Quarter : constant Command := (Wait_Ticks, C_8th.Ticks * 2);
   C_Half    : constant Command := (Wait_Ticks, C_Quarter.Ticks * 2);
   C_Whole   : constant Command := (Wait_Ticks, C_Half.Ticks * 2);
   C_Double  : constant Command := (Wait_Ticks, C_Whole.Ticks * 2);
   C_Long    : constant Command := (Wait_Ticks, C_Double.Ticks * 2);

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
     Kick &
     C_Whole &
     Snare &
     C_Whole &
     Kick &
     C_Whole &
     Snare &
     C_Whole;

   Drums : aliased constant Command_Array :=
     Beat_1;

   Bass_1 : constant Command_Array :=
     C3 & C_Half & Off &
     C_Quarter &
     As2 & C_Half & Off &
     C_Quarter &
     C3 & C_Half & Off &
     C_Double;

   Bass_2 : constant Command_Array :=
     Gs2 & C_Quarter & Off &
     C_Half &
     Ds3 & C_Quarter & Off &
     C_Half &
     Gs2 & C_Quarter & Off &
     C_Quarter &
     G2 & C_Quarter & Off &
     C_Half &
     As2 & C_Quarter & Off &
     C_Half &
     B2 & C_Quarter & Off &
     C_Quarter;

   Bass_3 : constant Command_Array :=
     C3 & C_Half & Off &
     C_Quarter &
     C3 & C_Quarter & Off &
     C_Quarter &
     As2 & C_Quarter &
     C3 & C_Quarter & Off &
     C_Quarter &
     C_Quarter & C_Quarter & C_Quarter & C_Quarter &
     C_Quarter & C_Quarter & C_Quarter & C_Quarter;

   Bass_4 : constant Command_Array :=
     Gs2 & C_Quarter & Off &
     C_Half &
     Ds3 & C_Quarter & Off &
     C_Half &
     Gs2 & C_Quarter & Off &
     C_Quarter &
     G2 & C_Quarter & Off &
     C_Half &
     D3 & C_Quarter & Off &
     C_Half &
     G2 & C_Quarter & Off &
     C_Quarter;

   Bass : aliased constant Command_Array :=
     Bass_1 & Bass_2 & Bass_3 & Bass_4;

end Music_2;
