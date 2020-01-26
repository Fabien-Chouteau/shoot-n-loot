with GESTE;
with GESTE.Grid;
pragma Style_Checks (Off);
package Game_Assets.level_7 is

   --  level_7
   Width       : constant := 20;
   Height      : constant := 16;
   Tile_Width  : constant := 8;
   Tile_Height : constant := 8;

   --  Backcolor
   package Backcolor is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2),
         ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2))      ;
   end Backcolor;

   --  Back
   package Back is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 78, 66, 66, 79, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 79),
         ( 80, 0, 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 61, 0, 0, 49, 50, 51, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 61, 0, 0, 61, 78, 93, 0, 0, 0, 49, 50, 50, 60),
         ( 80, 0, 0, 61, 0, 0, 61, 80, 0, 0, 0, 0, 72, 66, 79, 67),
         ( 80, 0, 0, 61, 0, 0, 61, 80, 0, 0, 0, 0, 0, 0, 61, 67),
         ( 80, 0, 0, 61, 0, 0, 61, 80, 0, 0, 0, 0, 0, 0, 61, 67),
         ( 80, 0, 0, 61, 0, 0, 61, 80, 0, 0, 0, 0, 0, 0, 61, 67),
         ( 80, 0, 0, 72, 0, 0, 61, 80, 0, 0, 0, 0, 49, 50, 60, 67),
         ( 80, 0, 0, 0, 0, 0, 61, 83, 51, 0, 0, 0, 72, 66, 66, 79),
         ( 80, 0, 0, 0, 0, 0, 61, 78, 93, 0, 0, 0, 0, 0, 0, 61),
         ( 83, 50, 51, 0, 0, 49, 60, 80, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 67, 67, 80, 0, 0, 61, 67, 83, 50, 50, 50, 0, 0, 50, 50, 60),
         ( 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 0, 0, 10, 9, 0),
         ( 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 0, 0, 9, 10, 0),
         ( 9, 10, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 9, 0),
         ( 10, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 10, 0),
         ( 9, 10, 9, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 10, 9, 0),
         ( 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 0, 9, 10, 0))      ;
   end Back;

   --  Front
   package Front is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 84, 0, 82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 84, 0, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 82, 84, 0, 0, 84, 0, 0, 0, 70, 70, 70, 0, 0, 0, 0),
         ( 0, 0, 84, 0, 0, 84, 0, 0, 0, 0, 0, 85, 0, 0, 0, 0),
         ( 0, 0, 85, 0, 0, 85, 0, 0, 0, 0, 0, 0, 94, 95, 0, 0),
         ( 81, 75, 75, 81, 75, 75, 81, 81, 75, 75, 96, 0, 94, 95, 0, 0),
         ( 0, 0, 86, 0, 0, 86, 0, 0, 0, 0, 0, 0, 94, 95, 0, 0),
         ( 0, 0, 85, 0, 0, 84, 0, 0, 0, 0, 0, 86, 0, 0, 0, 0),
         ( 0, 82, 0, 0, 0, 84, 0, 0, 0, 70, 70, 70, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 56, 34, 35, 97, 0, 0, 0, 0, 0, 0, 0, 27, 0, 0),
         ( 0, 0, 63, 30, 30, 29, 30, 31, 30, 31, 64, 0, 0, 13, 0, 0),
         ( 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 16, 0, 0),
         ( 0, 0, 38, 39, 0, 0, 0, 0, 0, 0, 0, 0, 22, 19, 0, 0),
         ( 0, 0, 40, 0, 0, 52, 53, 0, 0, 0, 0, 0, 0, 28, 0, 0),
         ( 0, 0, 56, 35, 36, 56, 34, 35, 36, 34, 35, 36, 0, 0, 0, 0))      ;
   end Front;

   package Monsters is
      Objects : Object_Array :=
        (
           0 => (
            Kind => POINT_OBJ,
            Id   =>  8,
            Name => null,
            X    =>  8.00000E+00,
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
            X    =>  4.80000E+01,
            Y    =>  4.80000E+01,
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
            X    =>  1.07818E+02,
            Y    =>  1.04000E+02,
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
            X    =>  1.44000E+02,
            Y    =>  4.00000E+01,
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
            X    =>  1.04000E+02,
            Y    =>  4.00000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
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
            X    =>  1.60000E+01,
            Y    =>  2.40000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => TRUE,
            Tile_Id =>  4,
            Str => null
          ),
           1 => (
            Kind => POINT_OBJ,
            Id   =>  24,
            Name => new String'("Finish"),
            X    =>  1.52000E+02,
            Y    =>  1.04000E+02,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  5,
            Str => null
          )
        );
      Spawn : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  12,
        Name => new String'("Spawn"),
        X    =>  1.60000E+01,
        Y    =>  2.40000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => TRUE,
        Tile_Id =>  4,
        Str => null
        );
      Finish : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  24,
        Name => new String'("Finish"),
        X    =>  1.52000E+02,
        Y    =>  1.04000E+02,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  5,
        Str => null
        );
   end Markers;
end Game_Assets.level_7;
