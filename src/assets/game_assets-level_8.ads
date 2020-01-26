with GESTE;
with GESTE.Grid;
pragma Style_Checks (Off);
package Game_Assets.level_8 is

   --  level_8
   Width       : constant := 20;
   Height      : constant := 16;
   Tile_Width  : constant := 8;
   Tile_Height : constant := 8;

   --  Backcolor
   package Backcolor is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1))      ;
   end Backcolor;

   --  Back
   package Back is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 0, 0, 7, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10),
         ( 0, 0, 8, 7, 10, 9, 0, 0, 10, 9, 10, 9, 0, 9, 10, 9),
         ( 0, 0, 0, 8, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 9, 10),
         ( 0, 0, 0, 0, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9),
         ( 0, 0, 0, 0, 0, 8, 7, 10, 9, 10, 9, 10, 0, 0, 0, 10),
         ( 0, 0, 0, 0, 0, 0, 8, 7, 10, 9, 10, 9, 0, 0, 0, 9),
         ( 0, 0, 0, 0, 0, 0, 0, 8, 7, 10, 9, 10, 0, 0, 0, 10),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 8, 7, 10, 9, 0, 0, 0, 9),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 7, 10, 0, 0, 0, 10),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 7, 0, 0, 0, 9),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 10),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 10),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 9),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99, 0, 6, 0))      ;
   end Back;

   --  Front
   package Front is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 0, 0, 19, 0, 0, 63, 31, 64, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 28, 0, 0, 41, 53, 0, 100, 29, 30, 64, 0, 16, 0, 0),
         ( 0, 0, 26, 16, 0, 54, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0),
         ( 0, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13),
         ( 0, 0, 0, 0, 25, 13, 0, 33, 34, 35, 36, 37, 0, 0, 0, 16),
         ( 0, 0, 0, 0, 0, 22, 19, 0, 0, 0, 0, 0, 70, 70, 70, 19),
         ( 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 59, 13),
         ( 0, 0, 0, 0, 0, 0, 0, 43, 13, 0, 0, 0, 0, 65, 45, 16),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 0, 0, 46, 19),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 13, 0, 70, 70, 70, 13),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 25, 16),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, 0),
         ( 0, 0, 0, 0, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0),
         ( 0, 0, 0, 0, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0),
         ( 0, 0, 0, 0, 20, 21, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0),
         ( 0, 0, 0, 0, 23, 24, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0))      ;
   end Front;

   package Monsters is
      Objects : Object_Array :=
        (
           0 => (
            Kind => POINT_OBJ,
            Id   =>  8,
            Name => null,
            X    =>  3.20000E+01,
            Y    =>  1.20000E+02,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  57,
            Str => null
          ),
           1 => (
            Kind => POINT_OBJ,
            Id   =>  15,
            Name => null,
            X    =>  6.40000E+01,
            Y    =>  1.20000E+02,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  57,
            Str => null
          ),
           2 => (
            Kind => POINT_OBJ,
            Id   =>  21,
            Name => null,
            X    =>  1.20000E+02,
            Y    =>  1.12000E+02,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  57,
            Str => null
          )
        );
   end Monsters;
   package Chests is
      Objects : Object_Array :=
        (
           0 => (
            Kind => POINT_OBJ,
            Id   =>  18,
            Name => null,
            X    =>  8.80000E+01,
            Y    =>  1.20000E+02,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  3,
            Str => null
          ),
           1 => (
            Kind => POINT_OBJ,
            Id   =>  25,
            Name => null,
            X    =>  8.00000E+00,
            Y    =>  6.40000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => TRUE,
            Tile_Id =>  3,
            Str => null
          ),
           2 => (
            Kind => POINT_OBJ,
            Id   =>  28,
            Name => null,
            X    =>  0.00000E+00,
            Y    =>  1.60000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => TRUE,
            Tile_Id =>  3,
            Str => null
          )
        );
   end Chests;
   package Markers is
      Objects : Object_Array :=
        (
           0 => (
            Kind => POINT_OBJ,
            Id   =>  12,
            Name => new String'("Spawn"),
            X    =>  8.00000E+00,
            Y    =>  1.04000E+02,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => TRUE,
            Tile_Id =>  4,
            Str => null
          ),
           1 => (
            Kind => POINT_OBJ,
            Id   =>  26,
            Name => new String'("Finish"),
            X    =>  1.52000E+02,
            Y    =>  1.12000E+02,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  98,
            Str => null
          )
        );
      Spawn : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  12,
        Name => new String'("Spawn"),
        X    =>  8.00000E+00,
        Y    =>  1.04000E+02,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => TRUE,
        Tile_Id =>  4,
        Str => null
        );
      Finish : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  26,
        Name => new String'("Finish"),
        X    =>  1.52000E+02,
        Y    =>  1.12000E+02,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  98,
        Str => null
        );
   end Markers;
end Game_Assets.level_8;
