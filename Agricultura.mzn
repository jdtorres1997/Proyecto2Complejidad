%Variables
var int: tomato;
var int: greenPepper;
var int: cucumber;

%restricciones
constraint tomato+greenPepper+cucumber <=200;
constraint (6*tomato)+(7*greenPepper)+(5*cucumber) <=500;
constraint tomato >=0;
constraint greenPepper >=0;
constraint cucumber >=0;

%Funcion objetivo
solve maximize 450*tomato+360*greenPepper+400*cucumber