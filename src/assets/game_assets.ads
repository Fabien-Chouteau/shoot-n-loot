with GESTE;
with GESTE.Maths_Types;
with GESTE_Config;

pragma Style_Checks (Off);
package Game_Assets is


   Palette : aliased GESTE.Palette_Type := (
      0 =>  10067,
      1 =>  64278,
      2 =>  0,
      3 =>  36308,
      4 =>  18363,
      5 =>  29149,
      6 =>  392,
      7 =>  1162,
      8 =>  52619,
      9 =>  34954,
      10 =>  22533,
      11 =>  27596,
      12 =>  62973,
      13 =>  26185,
      14 =>  64110,
      15 =>  18364,
      16 =>  11725,
      17 =>  26259,
      18 =>  58756,
      19 =>  55774,
      20 =>  62917,
      21 =>  44708,
      22 =>  27054,
      23 =>  1132,
      24 =>  49143,
      25 =>  22181,
      26 =>  49864,
      27 =>  44251,
      28 =>  62180,
      29 =>  42690,
      30 =>  58600,
      31 =>  59193,
      32 =>  59134,
      33 =>  33023,
      34 =>  6342,
      35 =>  45716,
      36 =>  15591,
      37 =>  56286,
      38 =>  42597,
      39 =>  51491,
      40 =>  46029,
      41 =>  48639,
      42 =>  24592,
      43 =>  10314,
      44 =>  12403,
      45 =>  11082,
      46 =>  80,
      47 =>  60250,
      48 =>  65535,
      49 =>  59199,
      50 =>  59343,
      51 =>  58669,
      52 =>  24840,
      53 =>  16638,
      54 =>  49404,
      55 =>  251,
      56 =>  16577,
      57 =>  136,
      58 =>  57343,
      59 =>  8642,
      60 =>  32239,
      61 =>  31182,
      62 =>  20876,
      63 =>  10306,
      64 =>  11363,
      65 =>  1057,
      66 =>  21933,
      67 =>  31183,
      68 =>  19556,
      69 =>  30126,
      70 =>  10307,
      71 =>  1,
      72 =>  20877,
      73 =>  9250,
      74 =>  38399,
      75 =>  33020,
      76 =>  16894,
      77 =>  9065);

   type Object_Kind is (Rectangle_Obj, Point_Obj,
     Ellipse_Obj, Polygon_Obj, Tile_Obj, Text_Obj);

   type String_Access is access all String;

   type Object
     (Kind : Object_Kind := Rectangle_Obj)
   is record
      Name           : String_Access;
      Id             : Natural;
      X              : GESTE.Maths_Types.Value;
      Y              : GESTE.Maths_Types.Value;
      Width          : GESTE.Maths_Types.Value;
      Height         : GESTE.Maths_Types.Value;
      Str            : String_Access;
      Flip_Vertical  : Boolean;
      Flip_Horizontal: Boolean;
      Tile_Id        : GESTE_Config.Tile_Index;
   end record;

   type Object_Array is array (Natural range <>)
      of Object;

end Game_Assets;
