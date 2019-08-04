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
constraint sum(i in 1..N) (Proteinas[i]*Compras[i])>=MP;
constraint sum(i in 1..N) (Carbohidratos[i]*Compras[i])>=MC;
constraint sum(i in 1..N) (Grasas[i]*Compras[i])>=MG;
constraint forall(i in 1..N)(Compras[i]>=0);

%objetivo
solve minimize sum(i in 1..N)(Compras[i]*Costos[i]);