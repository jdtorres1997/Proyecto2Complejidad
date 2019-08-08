int: N; %Numero de cuchillas 

array[1..N, 1..4] of int:tabla; %tabla que contiene informacion de cada carrete
array[1..3] of int: carretes; %Arreglo con los pedidos de cada carrete

%variables
array[1..N] of var int: sobrantes; %# de acres por producto

%restricciones
constraint forall(j in 1..3)(sum(i in 1..N)(sobrantes[i]*tabla[i,j])=carretes[j]);
constraint forall(i in 1..N)(sobrantes[i]>=0);

%Funcion objetivo
solve minimize sum(i in 1..N)(tabla[i, 4]*sobrantes[i]);