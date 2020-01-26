with GESTE;
with GESTE.Grid;
pragma Style_Checks (Off);
package Game_Assets.level_1 is

   --  level_1
   Width       : constant := 20;
   Height      : constant := 16;
   Tile_Width  : constant := 8;
   Tile_Height : constant := 8;

   --  Backcolor
   package Backcolor is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
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
  (( 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9),
         ( 9, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 10, 0, 10),
         ( 10, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 9, 0, 9),
         ( 9, 0, 0, 0, 9, 0, 0, 10, 0, 0, 9, 0, 0, 10, 0, 10),
         ( 10, 0, 0, 0, 10, 0, 0, 9, 0, 0, 10, 0, 0, 9, 0, 9),
         ( 9, 0, 0, 0, 9, 0, 0, 10, 0, 0, 9, 0, 0, 10, 0, 10),
         ( 10, 0, 0, 9, 10, 0, 0, 9, 0, 0, 10, 0, 0, 0, 0, 9),
         ( 9, 0, 0, 10, 9, 0, 0, 10, 0, 0, 9, 10, 9, 10, 9, 10),
         ( 10, 0, 0, 9, 10, 0, 0, 9, 0, 0, 0, 0, 0, 0, 10, 9),
         ( 9, 0, 0, 10, 9, 0, 0, 10, 0, 0, 9, 10, 0, 0, 9, 10),
         ( 10, 0, 0, 9, 10, 0, 0, 9, 0, 0, 10, 0, 0, 0, 10, 9),
         ( 9, 0, 0, 10, 9, 0, 0, 10, 0, 0, 9, 0, 0, 0, 9, 10),
         ( 10, 0, 0, 9, 10, 0, 0, 0, 0, 0, 10, 0, 0, 0, 10, 9),
         ( 9, 0, 0, 10, 9, 0, 0, 0, 0, 0, 9, 0, 0, 0, 9, 10),
         ( 10, 0, 0, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 0),
         ( 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0),
         ( 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0),
         ( 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 0, 9, 0),
         ( 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 0, 10, 0),
         ( 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 0, 9, 0))      ;
   end Back;

   --  Front
   package Front is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 13, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 16, 0, 0),
         ( 0, 0, 0, 0, 27, 0, 0, 19, 0, 0, 27, 0, 0, 19, 0, 0),
         ( 0, 0, 0, 43, 19, 0, 0, 28, 0, 0, 13, 0, 0, 28, 0, 0),
         ( 0, 0, 0, 0, 28, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 19, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 27, 0, 0, 0, 27, 0, 0, 28, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 13, 0, 0, 0, 13, 0, 0, 0, 0, 0, 0, 13, 0),
         ( 0, 0, 0, 16, 0, 0, 22, 16, 0, 0, 27, 0, 0, 26, 16, 0),
         ( 0, 0, 0, 19, 0, 0, 25, 19, 0, 0, 16, 0, 0, 0, 19, 0),
         ( 0, 0, 0, 19, 0, 0, 0, 28, 0, 0, 13, 0, 0, 0, 13, 0),
         ( 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 16, 0, 0, 44, 16, 0),
         ( 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 19, 0, 0, 11, 19, 0),
         ( 0, 0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))      ;
   end Front;

   package Chests is
      Objects : Object_Array :=
        (
           0 => (
            Kind => POINT_OBJ,
            Id   =>  5,
            Name => null,
            X    =>  1.36000E+02,
            Y    =>  1.12000E+02,
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
            Id   =>  1,
            Name => new String'("Spawn"),
            X    =>  8.00000E+00,
            Y    =>  1.20000E+02,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => TRUE,
            Tile_Id =>  4,
            Str => null
          ),
           1 => (
            Kind => POINT_OBJ,
            Id   =>  9,
            Name => new String'("Finish"),
            X    =>  1.52000E+02,
            Y    =>  1.12000E+02,
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
        Id   =>  1,
        Name => new String'("Spawn"),
        X    =>  8.00000E+00,
        Y    =>  1.20000E+02,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => TRUE,
        Tile_Id =>  4,
        Str => null
        );
      Finish : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  9,
        Name => new String'("Finish"),
        X    =>  1.52000E+02,
        Y    =>  1.12000E+02,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  5,
        Str => null
        );
   end Markers;
end Game_Assets.level_1;
