
set media dimen 1; 
set name dimen 1;
param fCost{media};
param vCost{media};
param buyers{media};
param minimum{media};
param values{name};
param M:=values['M'];
param budget:=values['budget'];

table Data IN 'ODBC'
  'DRIVER={Microsoft Excel Driver (*.xls)};dbq=.\problem3-data.xls'
  'SELECT * FROM [Data$]':
  media <- [media], fCost, vCost, buyers, minimum;

table Scalars IN 'ODBC'
  'DRIVER={Microsoft Excel Driver (*.xls)};dbq=.\problem3-data.xls'
  'SELECT * FROM [Scalars$]':
  name <- [name], values;
  
var x{media}, integer, >= 0;
var y{media}, binary;

maximize potential_buyers:  sum{m in media}(buyers[m]*x[m]);
s.t. budgets: sum{m in media}(vCost[m]*x[m] + fCost[m]*y[m]) <= budget;
s.t. ms{m in media}: x[m] <= M*y[m];
s.t. minimums{m in media}: x[m] >= minimum[m]*y[m];

end;