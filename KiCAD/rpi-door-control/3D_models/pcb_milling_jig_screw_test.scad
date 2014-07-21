/* This is a jig for holding the rpi door controller PCB
   on a Sherline 5000 mill for isolation milling.  */
use <MCAD/nuts_and_bolts.scad>;
use <grid.scad>;

$fn = 16;

/* Set overall piece dimensions. */
x = 148;
y = 70;
z = 15;
x_border = 10;
y_border = 10;
grid_size = 20;
grid_line_width = 1;

/* The grid pocket is how much to drop the top of the grid by.  This
   allows for some padding to be added underneath the circuit board. */
grid_pocket = 3;


/* Set the screw size in mm. */
screw_size = 4.1;

/* 
 *  Set the mounting bolt dimensions. 
 */

/* Use a #10 socket head cap screw. */
bolt_dia = (0.19 * 25.4) + 0.1; 
bolt_head_dia = (0.312 * 25.4) + 0.5;   
bolt_head_height = (0.19 * 25.4) + 2;

/* Set the distance between mounting holes. */
mount_hole_dist = (1.5 * 25.4); // 1.5 in



/****** Calculated Values *******/
mount_hole_x_offset = x_border / 2; 


difference() {

   cube(size=[x_border, y, z]);
   
   /* 
    *  Add some holes for the #10 socket head cap screws that
    *  attach the plate to the base. 
    */
  

   /* Subtract the bolt holes. */
   translate([mount_hole_x_offset, 
              (y / 2) - (mount_hole_dist / 2), 
              0])
      cylinder(h = z, r = bolt_dia / 2);
   translate([mount_hole_x_offset, 
              (y / 2) + (mount_hole_dist / 2), 
              0])
      cylinder(h = z, r = bolt_dia / 2);



   /* Subtract the bolt head holes. */
   translate([mount_hole_x_offset, 
              (y / 2) - (mount_hole_dist / 2), 
              z - bolt_head_height])
      cylinder(h = z, r = bolt_head_dia / 2);
   translate([mount_hole_x_offset, 
              (y / 2) + (mount_hole_dist / 2), 
              z - bolt_head_height])
      cylinder(h = z, r = bolt_head_dia / 2);

} /* enddifference */

