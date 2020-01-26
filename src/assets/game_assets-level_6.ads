with GESTE;
with GESTE.Grid;
pragma Style_Checks (Off);
package Game_Assets.level_6 is

   --  level_6
   Width       : constant := 20;
   Height      : constant := 16;
   Tile_Width  : constant := 8;
   Tile_Height : constant := 8;

   --  Backcolor
   package Backcolor is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 2, 2, 9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
         ( 0, 2, 2, 2, 2, 2, 2, 2, 2, 9, 2, 2, 67, 2, 2, 2))      ;
   end Backcolor;

   --  Back
   package Back is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 78, 66, 66, 66, 66, 66, 66, 79, 66, 66, 66, 66, 66, 66, 66, 79),
         ( 80, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 49, 0, 0, 61),
         ( 80, 70, 70, 70, 70, 70, 61, 70, 70, 70, 70, 70, 61, 70, 70, 61),
         ( 80, 0, 0, 0, 0, 0, 61, 0, 0, 0, 0, 0, 72, 0, 0, 61),
         ( 80, 0, 0, 0, 0, 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 80, 0, 0, 0, 0, 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 0, 0, 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 0, 0, 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 61),
         ( 80, 0, 0, 0, 0, 0, 61, 0, 0, 49, 0, 0, 0, 0, 0, 61),
         ( 80, 70, 70, 70, 70, 70, 61, 70, 70, 61, 70, 70, 70, 49, 50, 60),
         ( 80, 0, 0, 0, 0, 0, 61, 0, 0, 61, 0, 0, 0, 61, 67, 0),
         ( 80, 0, 0, 0, 0, 0, 72, 0, 0, 72, 0, 0, 0, 61, 67, 0),
         ( 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61, 67, 0),
         ( 80, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61, 67, 0),
         ( 80, 0, 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61, 67, 0),
         ( 83, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 60, 67, 0))      ;
   end Back;

   --  Front
   package Front is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 77, 75, 75, 75, 75, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 84, 0, 89, 89, 90, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 76, 0, 0, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 77, 75, 75, 75, 75, 81, 0, 0, 0, 0, 0, 0, 0, 73, 75),
         ( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, 0),
         ( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91, 0),
         ( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, 0),
         ( 0, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 76, 0),
         ( 0, 87, 75, 74, 75, 75, 75, 74, 75, 75, 75, 74, 75, 75, 92, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))      ;
   end Front;

   package Monsters is
      Objects : Object_Array :=
        (
           0 => (
            Kind => POINT_OBJ,
            Id   =>  8,
            Name => null,
            X    =>  4.00000E+01,
            Y    =>  9.60000E+01,
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
            X    =>  9.60000E+01,
            Y    =>  7.20000E+01,
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
            X    =>  1.36000E+02,
            Y    =>  2.40000E+01,
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
            X    =>  8.00000E+00,
            Y    =>  5.60000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => TRUE,
            Tile_Id =>  4,
            Str => null
          ),
           1 => (
            Kind => POINT_OBJ,
            Id   =>  20,
            Name => new String'("Finish"),
            X    =>  6.40000E+01,
            Y    =>  1.28000E+02,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  61,
            Str => null
          )
        );
      Spawn : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  12,
        Name => new String'("Spawn"),
        X    =>  8.00000E+00,
        Y    =>  5.60000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => TRUE,
        Tile_Id =>  4,
        Str => null
        );
      Finish : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  20,
        Name => new String'("Finish"),
        X    =>  6.40000E+01,
        Y    =>  1.28000E+02,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  61,
        Str => null
        );
   end Markers;
end Game_Assets.level_6;
