var int: x1;
var int: x2;
var int: x3;
var int: x4;
var int: x5;
var int: x6;

constraint 3*x1 + 2*x2 + 2*x3 + x4 + x5 + x6 = 300;
constraint x2 + 2*x4 + x5 = 200;
constraint 2*x3 + x4 + 2*x5 + 3*x6 = 400;
constraint x1 >= 0;
constraint x2 >= 0;
constraint x3 >= 0;
constraint x4 >= 0;
constraint x5 >= 0;
constraint x6 >= 0;

solve minimize 100*x1 + 140*x2 + 40*x3 + 80*x5 + 160*x6 ;