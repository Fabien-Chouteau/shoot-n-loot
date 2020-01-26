--  Shoot'n'loot
--  Copyright (c) 2020 Fabien Chouteau

with HAL; use HAL;

with GESTE;
with GESTE.Tile_Bank;
with GESTE.Sprite.Animated;
with GESTE_Config;
with GESTE.Maths_Types; use GESTE.Maths_Types;
with GESTE.Physics;

with Game_Assets;
with Game_Assets.Tileset;
with Game_Assets.Misc_Objects;

with PyGamer.Screen;

with Projectile;
with Monsters;
with Sound;

package body Player is

   package Item renames Game_Assets.Misc_Objects.Item;

   Fire_Animation : aliased constant GESTE.Sprite.Animated.Animation_Array :=
     ((Item.P2.Tile_Id,  1),
      (Item.P3.Tile_Id,  1),
      (Item.P4.Tile_Id,  1),
      (Item.P5.Tile_Id,  1),
      (Item.P6.Tile_Id,  2),
      (Item.P7.Tile_Id,  2),
      (Item.P8.Tile_Id,  2),
      (Item.P9.Tile_Id,  2),
      (Item.P10.Tile_Id, 2),
      (Item.P11.Tile_Id, 2),
      (Item.P12.Tile_Id, 2),
      (Item.P13.Tile_Id, 2));

   type Player_Type (Bank       : not null GESTE.Tile_Bank.Const_Ref;
                     Init_Frame : GESTE_Config.Tile_Index)
   is limited new GESTE.Physics.Object with record
      Sprite : aliased GESTE.Sprite.Animated.Instance (Bank, Init_Frame);
      Alive : Boolean := True;
   end record;

   Tile_Bank : aliased GESTE.Tile_Bank.Instance
     (Game_Assets.Tileset.Tiles'Access,
      GESTE.No_Collisions,
      Game_Assets.Palette'Access);

   P : aliased Player_Type (Tile_Bank'Access, Item.P1.Tile_Id);

   Max_Jump_Frame : constant := 1;

   Jumping : Boolean := False;
   Do_Jump : Boolean := False;
   Jump_Cnt : Natural := 0;

   Going_Left   : Boolean := False;
   Going_Right  : Boolean := False;
   Firing       : Boolean := False;
   Grabing_Wall : Boolean := False;
   Facing_Left  : Boolean := False;

   type Collision_Points is array (Natural range <>) of GESTE.Pix_Point;

   --  Bounding Box points
   BB_Top : constant Collision_Points :=
     ((-1, -4), (1, -4));
   BB_Bottom : constant Collision_Points :=
     ((-1, 3), (1, 3));
   BB_Left : constant Collision_Points :=
     ((-3, 1), (-3, -1));
   BB_Right : constant Collision_Points :=
     ((2, 1), (2, -1));
   Bounding_Box : constant Collision_Points :=
     BB_Top & BB_Bottom & BB_Right & BB_Left;

   Left_Wall : constant Collision_Points :=
     (0 => (-4, 1));
   Right_Wall : constant Collision_Points :=
     (0 => (4, 1));

   Grounded : Boolean := False;

   Projs : array (1 .. 5) of Projectile.Instance
     (Tile_Bank'Access, Item.Bullet.Tile_Id);

   Show_Collision_Points : constant Boolean := False;

   function Collides (Points : Collision_Points) return Boolean;
   function Check_Monster_Collision return Boolean;

   --------------
   -- Collides --
   --------------

   function Collides (Points : Collision_Points) return Boolean is
      X : constant Integer := Integer (P.Position.X);
      Y : constant Integer := Integer (P.Position.Y);
   begin
      for Pt of Points loop

         if Show_Collision_Points then
            PyGamer.Screen.Set_Address (UInt16 (X + Pt.X),
                                        UInt16 (X + Pt.X),
                                        UInt16 (Y + Pt.Y),
                                        UInt16 (Y + Pt.Y));
            PyGamer.Screen.Start_Pixel_TX;
            PyGamer.Screen.Push_Pixels ((0 => UInt16'Last));
            PyGamer.Screen.End_Pixel_TX;
         end if;

         if
           X + Pt.X not in 0 .. PyGamer.Screen.Width - 1
           or else
             Y + Pt.Y not in 0 .. PyGamer.Screen.Height - 1
             or else
               GESTE.Collides ((X + Pt.X, Y + Pt.Y))
         then
            return True;
         end if;
      end loop;

      return False;
   end Collides;

   -----------------------------
   -- Check_Monster_Collision --
   -----------------------------

   function Check_Monster_Collision return Boolean is
      X : constant Integer := Integer (P.Position.X);
      Y : constant Integer := Integer (P.Position.Y);
   begin
      for Pt of Bounding_Box loop
         if Monsters.Check_Hit ((X + Pt.X,
                                Y + Pt.Y),
                                Lethal => False)
         then
            return True;
         end if;
      end loop;
      return False;
   end Check_Monster_Collision;

   -----------
   -- Spawn --
   -----------

   procedure Spawn is
   begin
      P.Alive := True;
      P.Set_Mass (Value (90.0));
      P.Sprite.Flip_Vertical (False);
      P.Set_Speed ((0.0, 0.0));
      GESTE.Add (P.Sprite'Access, 3);
      P.Sprite.Flip_Horizontal (True);

      for Prj of Projs loop
         Prj.Init;
      end loop;
   end Spawn;

   ----------
   -- Move --
   ----------

   procedure Move (Pt : GESTE.Pix_Point) is
   begin
      P.Set_Position (GESTE.Maths_Types.Point'(Value (Pt.X), Value (Pt.Y)));
      P.Sprite.Move ((Integer (P.Position.X) - 4,
                     Integer (P.Position.Y) - 4));
   end Move;

   --------------
   -- Position --
   --------------

   function Position return GESTE.Pix_Point
   is ((Integer (P.Position.X), Integer (P.Position.Y)));

   --------------
   -- Is_Alive --
   --------------

   function Is_Alive return Boolean
   is (P.Alive);

   ------------
   -- Update --
   ------------

   procedure Update is
      Old : constant Point := P.Position;
      Elapsed : constant Value := Value (1.0 / 60.0);

      Collision_To_Fix : Boolean;
   begin
      --  Check collision with monsters
      if Check_Monster_Collision then
         P.Sprite.Flip_Vertical (True);
         P.Alive := False;
      end if;

      if Going_Right then
         Facing_Left := False;
         P.Sprite.Flip_Horizontal (True);
      elsif Going_Left then
         Facing_Left := True;
         P.Sprite.Flip_Horizontal (False);
      end if;

      --  Lateral movements
      if Grounded then
         if Going_Right then
            P.Apply_Force ((14_000.0, 0.0));
         elsif Going_Left then
            P.Apply_Force ((-14_000.0, 0.0));
         else
            --  Friction on the floor
            P.Apply_Force (
                           (Value (Value (-900.0) * P.Speed.X),
                           0.0));
         end if;
      else
         if Going_Right then
            P.Apply_Force ((7_000.0, 0.0));

         elsif Going_Left then
            P.Apply_Force ((-7_000.0, 0.0));

         end if;
      end if;

      --  Gavity
      if not Grounded then
         P.Apply_Gravity (Value (-500.0));
      end if;

      --  Wall grab
      if not Grounded

        and then
          P.Speed.Y > 0.0 --  Going down

        and then
          --  Pushing against a wall
          ((Collides (Right_Wall))
           or else
           (Collides (Left_Wall)))
      then

         --  Friction against the wall
         P.Apply_Force ((0.0, -4_0000.0));

         Grabing_Wall := True;
      else
         Grabing_Wall := False;
      end if;

      --  Jump
      if Do_Jump then
         declare
            Jmp_X : Value := 0.0;
         begin
            if Grabing_Wall then
               --  Wall jump
               Jmp_X := 215_000.0;
               if Collides (Right_Wall) then
                  Jmp_X := -Jmp_X;
               end if;
            end if;

            P.Apply_Force ((Jmp_X, -900_000.0));
            Grounded := False;
            Jumping := True;
            Sound.Play_Jump;
         end;
      end if;

      P.Step (Elapsed);

      Grounded := False;
      Collision_To_Fix := False;

      if P.Speed.Y < 0.0 then
         --  Going up
         if Collides (BB_Top) then
            Collision_To_Fix := True;

            --  Cannot jump after touching a roof
            Jump_Cnt := Max_Jump_Frame + 1;

            --  Touching a roof, kill vertical speed
            P.Set_Speed ((P.Speed.X, Value (0.0)));

            --  Going back to previous Y coord
            P.Set_Position ((P.Position.X, Old.Y));
         end if;
      elsif P.Speed.Y > 0.0 then
         --  Going down
         if Collides (BB_Bottom) then
            Collision_To_Fix := True;

            Grounded := True;

            --  Can start jumping
            Jump_Cnt := 0;

            --  Touching a roof, kill vertical speed
            P.Set_Speed ((P.Speed.X, Value (0.0)));

            --  Going back to previous Y coord
            P.Set_Position ((P.Position.X, Old.Y));
         end if;
      end if;

      if P.Speed.X > 0.0 then
         --  Going right
         if Collides (BB_Right) then
            Collision_To_Fix := True;

            --  Touching a wall, kill horizontal speed
            P.Set_Speed ((Value (0.0), P.Speed.Y));

            --  Going back to previos X coord
            P.Set_Position ((Old.X, P.Position.Y));
         end if;
      elsif P.Speed.X < 0.0 then
         --  Going left
         if Collides (BB_Left) then
            Collision_To_Fix := True;

            --  Touching a wall, kill horizontal speed
            P.Set_Speed ((Value (0.0), P.Speed.Y));

            --  Going back to previous X coord
            P.Set_Position ((Old.X, P.Position.Y));
         end if;
      end if;

      --  Fix the collisions, one pixel at a time
      while Collision_To_Fix loop

         Collision_To_Fix := False;

         if Collides (BB_Top) then
            Collision_To_Fix := True;
            --  Try a new Y coord that do not collides
            P.Set_Position ((P.Position.X, P.Position.Y + 1.0));
         elsif Collides (BB_Bottom) then
            Collision_To_Fix := True;
            --  Try a new Y coord that do not collides
            P.Set_Position ((P.Position.X, P.Position.Y - 1.0));
         end if;

         if Collides (BB_Right) then
            Collision_To_Fix := True;
            --  Try to find X coord that do not collides
            P.Set_Position ((P.Position.X - 1.0, P.Position.Y));
         elsif Collides (BB_Left) then
            Collision_To_Fix := True;
            --  Try to find X coord that do not collides
            P.Set_Position ((P.Position.X + 1.0, P.Position.Y));
         end if;
      end loop;

      Jumping := Jumping and not Grounded;

      P.Sprite.Signal_Frame;
      P.Sprite.Move ((Integer (P.Position.X) - 4,
                     Integer (P.Position.Y) - 4));

      if Firing then

         Fire_Projectile :
         for Proj of Projs loop
            if not Proj.Alive then

               if Facing_Left then
                  Proj.Set_Speed ((-120.0, 0.0));
               else
                  Proj.Set_Speed ((120.0, 0.0));
               end if;

               Proj.Spawn (Pos => P.Position,
                           Time_To_Live => 2.0,
                           Priority     => 2);

               P.Sprite.Set_Animation (Fire_Animation'Access,
                                       Looping => False);
               Sound.Play_Gun;
               exit Fire_Projectile;
            end if;
         end loop Fire_Projectile;
      end if;

      for Proj of Projs loop
         Proj.Update (Elapsed);
         if Proj.Alive
           and then
           (Monsters.Check_Hit (Proj.Position, Lethal => True)
            or else
            GESTE.Collides (Proj.Position)
           )
         then
            Proj.Remove;
         end if;
      end loop;

      Do_Jump := False;
      Going_Left := False;
      Going_Right := False;
      Firing := False;

   end Update;

   ----------
   -- Jump --
   ----------

   procedure Jump is
   begin
      if Grounded
        or else
         Grabing_Wall
        or else
         (Jump_Cnt < Max_Jump_Frame)
      then
         Do_Jump := True;
         Jump_Cnt := Jump_Cnt + 1;
      end if;
   end Jump;

   ----------
   -- Fire --
   ----------

   procedure Fire is
   begin
      Firing := True;
   end Fire;

   ---------------
   -- Move_Left --
   ---------------

   procedure Move_Left is
   begin
      Going_Left := True;
   end Move_Left;

   ----------------
   -- Move_Right --
   ----------------

   procedure Move_Right is
   begin
      Going_Right := True;
   end Move_Right;

end Player;
