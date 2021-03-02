$fn = 500;

eps = 0.05;

//frameHolder
    diaLength = 50;
    diaThick = 3;
    extraSpace = 0.25;

    holderThick = 2;
    sideHeight = 25;
    midHeight = 4;    


//detectorBox
    dbWidth = 61 + 2*extraSpace; //outer
    dbMaxWidth = 66 + 2*extraSpace; //inner
    dbThick = 26 + 2*extraSpace;
    dbRadius = 35;
    dbRoof = 1; //roof on top
    dbHeight = 54 + dbRoof + 2 *holderThick;


frameHolder();
detectorBox();

module detectorBox() {

    translate([0, -dbThick / 2, dbHeight / 2]) {
        union() {
            difference() {

                union() {
                    translate([0,dbThick / 2 + holderThick / 2, 0])
                        cube(size=[dbWidth, holderThick, dbHeight], center=true);

                    translate([0, -dbThick / 2 - holderThick / 2, 0])
                        cube(size=[dbWidth, holderThick, dbHeight], center=true);

                    detectorSide();

                    mirror([1, 0, 0]) {
                        detectorSide();
                    }

                }

                cube([dbWidth - 4 * holderThick, dbThick + 2 * holderThick + eps, dbHeight - 4 * holderThick ], center = true);
            }

            translate([-dbWidth / 4, 0, dbHeight / 2 - holderThick / 2]) {
                cube(size=[2 * holderThick, dbThick + 2 * holderThick, holderThick], center=true);
            }
            translate([dbWidth / 4, 0, dbHeight / 2 - holderThick / 2]) {
                cube(size=[2 * holderThick, dbThick + 2 * holderThick, holderThick], center=true);
            }
        }
            
    }

}

module detectorSide() {

    translate([-dbRadius + dbMaxWidth / 2,0,0])
    difference() {
        cylinder(r=dbRadius + holderThick, h=dbHeight, center=true);

        cylinder(r=dbRadius, h=dbHeight + eps, center=true);

        translate([0, dbRadius + dbThick / 2 + holderThick, 0])
            cube(size=[2* dbWidth, 2 * dbRadius, dbHeight + eps], center=true);

        translate([0, -(dbRadius + dbThick / 2 + holderThick), 0])
            cube(size=[2* dbWidth, 2 * dbRadius, dbHeight + eps], center=true);

        translate([-dbWidth, 0, 0])
            cube(size=[2* dbWidth, 2 * dbRadius, dbHeight + eps], center=true);
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

module frameHolder() {
    
    frameHolderWidth = diaThick +  holderThick;


    union() {
        translate([0, frameHolderWidth - holderThick + 2* extraSpace, 0])
            slit();

        translate([0, 2* frameHolderWidth - holderThick + 2* extraSpace, 0])
            slit();
    }

}    