module pin() {
	cube(size=[0.8, 1.0, 3.5], center=true);
};


cube(size=[(6.1 + 7.8), 10, 15.5]);
translate([(16.5 / 2), 2.1, (-3.5 / 2)]) rotate([0, 0, 90]) pin134();
translate([7.8, 2.5, (-3.5 / 2)]) pin();
translate([7.8, 7.5, (-3.5 / 2)]) pin();
