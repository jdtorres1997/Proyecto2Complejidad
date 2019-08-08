%Variables
var int: sillas;
var int: mesas;

%Restricciones
constraint 4*sillas + 10*mesas <= 45;
constraint 4*sillas + 4*mesas <= 23;
constraint mesas >= 0;
constraint sillas >= 0;

%Función objetivo
solve maximize 2*sillas + 3*mesas;

output ["Sillas=", show(sillas), "\nMesas=", show(mesas)];