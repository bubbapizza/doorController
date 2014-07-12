/* This module creates grids. */

module grid(
   gridX, 
   gridY, 
   borderX, 
   borderY, 
   meshSolid,    // width of solid part of grid
   meshSpace,    // width of space part of grid
   thickness) {  // z height 


   meshX=gridX-(borderX*2);
   meshY=gridY-(borderY*2);
   nX=meshX/(meshSolid+meshSpace);
   nY=meshY/(meshSolid+meshSpace);
   
   difference() {
      cube (size=[gridX,gridY,thickness],center=true);
      cube (size=[meshX,meshY,thickness],center=true);
   } /* enddifference */
   
   for (i=[0:nX]) {
      translate([-(meshX/2)+i*(meshSolid+meshSpace),
                 -meshY/2,
                 -thickness/2]) 
         cube(size=[meshSolid,meshY,thickness],center=false);
   } /* endfor */
   
   for (i=[0:nY]) {
      translate([-meshX/2,
                 -(meshY/2)+i*(meshSolid+meshSpace),
                 -thickness/2]) 
         cube(size=[meshX,meshSolid,thickness],center=false);
   } /* endfor */

} /* endmodule */

grid(120, 70, 10, 10, 1, 9, 10);
   
