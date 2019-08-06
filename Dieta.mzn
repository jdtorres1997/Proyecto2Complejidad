%Variables
var int: bread;
var int: butter;
var int: cheese;
var int: cereal;
var int: dietBar;

%Restricciones
constraint 0.08*bread + 0.25*cheese + 0.12*cereal + 0.08*dietBar >= 550;
constraint 0.01*bread + 0.9*butter + 0.36*cheese + 0.03*cereal >= 600;
constraint 0.55*bread + 0.75*cereal + 0.50*dietBar >= 2000;
constraint bread >= 0;
constraint butter >= 0;
constraint cheese >= 0;
constraint cereal >= 0;
constraint dietBar >= 0;

%Función objetivo
solve minimize 0.25*bread + 0.5*butter + 1.2*cheese + 0.6*cereal + 1.5*dietBar;

output ["Bread=", show(bread), "\nButter=", show(butter), "\nCheese=", show(cheese), "\nCereal=", show(cereal), "\nDiet Bar=", show(dietBar)];