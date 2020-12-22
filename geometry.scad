$fn = 100;
eps = 0.05;


//top
    diaLength = 50;
    diaThick = 3;
    extraSpace = 0.5;

    holderThick = 3;
    sideHeight = 25;
    midHeight = 4;    

//leg
    legHeight = 42;
    legR = 15 / 2;
    innerHoleR = 5 / 2;
    innerHoleHeight = 7;

//joiner
    joinerH = holderThick - extraSpace;


module leg(){    
    difference() {
        cylinder(h = legHeight + joinerH, r1 = legR, r2 = legR);
        
        translate([0, 0, innerHoleHeight])
            rotate([0, 90, 0])
                cylinder(h = 2 * legR + eps, r1 = innerHoleR, r2 = innerHoleR, center = true);
    }
}

module slit() {


    length = 2 * holderThick + 2 * extraSpace + diaLength;
    width = diaThick + 2 * holderThick;
    height = holderThick + sideHeight;


    difference() {
        translate([0, 0, height / 2])
            cube([length, width, height], center = true);

        translate([0, 0, sideHeight / 2 + holderThick])
            cube([diaLength + 2*extraSpace, diaThick + 2 * extraSpace, sideHeight + eps], center = true);

        translate([0,0, (sideHeight - midHeight) / 2 + holderThick + midHeight + eps])
            cube([diaLength - 2 * midHeight, width + eps, sideHeight - midHeight + eps], center = true);

    }
}

module top() {
    
    topWidth = diaThick + 2 * holderThick;

    difference() {
        union() {
            translate([0, topWidth / 2, 0])
                slit();

            translate([0, -topWidth / 2, 0])
                slit();
        }

        translate([0,0,-eps])
            cylinder(h = joinerH + eps, r1 = legR, r2 = legR, center = false);
    }
}    