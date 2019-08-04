%Parametros
int: productos; %# de semillas para sembrar
int: mAcres; %# maximo de acres que se pueden sembrar
int: mTrabajo; %# maximo de dias de trabajo disponible
array[1..productos, 1..3] of int:tabla; %tabla que contiene la ganancia por acre y el trabajo necesario por acre

%variables
array[1..productos] of var int: acres; %# de acres por producto

%restricciones
constraint sum(i in 1..productos)(acres[i])<=mAcres;
constraint sum(i in 1..productos)(tabla[i, 3]*acres[i])<=mTrabajo;
  constraint forall(i in 1..productos)(acres[i]>=0);

%Funcion objetivo
solve maximize sum(i in 1..productos)(tabla[i, 2]*acres[i]);