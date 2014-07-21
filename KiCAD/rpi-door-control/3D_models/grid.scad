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


   /* Draw the border box centered. */
   difference() {
      cube (size=[gridX,gridY,thickness], center=true);
      cube (size=[meshX,meshY,thickness], center=true);
   } /* enddifference */
   

   /* Draw the grid centered. */
   translate([0, 0, -1 * (thickness / 2)])
      
      union() {
      /* Draw the lines parallel to y axis. */
      for (i = [0 : floor(nX / 2)]) {
         translate([i*(meshSolid+meshSpace), -1 * (gridY / 2), 0]) 
            cube(size=[meshSolid, gridY, thickness]);
      } /* endfor */
      for (i = [0 : floor(nX / 2)]) {
         translate([-1 * i*(meshSolid+meshSpace), (gridY / 2), 0]) 
            cube(size=[meshSolid, gridY, thickness]);
      } /* endfor */
   
      /* Draw the lines parallel to the x axis. */
      for (i = [0 : floor(nY / 2)]) {
         translate([-1 * (gridX / 2), i*(meshSolid+meshSpace), 0]) 
            cube(size=[gridX, meshSolid, thickness]);
      } /* endfor */
      for (i = [0 : floor(nY / 2)]) {
         translate([-1 * (gridX / 2), -1 * i*(meshSolid+meshSpace), 0]) 
            cube(size=[gridX, meshSolid, thickness]);
      } /* endfor */
   }
} /* endmodule */


grid(20, 20, 0.1, 0.1, 1, 9, 5);
   
