//Крепление к экструдеру
THICKNESS = 4;		//толщина
MOUNT_HEIGHT = 57;	//высота крепления
WIDTH = 52;			//ширина
GAB = 12;			//вынос
HOLE_X = 9;			// положение отверстий крепления по X
HOLE_Y = 5;			// положение отверстий крепления по Y
HOLE_DIAM = 3.6;	//диаметр отверстий под крепление
DIAM_HOLE_LIGHT = 30;	//диаметр отверстий для облегчения конструкции

//Крепление куллера
COOL_HEIGHT = 63;	//длина крепленияпод куллер
COOL_ANGL = 45;		//угол крепления куллера
COOL_HOLESIZE_X = 2;	//размеры крепления под куллер
COOL_HOLESIZE_Y = 4;	
COOL_HOLE_X = 2;
COOL_HOLE_Y = 11;


difference()
{
    translate([0, 0, MOUNT_HEIGHT-THICKNESS]) cube([WIDTH,GAB,THICKNESS]);
    translate([HOLE_X+HOLE_DIAM/2, HOLE_Y+HOLE_DIAM/2, MOUNT_HEIGHT-THICKNESS]) cylinder(h=THICKNESS, d=HOLE_DIAM, $fn=20);
	translate([WIDTH-(HOLE_X+HOLE_DIAM/2), HOLE_Y+HOLE_DIAM/2,MOUNT_HEIGHT-THICKNESS]) cylinder(h=THICKNESS, d=HOLE_DIAM, $fn = 20);
}
difference()
{
	cube([WIDTH,THICKNESS,MOUNT_HEIGHT]);
	translate([WIDTH/2, THICKNESS, MOUNT_HEIGHT/2]) rotate([90, 0, 0]) cylinder(d=DIAM_HOLE_LIGHT, h=THICKNESS);
}




translate([0, THICKNESS*cos(COOL_ANGL), THICKNESS*sin(COOL_ANGL)]) rotate([90+COOL_ANGL,0,0])
union()
{	
	difference()
	{
		cube([WIDTH,COOL_HEIGHT,THICKNESS]);
		translate([COOL_HOLE_X,COOL_HEIGHT-COOL_HOLE_Y-COOL_HOLESIZE_Y,0]) cube([COOL_HOLESIZE_X,COOL_HOLESIZE_Y,THICKNESS]);
		translate([WIDTH-COOL_HOLESIZE_X-COOL_HOLE_X,COOL_HEIGHT-WIDTH+COOL_HOLE_Y, 0]) cube([COOL_HOLESIZE_X,COOL_HOLESIZE_Y,THICKNESS]);
		translate([WIDTH/2,COOL_HEIGHT-WIDTH/2,0]) cylinder(d=DIAM_HOLE_LIGHT,h=THICKNESS);
	}
	difference()
	{
		cube([27,7,22]);
		translate([3,0,3]) cube([21,7,16]);
		translate([2,0,9]) cube([1,7,4]);
	}
	difference()
	{
		intersection()
		{
			translate([0,-15,0])cube([27,15,22]);
			translate([0,0,11]) rotate([0,90,0]) cylinder(d=22,h=27);
		}
		translate([3,0,11]) rotate([0,90,0]) cylinder(d=16,h=21);
		rotate([-COOL_ANGL,0,0])translate([0,-18,-25]) cube([27,10,30]);
	}
	rotate([-COOL_ANGL,0,0])translate([0,-18,-15]) union(){
	
		difference()
		{
			cube([27,10,23]);
			translate([2,2,0]) cube([23,6,23]);
			translate([0,18,15]) rotate([COOL_ANGL,0,0]) #intersection()
			{
				translate([3,0,11]) rotate([0,90,0]) cylinder(d=16,h=21);
				rotate([-COOL_ANGL,0,0])translate([0,-18,-15])cube([27,10,24]);
			}
			
			translate([0,5,-1]) rotate([-45,0,0]) cube([27,10,10]);
			
		}
		difference()
		{
			translate([0,0,6]) rotate([-45,0,0]) translate([0,7,-2])cube([27,2,10]);
			translate([0,0,-10]) cube([27,10,10]);
			translate([0,10,0]) cube([27,10,10]);
		}
	}
	
}

translate([0,-COOL_HEIGHT*cos(90-COOL_ANGL),COOL_HEIGHT*sin(90-COOL_ANGL)]) cube([WIDTH,COOL_HEIGHT*cos(90-COOL_ANGL),THICKNESS]);

