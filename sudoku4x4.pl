% version para el 4x4

vocabulario([a,b,c,d]).
val(1,2,a).
val(2,1,b).
val(2,4,d).
val(3,3,b).
val(4,3,d).
val(4,1,c).

% Declaramos el vocabulario (piezas) que habran en el sudoku
pieza(a). 
pieza(b). 
pieza(c). 
pieza(d).

% Predicado que imprime cada fila del sudoku
imprimir(Elemento1, Elemento2, Elemento3, Elemento4) :- 
   write('| '), 
   write(Elemento1), 
   write('  '), 
   write(Elemento2), 
   write('  '), 
   write(Elemento3), 
   write('  '), 
   write(Elemento4), 
   write(' |'),
   nl. %Salto de linea

%Predicado principal que es llamado en la consola.
resuelva(Solucion):-
   %Se pasa el sudoku a resolver
   resolver(
      %1 %2 %3 %4
      _, a, _, _, %1
      _, _, a, _, %2
      _, c, _, _, %3
      _, _, d, _  %4
      
      ).

%Predicado que se encarga de resolver e imprimir el sudoku pasado por parametro
resolver(F1C1,F1C2,F1C3,F1C4,F2C1,F2C2,F2C3,F2C4,F3C1,F3C2,F3C3,F3C4,F4C1,F4C2,F4C3,F4C4) :- 
   solucion(F1C1,F1C2,F1C3,F1C4,F2C1,F2C2,F2C3,F2C4,F3C1,F3C2,F3C3,F3C4,F4C1,F4C2,F4C3,F4C4),
	imprimir(F1C1, F1C2, F1C3, F1C4),
	imprimir(F2C1, F2C2, F2C3, F2C4),
	imprimir(F3C1, F3C2, F3C3, F3C4),
	imprimir(F4C1, F4C2, F4C3, F4C4).

%Predicado que verifica si todos los elementos de la fila son diferentes
esDistinto(Elemento1, Elemento2, Elemento3, Elemento4) :- 
   pieza(Elemento1), pieza(Elemento2), pieza(Elemento3), pieza(Elemento4), 
   Elemento1\=Elemento2, 
   Elemento1\=Elemento3, 
   Elemento1\=Elemento4, 
   Elemento2\=Elemento3, 
   Elemento2\=Elemento4, 
   Elemento3\=Elemento4.

% Resuelve el sudoku verificando que todas las piezas son distintas
solucion(F1C1,F1C2,F1C3,F1C4,F2C1,F2C2,F2C3,F2C4,F3C1,F3C2,F3C3,F3C4,F4C1,F4C2,F4C3,F4C4) :-
   %Primera fila
	esDistinto(F1C1, F1C2, F1C3, F1C4),
   %Segunda fila
	esDistinto(F2C1, F2C2, F2C3, F2C4), 
   %Tercera fila
	esDistinto(F3C1, F3C2, F3C3, F3C4), 
   %Cuarta fila
	esDistinto(F4C1, F4C2, F4C3, F4C4), 
   %Primera columna
	esDistinto(F1C1, F2C1, F3C1, F4C1), 
   %Segunda columna
	esDistinto(F1C2, F2C2, F3C2, F4C2), 
   %Tercera columna
	esDistinto(F1C3, F2C3, F3C3, F4C3), 
   %Cuarta columna
	esDistinto(F1C4, F2C4, F3C4, F4C4), 
   %Primer cuadrante superior izquierdo
	esDistinto(F1C1, F1C2, F2C1, F2C2), 
   %Segundo cuadrante superior derecho
	esDistinto(F1C3, F1C4, F2C3, F2C4), 
   %Tercer cuadrante inferior izquiero
	esDistinto(F3C1, F3C2, F4C1, F4C2), 
   %Cuarto cuadrante inferior derecho
	esDistinto(F3C3, F3C4, F4C3, F4C4). 



