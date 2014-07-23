/* This is a jig for holding the rpi door controller PCB
   on a Sherline 5000 mill for isolation milling.  */
use <MCAD/nuts_and_bolts.scad>;
use <grid.scad>;

$fn = 16;

/* Set overall piece dimensions. */
x = 148;
y = 70;
z = 5;
x_border = 14;
y_border = 10;
grid_size = 17;
grid_line_width = 1;

/* The grid pocket is how much to drop the top of the grid by.  This
   allows for some padding to be added underneath the circuit board. */
grid_pocket = 3;


/* Set the screw size in mm. */
screw_size = 4.2;



/****** Calculated Values *******/
mount_hole_x_offset = x_border / 2; 


difference() {

   union() {
      translate([(x / 2), y / 2, (z / 2)])
         grid(x, y, x_border, y_border, grid_line_width, 
              grid_size - grid_line_width, z);
   
      cylinder(h = z, r = screw_size * 1.5);
      translate([x, 0, 0]) cylinder(h = z, r = screw_size * 1.5);
      translate([0, y, 0]) cylinder(h = z, r = screw_size * 1.5);
      translate([x, y, 0]) cylinder(h = z, r = screw_size * 1.5);
      translate([x / 2, 0, 0]) cylinder(h = z, r = screw_size * 1.5);
      translate([x / 2, y, 0]) cylinder(h = z, r = screw_size * 1.5);
   } /* endunion */
   

   translate([0, 0, 0])
      cylinder(h = z, r = screw_size / 2);

   translate([x, 0, 0])
      cylinder(h = z, r = screw_size / 2);

   translate([0, y, 0])
      cylinder(h = z, r = screw_size / 2);

   translate([x, y, 0])
      cylinder(h = z, r = screw_size / 2);

   translate([x / 2, 0, 0])
      cylinder(h = z, r = screw_size / 2);

   translate([x / 2, y, 0]) 
      cylinder(h = z, r = screw_size / 2);

   /* Subtract the grid pocket. */
   translate([x_border, y_border, z - grid_pocket])
      cube(size=[x - (x_border * 2), y - (y_border * 2), grid_pocket]);
} /* enddifference */

