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

   difference() {
      cube (size=[gridX,gridY,thickness + 20], center=true);
      cube (size=[meshX,meshY,thickness + 20], center=true);
   } /* enddifference */
   
   /* Center the grid. */
   translate([-1 * meshSolid / 2, 
              -1 * meshSolid / 2,
              -1 * (thickness / 2)])
      
      union() {
      /* Draw the lines parallel to y axis. */
      for (i = [0 : floor(nX / 2)]) {
         translate([i*(meshSolid+meshSpace), -1 * (meshY / 2), 0]) 
            cube(size=[meshSolid,meshY + meshSolid,thickness]);
      } /* endfor */
      for (i = [0 : floor(nX / 2)]) {
         translate([-1 * i*(meshSolid+meshSpace), -1 * (meshY / 2), 0]) 
            cube(size=[meshSolid,meshY + meshSolid,thickness]);
      } /* endfor */
   
      /* Draw the lines parallel to the x axis. */
      for (i = [0 : floor(nY / 2)]) {
         translate([-1 * (meshX / 2), i*(meshSolid+meshSpace), 0]) 
            cube(size=[meshX + meshSolid, meshSolid, thickness]);
      } /* endfor */
      for (i = [0 : floor(nY / 2)]) {
         translate([-1 * (meshX / 2), -1 * i*(meshSolid+meshSpace), 0]) 
            cube(size=[meshX + meshSolid, meshSolid, thickness]);
      } /* endfor */
   }
} /* endmodule */


grid(10, 20, 0.2, 0.2, 1, 5, 5);
   
