int: temas; %Numero de temas
int: Mpaginas; %Numero maximo de paginas del periodico
array[1..temas, 1..4] of int: tabla; %Tabla con los datos generales

array[1..temas] of var int: paginas; %Numero de paginas por tema
array[1..temas] of var bool:seleccion;

constraint sum(i in 1..temas)(seleccion[i]*paginas[i])<=Mpaginas;
constraint forall(i in 1..temas)(paginas[i]<=tabla[i,3] ) ;
constraint forall(i in 1..temas)(paginas[i]>=tabla[i,2]);

solve maximize sum(i in 1..temas)(seleccion[i]*paginas[i]*tabla[i,4]);
