
set washing_machines;
set parts;
set programmers;
param m2_sheet_metal{washing_machines};
param manufacturing_hours{parts};
param finishing_hours{washing_machines};

var x{washing_machines}>=0;
var m{parts}>=0;
var b{programmers}>=0;

maximize Profit: 96*x['W4'] + 102*x['W5'] + 108*x['W40'] + 147*x['W50'] 
- 6*m['P1'] - 11*b['P1'] - 11*m['P2'] - 21*b['P2'];

s.t. SheetMetal: m2_sheet_metal['W4']*x['W4'] + m2_sheet_metal['W5']*x['W5'] + 
m2_sheet_metal['W40']*x['W40'] + m2_sheet_metal['W50']*x['W50'] <= 10000;
s.t. ManufacturingHours: manufacturing_hours['M1']*m['M1'] + manufacturing_hours['M2']*m['M2'] + 
manufacturing_hours['P1']*m['P1'] + manufacturing_hours['P2']*m['P2'] <= 3000;
s.t. FinishingHours: finishing_hours['W4']*x['W4'] + finishing_hours['W5']*x['W5'] + 
finishing_hours['W40']*x['W40'] + finishing_hours['W50']*x['W50'] <= 5000;
s.t. MinimumW4: x['W4']>=300;
s.t. MinimumW5: x['W5']>=300;
s.t. MinimumW40: x['W40']>=300;
s.t. MinimumW50: x['W50']>=300;
s.t. CapacityDemand: x['W5'] + x['W50'] >= x['W4'] + x['W40'];
s.t. Motor1: m['M1'] >= x['W4'] + x['W5'];
s.t. Motor2: m['M2'] >= x['W40'] + x['W50'];
s.t. Programmer1: m['P1'] + b['P1'] >= x['W4'] + x['W5'];
s.t. Programmer2: m['P2'] + b['P2'] >= x['W40'] + x['W50'];

end;