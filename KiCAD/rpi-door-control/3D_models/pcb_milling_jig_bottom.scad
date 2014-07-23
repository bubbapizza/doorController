/* This is a jig for holding the rpi door controller PCB
   on a Sherline 5000 mill for isolation milling.  */
use <MCAD/nuts_and_bolts.scad>;
use <grid.scad>;

$fn = 16;

/* Set overall piece dimensions. */
x = 148;
y = 70;
z = 8;
x_border = 10;
y_border = 4;
grid_size = 17;
grid_line_width = 1;
offset_z = 30;



/* Set the screw size in mm. */
screw_size = 4.2;

/* 
 *  Set the mounting bolt dimensions. 
 */

/* Use a #10 socket head cap screw. */
bolt_dia = (0.19 * 25.4) + 0.5; 
bolt_head_dia = (0.312 * 25.4) + 0.5;   
// bolt_head_height = (0.19 * 25.4) + 2;

/* Set the distance between mounting holes. */
mount_hole_dist = (1.5 * 25.4); // 1.5 in



/****** Calculated Values *******/
mount_hole_x_offset = x_border / 2; 


difference() {

   union() {
      translate([(x / 2), y / 2, (z / 2)])
         grid(x, y, x_border, y_border, grid_line_width, 
              grid_size - grid_line_width, z);
   
      cylinder(h = offset_z, r = screw_size * 1.5);
      translate([x, 0, 0]) cylinder(h = offset_z, r = screw_size * 1.5);
      translate([0, y, 0]) cylinder(h = offset_z, r = screw_size * 1.5);
      translate([x, y, 0]) cylinder(h = offset_z, r = screw_size * 1.5);
      translate([x / 2, 0, 0]) cylinder(h = offset_z, r = screw_size * 1.5);
      translate([x / 2, y, 0]) cylinder(h = offset_z, r = screw_size * 1.5);
   } /* endunion */
   

   translate([0, 0, 0]) {
      nutHole(size=4, tolerance=0.2);
      cylinder(h = offset_z, r = screw_size / 2);
   } /* endtranslate */

   translate([x, 0, 0]) {
      nutHole(size=4, tolerance=0.2);
      cylinder(h = offset_z, r = screw_size / 2);
   } /* endtranslate */

   translate([0, y, 0]) {
      nutHole(size=4, tolerance=0.2);
      cylinder(h = offset_z, r = screw_size / 2);
   } /* endtranslate */

   translate([x, y, 0]) {
      nutHole(size=4, tolerance=0.2);
      cylinder(h = offset_z, r = screw_size / 2);
   } /* endtranslate */

   translate([x / 2, 0, 0]) {
      nutHole(size=4, tolerance=0.2);
      cylinder(h = offset_z, r = screw_size / 2);
   } /* endtranslate */

   translate([x / 2, y, 0]) {
      nutHole(size=4, tolerance=0.2);
      cylinder(h = offset_z, r = screw_size / 2);
   } /* endtranslate */


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
   translate([x - mount_hole_x_offset, 
              (y / 2) - (mount_hole_dist / 2), 
              0])
      cylinder(h = z, r = bolt_dia / 2);
   translate([x - mount_hole_x_offset, 
              (y / 2) + (mount_hole_dist / 2), 
              0])
      cylinder(h = z, r = bolt_dia / 2);



   /* Subtract some holes for the t-nuts. */
   translate([mount_hole_x_offset, 
              (y / 2) - (mount_hole_dist / 2), 
              0])
      cylinder(h = 2, r = bolt_head_dia / 2);
   translate([mount_hole_x_offset, 
              (y / 2) + (mount_hole_dist / 2), 
              0])
      cylinder(h =  2, r = bolt_head_dia / 2);
   translate([x - mount_hole_x_offset, 
              (y / 2) - (mount_hole_dist / 2), 
              0])
      cylinder(h = 2, r = bolt_head_dia / 2);
   translate([x - mount_hole_x_offset, 
              (y / 2) + (mount_hole_dist / 2), 
              0])
      cylinder(h = 2, r = bolt_head_dia / 2);

} /* enddifference */

