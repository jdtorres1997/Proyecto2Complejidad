%parametros
int: N;  %Numero de crudos que se pueden comprar

array[1..4] of int: Demanda; %Demanda de cada tipo de combustible en millones
array[1..N] of int: Costos; %Costos de cada barril de crudo
array[1..N, 1..4] of float: Tabla; %Tabla de rendimientos de crudos por barril

%variables
array[1..N] of var int: Barriles; %Cantidad de barriles de crudo a comprar

%restricciones
constraint forall(j in 1..4)(sum(i in 1..N) (Tabla[i, j] * Barriles[i]) >= Demanda[j]);
constraint forall(i in 1..N)(Barriles[i] >= 0);

%objetivo
solve minimize sum(i in 1..N)(Barriles[i]*Costos[i]);
