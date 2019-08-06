%parametros
int: N;  %Numero de contenedores que su pueden transportat
int: MP; %Peso maximo que se puede transportar
int: Precio; %Precio de cada contenedor


array[1..N] of int: Pesos; %Pesos kg de cada contendor

%variables
array[1..N] of var int: Contenedores; %Cantidad de contenedores a transportar

%restricciones
constraint sum(i in 1..N) (Contenedores[i] * Pesos[i]) <= MP;
constraint forall(i in 1..N)(Contenedores[i] >= 0);

%objetivo
solve maximize sum(i in 1..N)(Contenedores[i]*Precio);
