/* This module creates grids. */

module grid(
   gridX, 
   gridY, 
   borderX, 
   borderY, 
   meshSolid,    // width of solid part of grid
   meshSpace,    // width of space part of grid
   thickness) {  // z height 

   /* Calculate the size of the dimensions of the meshed area. */
   meshX=gridX-(borderX*2);
   meshY=gridY-(borderY*2);

   echo (meshX,  meshY);

   /* Calculate the number of lines in the meshed area. */
   nX=floor(meshX/(meshSolid+meshSpace));
   nY=floor(meshY/(meshSolid+meshSpace));
   gridSize = meshSolid + meshSpace;
   echo (nX, nY, gridSize);


   intersection () {

      union() {
         /* 
          *  Draw the border box centered. 
          */
         difference() {
            cube (size=[gridX,gridY,thickness+ 2], center=true);
            cube (size=[meshX,meshY,thickness+ 2], center=true);
         } /* enddifference */
         
      
         /* 
          *  Draw the grid centered. 
          */
      
         /* Draw the lines parallel to y axis. */
         translate([-1 * (meshSolid / 2), 0, -1 * (thickness / 2)])
            union() {
               for (i = [0 : ceil(nX / 2)]) {
                  translate([i*(meshSolid+meshSpace), -1 * (gridY / 2), 0]) 
                     cube(size=[meshSolid, gridY, thickness]);
               } /* endfor */
               for (i = [0 : ceil(nX / 2)]) {
                  translate([-1 * i*(meshSolid+meshSpace), -1 * (gridY / 2), 0]) 
                     cube(size=[meshSolid, gridY, thickness]);
               } /* endfor */
            } /* endunion */
         
         /* Draw the lines parallel to the x axis. */
         translate([0, -1 * (meshSolid / 2), -1 * (thickness / 2)])
            union() {
               for (i = [0 : ceil(nY / 2)]) {
                  translate([-1 * (gridX / 2), i*(meshSolid+meshSpace), 0]) 
                     cube(size=[gridX, meshSolid, thickness]);
               } /* endfor */
               for (i = [0 : ceil(nY / 2)]) {
                  translate([-1 * (gridX / 2), -1 * i*(meshSolid+meshSpace), 0]) 
                     cube(size=[gridX, meshSolid, thickness]);
               } /* endfor */
            } /* endunion */
      } /* endunion */

      /* Slice off all the extra line widths on the edges. */
      cube (size=[gridX,gridY,thickness], center=true);

   } /* endintersection */

} /* endmodule */


grid(21, 41, 0, 0, 2, 8, 5);
   
