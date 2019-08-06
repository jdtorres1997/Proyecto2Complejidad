%parametros
int: N;  %Numero de productos que se fabrican
int: ML; %Libras que estan disponibles para fabricar los prouctos
int: MH; %Horas que estas disponiblrd para fabricar los productos


array[1..N] of int: Precios; %Precio de cada producto
array[1..N] of int: Libras;  %Libras que requiere cada producto
array[1..N] of int: Horas; %Horas de trabajo requeridos para cada producto

%variables
array[1..N] of var int: Productos; %Cantidad de productos a producir

%restricciones
constraint sum(i in 1..N) (Productos[i] * Libras[i]) <= ML;
constraint sum(i in 1..N) (Productos[i] * Horas[i]) <= MH;
constraint forall(i in 1..N)(Productos[i] >= 0);

%objetivo
solve maximize sum(i in 1..N)(Productos[i]*Precios[i]);
