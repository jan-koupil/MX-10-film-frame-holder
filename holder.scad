$fn = 100;
eps = 0.05;

//top
    diaLength = 50;
    diaThick = 3;
    extraSpace = 0.25;

    holderThick = 2;
    sideHeight = 25;
    midHeight = 4;    


//joiner
    joinerH = holderThick - extraSpace;


top();

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
    
    topWidth = diaThick +  holderThick;


    union() {
        translate([0, topWidth - holderThick + 2* extraSpace, 0])
            slit();

        translate([0, 2* topWidth - holderThick + 2* extraSpace, 0])
            slit();
    }

}    