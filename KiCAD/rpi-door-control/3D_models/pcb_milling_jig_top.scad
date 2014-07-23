/* This is a jig for holding the rpi door controller PCB
   on a Sherline 5000 mill for isolation milling.  */

$fn = 16;

/* Set overall piece dimensions. */
x = 148;
y = 70;
z = 5;
x_border = 14;
y_border = 10;

/* Set the screw size in mm. */
screw_size = 4.2;


difference() {

   union() {
      cube([x, y, z]);
   
      cylinder(h = z, r = screw_size * 1.5);
      translate([x, 0, 0]) cylinder(h = z, r = screw_size * 1.5);
      translate([0, y, 0]) cylinder(h = z, r = screw_size * 1.5);
      translate([x, y, 0]) cylinder(h = z, r = screw_size * 1.5);
      translate([x / 2, 0, 0]) cylinder(h = z, r = screw_size * 1.5);
      translate([x / 2, y, 0]) cylinder(h = z, r = screw_size * 1.5);
   } /* endunion */
   
   cylinder(h = z, r = screw_size / 2);
   translate([x, 0, 0]) cylinder(h = z, r = screw_size / 2);
   translate([0, y, 0]) cylinder(h = z, r = screw_size / 2);
   translate([x, y, 0]) cylinder(h = z, r = screw_size / 2);
   translate([x / 2, 0, 0]) cylinder(h = z, r = screw_size / 2);
   translate([x / 2, y, 0]) cylinder(h = z, r = screw_size / 2);

   /* Make a big hole in the center. */
   translate([x_border, y_border, 0])
      cube([x - (2 * x_border), y - (2 * y_border), z]); 


} /* enddifference */
