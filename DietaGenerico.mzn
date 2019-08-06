%parametros
int: N;
int: MP;
int: MG;
int: MC;

array[1..N] of float: Proteinas;
array[1..N] of float: Carbohidratos;
array[1..N] of float: Grasas;
array[1..N] of float: Costos;

%variables
array[1..N] of var int: Compras;

%restricciones
constraint sum(i in 1..N) (Proteinas[i] * Compras[i])>=MP;
constraint sum(i in 1..N) (Grasas[i]*Compras[i])>=MG;
constraint sum(i in 1..N) (Carbohidratos[i]*Compras[i])>=MC;
constraint forall(i in 1..N)(Compras[i]>=0);

%objetivo
solve minimize sum(i in 1..N)(Compras[i]*Costos[i]);

output ["Bread=", show(Compras[1]), "\nButter=", show(Compras[2]), "\nCheese=", show(Compras[3]), "\nCereal=", show(Compras[4]), "\nDiet Bar=", show(Compras[5])];