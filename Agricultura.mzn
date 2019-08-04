%Variables
var int: x1;
var int: x2;
var int: x3;

%restricciones
constraint x1+x2+x3 <=200;
constraint (6*x1)+(7*x2)+(5*x3) <=500;
constraint x1 >=0;
constraint x2 >=0;
constraint x3 >=0;

%Funcion objetivo
solve maximize 450*x1+360*x2+400*x3