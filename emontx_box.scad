// OpenSCAD code to render an emonTX (http://openenergymonitor.org/emon/)

//Author: Sunil Tagore
// Date: 2/7/13

/*
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    see <http://www.gnu.org/licenses/>.
*/


// CONNECTOR HOLES : set to 0 or 1 according to your box requirements.

CT1=1;
CT2=0;
CT3=0;
USB_POWER=0;
AC_JACK=0;
TEMP=0;
PULSE=0;
LED_HOLE=1;

// BOX LID; BATTERY_COMPARTMENT : set to 0 if not required, or 1 if required

BOX_LID=1;					// 0 for no LID




// ===================================================
// ===================================================

interior_extra_space=1.7;  // increase board size for smoother fit  // note that this may not scale the connector holes..
														// ...and led hole correctly. first attempt set at 0.7mm
												// second attempt=2.2
												// 3rd attempt 1.7mm
									
board_width=56+interior_extra_space;			
board_length=63.8+interior_extra_space;		// first attempt was 63.3mm

//battery_compartment_width=0;	 // 0 for no battery compartment
battery_compartment_width=32;			// 32mm to accomodate battery holder
									//29.5mm second attempt: snug fit (for no battery holder)
									//first attempt 29mm (too small)

		
					
									
partition_wall_width=1;				// partition wall thickness for battery compartment

box_wall_thickness=1;			// 1.5 ish should be fine 
box_base_thickness=1;			// 1.5 ish should be fine 

box_height=17+box_base_thickness;		// 14mm AA battery height + indentation of lid (2mm ish) + gap (1mm) = 17mm
										// this can be varied if needed.

interior_box_width= board_width;
interior_box_length= board_length+battery_compartment_width+partition_wall_width;

exterior_box_width = board_width+(2*(box_wall_thickness));
exterior_box_length = board_length+battery_compartment_width+partition_wall_width+(2*(box_wall_thickness));


// -------------------------------------------------------------------------------
// box


difference(){			// to make box holes


	union(){			// union of partition and main box

		difference(){												// main box walls
		cube([exterior_box_length,exterior_box_width,box_height]);

			translate([box_wall_thickness, box_wall_thickness,box_base_thickness])
			{
			cube([interior_box_length,interior_box_width,box_height]);
			}

		}

	translate([box_wall_thickness+board_length,0,0])				// partition wall
	{
	cube([partition_wall_width,board_width+(2*box_wall_thickness),box_height-3]);
	}

	
	//translate([board_length+box_wall_thickness,55,0])			//55.2 to be precise
	//{
	//cube([battery_compartment_width+partition_wall_width+box_wall_thickness,partition_wall_width,box_height-3]);		//battery length partition	
	//}
	}


if(CT1==1){
translate([0,31+0.75+box_wall_thickness,1.5+box_base_thickness])		//1.5mm from base in z dir, //CT1
{																	
cube([20,8,7]);
}
}


if(CT2==1){
translate([0,22+box_wall_thickness,1.5+box_base_thickness])			//CT2
{
cube([20,7,7]);
}
}

if(CT3==1){
translate([0,12+box_wall_thickness,1.5+box_base_thickness])			//CT3
{
cube([20,7,7]);
}
}

if(USB_POWER==1){
translate([29+box_wall_thickness,interior_box_width,1.5+box_base_thickness])			// usb power
{
cube([10,20,7]);
}
}

if(AC_JACK==1){
translate([49+box_wall_thickness,-5,1.5+box_base_thickness])			// jack power // first attempt 48mm (x)
{
cube([10,20,7]);
}
}

if(TEMP==1){
translate([36+box_wall_thickness,-5,1.5+box_base_thickness])			// Temp // first attempt 35mm (x)
{
cube([7,20,7]);
}
}

if(PULSE==1){
translate([25+box_wall_thickness,-5,1.5+box_base_thickness])			// Pulse counter // first attempt 24(x)
{
cube([7,20,7]);
}
}

if(LED_HOLE==1){	
translate([17+box_wall_thickness,17.5+box_wall_thickness,-5])			//led hole // first attempt: 16.5mm (y)
																// first attempt:15mm (x)
{																	// first attempt: r=1.5mm
cylinder(h=20, r=2, $fs=1);
}
}


}


//-----------------------------------------------------------------------------
// box lid

lid_height = 1;
tolerance = 0.2;		// to get good push fit . first attempt was 0.0mm, 0.4 2nd attempt= too loose, 0.2 3rd attempt.
lip_height = 2;


if(BOX_LID==1){

translate([0,-65,0])
{
	difference(){							// to make lip bit..
		union(){				
		cube([exterior_box_length, exterior_box_width, lid_height]);		//lid
		translate([box_wall_thickness+tolerance,box_wall_thickness+tolerance,lid_height])
		cube([interior_box_length-2*tolerance,interior_box_width-2*tolerance,lip_height]);			// lip cuboid
		}
	translate([box_wall_thickness+3+tolerance,box_wall_thickness+3+tolerance,lid_height])		//3mm lip "width"
	{
	cube([interior_box_length-6-2*tolerance,interior_box_width-6-2*tolerance,lip_height]);			// lip subracted
	}
	}
}

}





