use <./libs/screws.scad>
module block() {
 hull() {
    cube([26,20.6, 0.000001], center=true);
    translate([0, 0, 4]) cube([26,22.4, 0.000001], center=true);
}
}

module pin() {
    translate([0,0, -1]) cylinder(100, d=1.0, $fn=20);
    translate([0,0, 3]) cylinder(100, d=1.9, $fn=20);
}

module rightside_pin(yangle) {
    rotate([7, yangle, 0]) union() {
        pin();
        #translate([0, -2, 0]) cylinder(10, d=1.0, $fn=20);
    }
}

module leftside_pin(yangle) {
    rotate([-7, yangle, 0]) union() {
        pin();
        #translate([0, 2, 0]) cylinder(10, d=1.0, $fn=20);
    }
}


//rightside_pin();

module espcan() {
    translate([0, 0, 2.21 / 2]) cube([15.3, 12.2, 50], center=true);
}


PIN_OFFSET = 7.3;
//rotate([180, 0, 0]) block();

module outlet() {

difference() {
block();
translate([7,-PIN_OFFSET, 0]) rightside_pin(30);
translate([5,-PIN_OFFSET, 0]) rightside_pin(21);
translate([3,-PIN_OFFSET, 0]) rightside_pin(12);
translate([1,-PIN_OFFSET, 0]) rightside_pin(5);
translate([-1,-PIN_OFFSET, 0]) rightside_pin(-5);
translate([-3,-PIN_OFFSET, 0]) rightside_pin(-12);
translate([-5,-PIN_OFFSET, 0]) rightside_pin(-21);
translate([-7,-PIN_OFFSET, 0]) rightside_pin(-30);
translate([7,PIN_OFFSET, 0]) leftside_pin(30);
translate([5,PIN_OFFSET, 0]) leftside_pin(21);
translate([3,PIN_OFFSET, 0]) leftside_pin(12);
translate([1,PIN_OFFSET, 0]) leftside_pin(5);
translate([-1,PIN_OFFSET, 0]) leftside_pin(-5);
translate([-3,PIN_OFFSET, 0]) leftside_pin(-12);
translate([-5,PIN_OFFSET, 0]) leftside_pin(-21);
translate([-7,PIN_OFFSET, 0]) leftside_pin(-30);
    espcan();
    #translate([-14, 4, -0]) cube([6, 5, 0.8]);
    //translate([-26 / 2, 7, 0]) cube([26, 2, 2]);
    //translate([-26 / 2, -9, 0]) cube([26, 2, 2]);
}
}


module straight_pin() {
    cylinder(8, d=1.5, $fn=30);
}
module pogo_outlet() {
difference() {
translate([0,0, 3.5]) cube([20, 18, 7], center=true);
#translate([7,-PIN_OFFSET, 0]) rotate([0, 0, -90]) straight_pin();
translate([5,-PIN_OFFSET, 0]) rotate([0, 0, -90]) straight_pin();
translate([3,-PIN_OFFSET, 0]) rotate([0, 0, -90]) straight_pin();
translate([1,-PIN_OFFSET, 0]) rotate([0, 0, -90]) straight_pin();
translate([-1,-PIN_OFFSET, 0]) rotate([0, 0, -90]) straight_pin();
translate([-3,-PIN_OFFSET, 0]) rotate([0, 0, -90]) straight_pin();
translate([-5,-PIN_OFFSET, 0]) rotate([0, 0, -90]) straight_pin();
translate([-7,-PIN_OFFSET, 0]) rotate([0, 0, -90]) straight_pin();
translate([7,PIN_OFFSET, 0]) rotate([0, 0, 90]) straight_pin();
translate([5,PIN_OFFSET, 0]) rotate([0, 0, 90]) straight_pin();
translate([3,PIN_OFFSET, 0]) rotate([0, 0, 90]) straight_pin();
translate([1,PIN_OFFSET, 0]) rotate([0, 0, 90]) straight_pin();
translate([-1,PIN_OFFSET, 0]) rotate([0, 0, 90]) straight_pin();
translate([-3,PIN_OFFSET, 0]) rotate([0, 0, 90]) straight_pin();
translate([-5,PIN_OFFSET, 0]) rotate([0, 0, 90]) straight_pin();
translate([-7,PIN_OFFSET, 0]) rotate([0, 0, 90]) straight_pin();
    translate([0, 0, 7 - (2.21 / 2)]) cube([15.3, 12.2, 2.21], center=true);
    #translate([-10, -9, 6.2]) cube([2, 5, 0.8]);
}
}

pogo_outlet();
//straight_pin();

module relay_clamp() {
difference() {
    translate([0,0, 4.8]) cube([92, 25, 6], center=true);
    union() {
    #translate([15, 0, -4]) union() {
    union() {
    //translate([7, 0, -40]) screw(3);
    //translate([-7, 0, -40]) screw(3);
    translate([0, -6, 0]) screw(3);
    translate([0, 6, 0]) screw(3);
    }
    translate([0, 0, 8.6]) union() {
    //translate([7, 0, 0]) hex_nut();
    //translate([-7, 0, 0]) hex_nut();
    translate([0, -6, 0]) hex_nut();
    translate([0, 6, 0]) hex_nut();
        }
    }
    translate([0, 0, -7]) union() {
    translate([40, -6, 0]) screw(3);
    translate([40, 6, 0]) screw(3);
    translate([-40, -6, 0]) screw(3);
    translate([-40, 6, 0]) screw(3);
    }
    #translate([0, 0, 4.7]) union() {
    translate([40, -6, 0]) hex_nut();
    translate([40, 6, 0]) hex_nut();
    translate([-40, -6, 0]) hex_nut();
    translate([-40, 6, 0]) hex_nut();
    }
    //translate([23.5, 0, 5]) cube([20, 10, 10], center=true);
    translate([-15, 0, 5]) cube([30, 10, 10], center=true);

}
}
}

module press_block() {
    difference() {
        translate([0,0, 4.8]) cube([22, 20, 4], center=true);
        translate([0, 6, 0]) screw(3);
        translate([0, -6, 0]) screw(3);
    }
}

//press_block();

//relay_clamp();
