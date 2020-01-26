with GESTE;
with GESTE.Grid;
pragma Style_Checks (Off);
package Game_Assets.Misc_Objects is

   --  Misc_Objects
   Width       : constant := 20;
   Height      : constant := 16;
   Tile_Width  : constant := 8;
   Tile_Height : constant := 8;

   --  Tile Layer 1
   package Tile_Layer_1 is
      Width  : constant :=  20;
      Height : constant :=  20;
      Data   : aliased GESTE.Grid.Grid_Data :=
  (( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))      ;
   end Tile_Layer_1;

   package Item is
      Objects : Object_Array :=
        (
           0 => (
            Kind => POINT_OBJ,
            Id   =>  1,
            Name => new String'("Chest_Closed"),
            X    =>  0.00000E+00,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  136,
            Str => null
          ),
           1 => (
            Kind => POINT_OBJ,
            Id   =>  2,
            Name => new String'("Chest_Open"),
            X    =>  0.00000E+00,
            Y    =>  2.40000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  69,
            Str => null
          ),
           2 => (
            Kind => POINT_OBJ,
            Id   =>  4,
            Name => new String'("Menu_Cursor"),
            X    =>  2.40000E+01,
            Y    =>  4.00000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  165,
            Str => null
          ),
           3 => (
            Kind => POINT_OBJ,
            Id   =>  5,
            Name => new String'("Empty_Tile"),
            X    =>  2.40000E+01,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  166,
            Str => null
          ),
           4 => (
            Kind => POINT_OBJ,
            Id   =>  7,
            Name => new String'("D0"),
            X    =>  4.80000E+01,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  167,
            Str => null
          ),
           5 => (
            Kind => POINT_OBJ,
            Id   =>  8,
            Name => new String'("D1"),
            X    =>  5.60000E+01,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  168,
            Str => null
          ),
           6 => (
            Kind => POINT_OBJ,
            Id   =>  9,
            Name => new String'("D2"),
            X    =>  6.40000E+01,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  169,
            Str => null
          ),
           7 => (
            Kind => POINT_OBJ,
            Id   =>  10,
            Name => new String'("D3"),
            X    =>  7.20000E+01,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  170,
            Str => null
          ),
           8 => (
            Kind => POINT_OBJ,
            Id   =>  11,
            Name => new String'("D4"),
            X    =>  8.00000E+01,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  171,
            Str => null
          ),
           9 => (
            Kind => POINT_OBJ,
            Id   =>  12,
            Name => new String'("D5"),
            X    =>  8.80000E+01,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  172,
            Str => null
          ),
           10 => (
            Kind => POINT_OBJ,
            Id   =>  13,
            Name => new String'("D6"),
            X    =>  9.60000E+01,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  173,
            Str => null
          ),
           11 => (
            Kind => POINT_OBJ,
            Id   =>  14,
            Name => new String'("D7"),
            X    =>  1.04000E+02,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  174,
            Str => null
          ),
           12 => (
            Kind => POINT_OBJ,
            Id   =>  15,
            Name => new String'("D8"),
            X    =>  1.12000E+02,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  175,
            Str => null
          ),
           13 => (
            Kind => POINT_OBJ,
            Id   =>  16,
            Name => new String'("D9"),
            X    =>  1.20000E+02,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  176,
            Str => null
          ),
           14 => (
            Kind => POINT_OBJ,
            Id   =>  17,
            Name => new String'("Dot"),
            X    =>  1.28000E+02,
            Y    =>  8.00000E+00,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  177,
            Str => null
          ),
           15 => (
            Kind => POINT_OBJ,
            Id   =>  20,
            Name => new String'("Coin"),
            X    =>  0.00000E+00,
            Y    =>  4.00000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  178,
            Str => null
          ),
           16 => (
            Kind => POINT_OBJ,
            Id   =>  22,
            Name => new String'("M1"),
            X    =>  0.00000E+00,
            Y    =>  5.60000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  57,
            Str => null
          ),
           17 => (
            Kind => POINT_OBJ,
            Id   =>  23,
            Name => new String'("M2"),
            X    =>  8.00000E+00,
            Y    =>  5.60000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  118,
            Str => null
          ),
           18 => (
            Kind => POINT_OBJ,
            Id   =>  24,
            Name => new String'("M3"),
            X    =>  1.60000E+01,
            Y    =>  5.60000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  179,
            Str => null
          ),
           19 => (
            Kind => POINT_OBJ,
            Id   =>  25,
            Name => new String'("M4"),
            X    =>  2.40000E+01,
            Y    =>  5.60000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  180,
            Str => null
          ),
           20 => (
            Kind => POINT_OBJ,
            Id   =>  26,
            Name => new String'("M5"),
            X    =>  3.20000E+01,
            Y    =>  5.60000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  120,
            Str => null
          ),
           21 => (
            Kind => POINT_OBJ,
            Id   =>  27,
            Name => new String'("M6"),
            X    =>  4.00000E+01,
            Y    =>  5.60000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  181,
            Str => null
          ),
           22 => (
            Kind => POINT_OBJ,
            Id   =>  28,
            Name => new String'("M7"),
            X    =>  4.80000E+01,
            Y    =>  5.60000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  182,
            Str => null
          ),
           23 => (
            Kind => POINT_OBJ,
            Id   =>  29,
            Name => new String'("P1"),
            X    =>  0.00000E+00,
            Y    =>  7.20000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  4,
            Str => null
          ),
           24 => (
            Kind => POINT_OBJ,
            Id   =>  30,
            Name => new String'("P2"),
            X    =>  8.00000E+00,
            Y    =>  7.20000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  183,
            Str => null
          ),
           25 => (
            Kind => POINT_OBJ,
            Id   =>  31,
            Name => new String'("P3"),
            X    =>  1.60000E+01,
            Y    =>  7.20000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  184,
            Str => null
          ),
           26 => (
            Kind => POINT_OBJ,
            Id   =>  32,
            Name => new String'("P4"),
            X    =>  2.40000E+01,
            Y    =>  7.20000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  185,
            Str => null
          ),
           27 => (
            Kind => POINT_OBJ,
            Id   =>  33,
            Name => new String'("P5"),
            X    =>  0.00000E+00,
            Y    =>  8.80000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  186,
            Str => null
          ),
           28 => (
            Kind => POINT_OBJ,
            Id   =>  34,
            Name => new String'("P6"),
            X    =>  8.00000E+00,
            Y    =>  8.80000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  187,
            Str => null
          ),
           29 => (
            Kind => POINT_OBJ,
            Id   =>  35,
            Name => new String'("P7"),
            X    =>  1.60000E+01,
            Y    =>  8.80000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  188,
            Str => null
          ),
           30 => (
            Kind => POINT_OBJ,
            Id   =>  36,
            Name => new String'("P8"),
            X    =>  2.40000E+01,
            Y    =>  8.80000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  189,
            Str => null
          ),
           31 => (
            Kind => POINT_OBJ,
            Id   =>  39,
            Name => new String'("P9"),
            X    =>  3.20000E+01,
            Y    =>  8.80000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  190,
            Str => null
          ),
           32 => (
            Kind => POINT_OBJ,
            Id   =>  40,
            Name => new String'("P10"),
            X    =>  4.00000E+01,
            Y    =>  8.80000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  191,
            Str => null
          ),
           33 => (
            Kind => POINT_OBJ,
            Id   =>  41,
            Name => new String'("P11"),
            X    =>  4.80000E+01,
            Y    =>  8.80000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  115,
            Str => null
          ),
           34 => (
            Kind => POINT_OBJ,
            Id   =>  42,
            Name => new String'("P12"),
            X    =>  5.60000E+01,
            Y    =>  8.80000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  192,
            Str => null
          ),
           35 => (
            Kind => POINT_OBJ,
            Id   =>  43,
            Name => new String'("P13"),
            X    =>  6.40000E+01,
            Y    =>  8.80000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  193,
            Str => null
          ),
           36 => (
            Kind => POINT_OBJ,
            Id   =>  44,
            Name => new String'("Bullet"),
            X    =>  4.00000E+01,
            Y    =>  2.40000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  113,
            Str => null
          ),
           37 => (
            Kind => POINT_OBJ,
            Id   =>  45,
            Name => new String'("Exit_Portal"),
            X    =>  2.40000E+01,
            Y    =>  2.40000E+01,
            Width =>  8.00000E+00,
            Height =>  8.00000E+00,
            Flip_Vertical => FALSE,
            Flip_Horizontal => FALSE,
            Tile_Id =>  194,
            Str => null
          )
        );
      Chest_Closed : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  1,
        Name => new String'("Chest_Closed"),
        X    =>  0.00000E+00,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  136,
        Str => null
        );
      Chest_Open : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  2,
        Name => new String'("Chest_Open"),
        X    =>  0.00000E+00,
        Y    =>  2.40000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  69,
        Str => null
        );
      Menu_Cursor : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  4,
        Name => new String'("Menu_Cursor"),
        X    =>  2.40000E+01,
        Y    =>  4.00000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  165,
        Str => null
        );
      Empty_Tile : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  5,
        Name => new String'("Empty_Tile"),
        X    =>  2.40000E+01,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  166,
        Str => null
        );
      D0 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  7,
        Name => new String'("D0"),
        X    =>  4.80000E+01,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  167,
        Str => null
        );
      D1 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  8,
        Name => new String'("D1"),
        X    =>  5.60000E+01,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  168,
        Str => null
        );
      D2 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  9,
        Name => new String'("D2"),
        X    =>  6.40000E+01,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  169,
        Str => null
        );
      D3 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  10,
        Name => new String'("D3"),
        X    =>  7.20000E+01,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  170,
        Str => null
        );
      D4 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  11,
        Name => new String'("D4"),
        X    =>  8.00000E+01,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  171,
        Str => null
        );
      D5 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  12,
        Name => new String'("D5"),
        X    =>  8.80000E+01,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  172,
        Str => null
        );
      D6 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  13,
        Name => new String'("D6"),
        X    =>  9.60000E+01,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  173,
        Str => null
        );
      D7 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  14,
        Name => new String'("D7"),
        X    =>  1.04000E+02,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  174,
        Str => null
        );
      D8 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  15,
        Name => new String'("D8"),
        X    =>  1.12000E+02,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  175,
        Str => null
        );
      D9 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  16,
        Name => new String'("D9"),
        X    =>  1.20000E+02,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  176,
        Str => null
        );
      Dot : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  17,
        Name => new String'("Dot"),
        X    =>  1.28000E+02,
        Y    =>  8.00000E+00,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  177,
        Str => null
        );
      Coin : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  20,
        Name => new String'("Coin"),
        X    =>  0.00000E+00,
        Y    =>  4.00000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  178,
        Str => null
        );
      M1 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  22,
        Name => new String'("M1"),
        X    =>  0.00000E+00,
        Y    =>  5.60000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  57,
        Str => null
        );
      M2 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  23,
        Name => new String'("M2"),
        X    =>  8.00000E+00,
        Y    =>  5.60000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  118,
        Str => null
        );
      M3 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  24,
        Name => new String'("M3"),
        X    =>  1.60000E+01,
        Y    =>  5.60000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  179,
        Str => null
        );
      M4 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  25,
        Name => new String'("M4"),
        X    =>  2.40000E+01,
        Y    =>  5.60000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  180,
        Str => null
        );
      M5 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  26,
        Name => new String'("M5"),
        X    =>  3.20000E+01,
        Y    =>  5.60000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  120,
        Str => null
        );
      M6 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  27,
        Name => new String'("M6"),
        X    =>  4.00000E+01,
        Y    =>  5.60000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  181,
        Str => null
        );
      M7 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  28,
        Name => new String'("M7"),
        X    =>  4.80000E+01,
        Y    =>  5.60000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  182,
        Str => null
        );
      P1 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  29,
        Name => new String'("P1"),
        X    =>  0.00000E+00,
        Y    =>  7.20000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  4,
        Str => null
        );
      P2 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  30,
        Name => new String'("P2"),
        X    =>  8.00000E+00,
        Y    =>  7.20000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  183,
        Str => null
        );
      P3 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  31,
        Name => new String'("P3"),
        X    =>  1.60000E+01,
        Y    =>  7.20000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  184,
        Str => null
        );
      P4 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  32,
        Name => new String'("P4"),
        X    =>  2.40000E+01,
        Y    =>  7.20000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  185,
        Str => null
        );
      P5 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  33,
        Name => new String'("P5"),
        X    =>  0.00000E+00,
        Y    =>  8.80000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  186,
        Str => null
        );
      P6 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  34,
        Name => new String'("P6"),
        X    =>  8.00000E+00,
        Y    =>  8.80000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  187,
        Str => null
        );
      P7 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  35,
        Name => new String'("P7"),
        X    =>  1.60000E+01,
        Y    =>  8.80000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  188,
        Str => null
        );
      P8 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  36,
        Name => new String'("P8"),
        X    =>  2.40000E+01,
        Y    =>  8.80000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  189,
        Str => null
        );
      P9 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  39,
        Name => new String'("P9"),
        X    =>  3.20000E+01,
        Y    =>  8.80000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  190,
        Str => null
        );
      P10 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  40,
        Name => new String'("P10"),
        X    =>  4.00000E+01,
        Y    =>  8.80000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  191,
        Str => null
        );
      P11 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  41,
        Name => new String'("P11"),
        X    =>  4.80000E+01,
        Y    =>  8.80000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  115,
        Str => null
        );
      P12 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  42,
        Name => new String'("P12"),
        X    =>  5.60000E+01,
        Y    =>  8.80000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  192,
        Str => null
        );
      P13 : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  43,
        Name => new String'("P13"),
        X    =>  6.40000E+01,
        Y    =>  8.80000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  193,
        Str => null
        );
      Bullet : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  44,
        Name => new String'("Bullet"),
        X    =>  4.00000E+01,
        Y    =>  2.40000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  113,
        Str => null
        );
      Exit_Portal : aliased constant Object := (
        Kind => POINT_OBJ,
        Id   =>  45,
        Name => new String'("Exit_Portal"),
        X    =>  2.40000E+01,
        Y    =>  2.40000E+01,
        Width =>  8.00000E+00,
        Height =>  8.00000E+00,
        Flip_Vertical => FALSE,
        Flip_Horizontal => FALSE,
        Tile_Id =>  194,
        Str => null
        );
   end Item;
end Game_Assets.Misc_Objects;
