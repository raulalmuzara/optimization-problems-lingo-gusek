
/*Variables:
x11 = "Number of hectares cultivated with beet in plot P1"
x12 = "Number of hectares cultivated with beet in plot P2"
x21 = "Number of hectares cultivated with cotton in plot P1"
x22 = "Number of hectares cultivated with cotton in plot P2"*/

var x11>=0;
var x12>=0;
var x21>=0;
var x22>=0;

/*Objective function*/

maximize Profit: 700*(x11 + x12) + 500*(x21 + x22);

/*Constraints*/

s.t. HectaresP1: x11 + x21 <= 400;
s.t. HectaresP2: x12 + x22 <= 900;
s.t. WaterP1: 3*x11 + 2*x21 <= 500;
s.t. WaterP2: 3*x12 + 2*x22 <= 1200;
s.t. BeetPortion: x11 + x12 <= 800;
s.t. CottonPortion: x21 + x22 <= 600;
s.t. SamePercentage: ((x11 + x21)/400)*100 = ((x12 + x22)/900)*100;

end;