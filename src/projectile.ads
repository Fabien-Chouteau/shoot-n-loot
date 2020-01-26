--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with GESTE;
with GESTE.Sprite;
with GESTE.Tile_Bank;
with GESTE.Maths_Types;
with GESTE.Physics;
with GESTE_Config;

package Projectile is

   type Instance
     (Bank       : not null GESTE.Tile_Bank.Const_Ref;
      Init_Frame : GESTE_Config.Tile_Index)
   is tagged limited
   private;

   subtype Class is Instance'Class;
   type Ref is access all Class;

   procedure Init (This : in out Instance);

   function Alive (This : Instance) return Boolean;

   procedure Spawn (This         : in out Instance;
                    Pos          :        GESTE.Maths_Types.Point;
                    Time_To_Live :        GESTE.Maths_Types.Value;
                    Priority     :        GESTE.Layer_Priority)
     with Post => This.Alive;

   procedure Remove (This : in out Instance);

   procedure Set_Sprite (This : in out Instance;
                         Id   :        GESTE_Config.Tile_Index);

   function Position (This : Instance) return GESTE.Pix_Point;

   procedure Set_Speed (This : in out Instance;
                        S    :        GESTE.Maths_Types.Point);

   procedure Update (This    : in out Instance;
                     Elapsed :        GESTE.Maths_Types.Value);

private

   type Instance
     (Bank       : not null GESTE.Tile_Bank.Const_Ref;
      Init_Frame : GESTE_Config.Tile_Index)
   is tagged limited
      record
         Obj           : GESTE.Physics.Object;
         Sprite        : aliased GESTE.Sprite.Instance (Bank, Init_Frame);
         Speed         : GESTE.Maths_Types.Point;
         Time_To_Live  : GESTE.Maths_Types.Value := 0.0;
         Is_Alive      : Boolean := False;
      end record;

end Projectile;
