%variables
var int: C1;
var int: C2;
var int: C3;
var int: C4;
var int: C5;
var int: C6;
var int: C7;
var int: C8;
var int: C9;
var int: C10;

%Restricciones
constraint 100*C1 + 155*C2 + 50*C3 + 112*C4 + 70*C5 + 80*C6 + 60*C7 + 118*C8 + 110*C9 + 55*C10 <= 700;
constraint C1 >= 0;
constraint C2 >= 0;
constraint C3 >= 0;
constraint C4 >= 0;
constraint C5 >= 0;
constraint C6 >= 0;
constraint C7 >= 0;
constraint C8 >= 0;
constraint C9 >= 0;
constraint C10 >= 0;


%Función objetivo
solve maximize 10*C1 + 10*C2 + 10*C3 + 10*C4 + 10*C5 + 10*C6 + 10*C7 + 10*C8 + 10*C9 + 10*C10;

%solve maximize C1 + C2 + C3 + C4 + C5 + C6 + C7 + C8 + C9 + C10;