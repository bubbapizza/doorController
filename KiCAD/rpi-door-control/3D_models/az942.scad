module pin134() {
	cube(size=[0.3, 1.0, 3.5], center=true);
};

module pin25() {
	cube(size=[0.3, 0.9, 3.5], center=true);
};

cube(size=[16.5, 22.5, 16.8]);
translate([(16.5 / 2), 2.1, (-3.5 / 2)]) rotate([0, 0, 90]) pin134();
translate([(16.5 / 2 - 6), 16.3, (-3.5 / 2)]) pin134();
translate([(16.5 / 2 + 6), 16.3, (-3.5 / 2)]) pin134();
translate([(16.5 / 2 + 6), 4.1, (-3.5 / 2)]) pin25();
translate([(16.5 / 2 - 6), 4.1, (-3.5 / 2)]) pin25();