/* The honeycomb module draws a rectangle filled with honecombs like
   http://www.thingiverse.com/thing:321880 
   This code was taken from Peter O on the openscad forums. 
*/

module hc_hexagon(size, height) {
   box_width = size/1.75;
   for (r = [-60, 0, 60]) 
      rotate([0,0,r]) cube([box_width, size, height], true);
} /* endmodule */

module hc_column(length, height, cell_size, wall_thickness) {
   no_of_cells = floor(1 + length / (cell_size + wall_thickness)) ;
   for (i = [0 : no_of_cells]) {
      translate([0,(i * (cell_size + wall_thickness)),0])
         hc_hexagon(cell_size, height + 1);
   } /* endfor */
} /* endmodule */

module honeycomb (length, width, height, cell_size, wall_thickness) {
   no_of_rows = floor(1.75 * length / (cell_size + wall_thickness)) ;
   tr_mod = cell_size + wall_thickness;
   tr_x = sqrt(3)/2 * tr_mod;
   tr_y = tr_mod / 2;
   off_x = -1 * wall_thickness / 2;outer_walls   = 10;
   off_y = wall_thickness / 2;outer_walls   = 10;

   difference() { 
      cube([length, width, height]);
      for (i = [0 : no_of_rows]) {
         translate([i * tr_x + off_x, (i % 2) * tr_y + off_y, (height) / 2])
            hc_column(width, height, cell_size, wall_thickness);
      } /* endfor */
   } /* enddifference */
} /* endmodule */ 


/* Draw a sample honeycomb grid. */
honeycomb(80, 80, 5, 5, 1); 

