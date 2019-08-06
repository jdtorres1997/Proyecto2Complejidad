%variables
var int: CrudoL;
var int: CrudoP;

%Restricciones
constraint 0.4*CrudoL + 0.3*CrudoP >= 8;
constraint 0.2*CrudoL + 0.45*CrudoP >= 6;
constraint 0.3*CrudoL + 0.1*CrudoP >= 7;
constraint 0.1*CrudoL + 0.05*CrudoP >= 3 ;
constraint CrudoL >=0;
constraint CrudoP >=0;

%Función objetivo
solve minimize 40*CrudoL + 30*CrudoP  