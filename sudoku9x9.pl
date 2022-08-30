%Sudoku version 9x9

vocabulario([1,2,3,4,5,6,7,8,9]).
val(9,3,8). val(9,4,3). val(9,5,1). val(9,6,7).
val(8,2,5). val(8,3,7). val(8,8,9).
val(7,1,1). val(7,2,3). val(7,5,9).
val(6,1,3). val(6,6,4). val(6,7,5).
val(5,1,2). val(5,6,8).
val(4,1,5). val(4,4,9). val(4,5,7). val(4,7,3).
val(3,4,4). val(3,6,1).
val(2,2,6). val(2,9,7).
val(1,8,2). val(1,9,8).

% Declaramos el vocabulario (piezas) que habran en el sudoku
pieza(1). 
pieza(2). 
pieza(3). 
pieza(4).
pieza(5).
pieza(6).
pieza(7).
pieza(8).
pieza(9).

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
   write('  '),
   write(Elemento5), 
   write('  '),  
   write(Elemento6), 
   write('  '), 
   write(Elemento7), 
   write('  '), 
   write(Elemento8), 
   write('  '), 
   write(Elemento9), 
   write(' |'),
   nl. %Salto de linea

%Predicado principal que es llamado en la consola.
resuelva(Solucion):-
   %Se pasa el sudoku a resolver
   resolver(
      %1 %2 %3 %4 %5 %6 %7 %8 %9
      _, _, _, _, _, 8, 6, _, _, %1
      _, 6, 5, _, _, _, 1, _, 3, %2
      7, _, 2, _, _, 3, _, _, 9, %3
      _, 7, _, _, _, _, _, _, 2, %4
      _, _, _, 7, _, 6, 9, _, _, %5
      6, _, 1, 8, 9, _, _, _, _, %6
      1, _, _, _, 1, _, 2, 5, _, %7
      _, 9, 6, 3, 2, 8, 4, 7, _, %8
      2, 1, 4, 6, _, 5, 3, 9, _ %9
      ).

%Predicado que se encarga de resolver e imprimir el sudoku pasado por parametro
resolver(F1C1,F1C2,F1C3,F1C4,F1C5,F1C6,F1C7,F1C8,F1C9,
        F2C1,F2C2,F2C3,F2C4,F3C5,F2C6,F2C7,F2C8,F2C9,
        F3C1,F3C2,F3C3,F3C4,F3C5,F3C6,F3C7,F3C8,F3C9,
        F4C1,F4C2,F4C3,F4C4,F4C5,F4C6,F4C7,F4C8,F4C9,
        F5C1,F5C2,F5C3,F5C4,F5C5,F5C6,F5C7,F5C8,F5C9,
	    F6C1,F6C2,F6C3,F6C4,F6C5,F6C6,F6C7,F6C8,F6C9,
	    F7C1,F7C2,F7C3,F7C4,F7C5,F7C6,F7C7,F7C8,F7C9,
	    F8C1,F8C2,F8C3,F8C4,F8C5,F8C6,F8C7,F8C8,F8C9,
	    F9C1,F9C2,F9C3,F9C4,F9C5,F9C6,F9C7,F9C8,F9C9
        ) :- 
   solucion(F1C1,F1C2,F1C3,F1C4,F1C5,F1C6,F1C7,F1C8,F1C9,
        F2C1,F2C2,F2C3,F2C4,F3C5,F2C6,F2C7,F2C8,F2C9,
        F3C1,F3C2,F3C3,F3C4,F3C5,F3C6,F3C7,F3C8,F3C9,
        F4C1,F4C2,F4C3,F4C4,F4C5,F4C6,F4C7,F4C8,F4C9,
        F5C1,F5C2,F5C3,F5C4,F5C5,F5C6,F5C7,F5C8,F5C9,
	    F6C1,F6C2,F6C3,F6C4,F6C5,F6C6,F6C7,F6C8,F6C9,
	    F7C1,F7C2,F7C3,F7C4,F7C5,F7C6,F7C7,F7C8,F7C9,
	    F8C1,F8C2,F8C3,F8C4,F8C5,F8C6,F8C7,F8C8,F8C9,
	    F9C1,F9C2,F9C3,F9C4,F9C5,F9C6,F9C7,F9C8,F9C9),
	imprimir(F1C1, F1C2, F1C3, F1C4, F1C5, F1C6, F1C7, F1C8, F1C9),
	imprimir(F2C1, F2C2, F2C3, F2C4, F2C5, F2C6, F2C7, F2C8, F2C9),
	imprimir(F3C1, F3C2, F3C3, F3C4, F3C5, F3C6, F3C7, F3C8, F3C9),
	imprimir(F4C1, F4C2, F4C3, F4C4, F4C5, F4C6, F4C7, F4C8, F4C9),
	imprimir(F5C1, F5C2, F5C3, F5C4, F5C5, F5C6, F5C7, F5C8, F5C9),
	imprimir(F6C1, F6C2, F6C3, F6C4, F6C5, F6C6, F6C7, F6C8, F6C9),
	imprimir(F7C1, F7C2, F7C3, F7C4, F7C5, F7C6, F7C7, F7C8, F7C9),
	imprimir(F8C1, F8C2, F8C3, F8C4, F8C5, F8C6, F8C7, F8C8, F8C9),
	imprimir(F9C1, F9C2, F9C3, F9C4, F9C5, F9C6, F9C7, F9C8, F9C9).

%Predicado que verifica si todos los elementos de la fila son diferentes
esDistinto(Elemento1, Elemento2, Elemento3, Elemento4,Elemento5,Elemento6,Elemento7,Elemento8,Elemento9) :- 
   pieza(Elemento1), pieza(Elemento2), pieza(Elemento3), pieza(Elemento4), pieza(Elemento5), pieza(Elemento6), pieza(Elemento7), pieza(Elemento8), pieza(Elemento9),  
   Elemento1\=Elemento2, 
   Elemento1\=Elemento3, 
   Elemento1\=Elemento4,
   Elemento1\=Elemento5,
   Elemento1\=Elemento6,
   Elemento1\=Elemento7,
   Elemento1\=Elemento8,
   Elemento1\=Elemento9,

   Elemento2\=Elemento3, 
   Elemento2\=Elemento4, 
   Elemento2\=Elemento5, 
   Elemento2\=Elemento6, 
   Elemento2\=Elemento7, 
   Elemento2\=Elemento8, 
   Elemento2\=Elemento9, 

   Elemento3\=Elemento4, 
   Elemento3\=Elemento5, 
   Elemento3\=Elemento6, 
   Elemento3\=Elemento7, 
   Elemento3\=Elemento8, 
   Elemento3\=Elemento9, 

   Elemento4\=Elemento5, 
   Elemento4\=Elemento6, 
   Elemento4\=Elemento7, 
   Elemento4\=Elemento8, 
   Elemento4\=Elemento9, 

   Elemento5\=Elemento6, 
   Elemento5\=Elemento7, 
   Elemento5\=Elemento8, 
   Elemento5\=Elemento9, 

   Elemento6\=Elemento7, 
   Elemento6\=Elemento8, 
   Elemento6\=Elemento9, 

   Elemento7\=Elemento8, 
   Elemento7\=Elemento9, 

   Elemento8\=Elemento9.


% Resuelve el sudoku verificando que todas las piezas son distintas
solucion(F1C1,F1C2,F1C3,F1C4,F1C5,F1C6,F1C7,F1C8,F1C9,
        F2C1,F2C2,F2C3,F2C4,F3C5,F2C6,F2C7,F2C8,F2C9,
        F3C1,F3C2,F3C3,F3C4,F3C5,F3C6,F3C7,F3C8,F3C9,
        F4C1,F4C2,F4C3,F4C4,F4C5,F4C6,F4C7,F4C8,F4C9,
        F5C1,F5C2,F5C3,F5C4,F5C5,F5C6,F5C7,F5C8,F5C9,
	    F6C1,F6C2,F6C3,F6C4,F6C5,F6C6,F6C7,F6C8,F6C9,
	    F7C1,F7C2,F7C3,F7C4,F7C5,F7C6,F7C7,F7C8,F7C9,
	    F8C1,F8C2,F8C3,F8C4,F8C5,F8C6,F8C7,F8C8,F8C9,
	    F9C1,F9C2,F9C3,F9C4,F9C5,F9C6,F9C7,F9C8,F9C9) :-
    %Primera fila
    esDistinto(F1C1, F1C2, F1C3, F1C4, F1C5, F1C6, F1C7, F1C8, F1C9), 
    %Segunda fila
	esDistinto(F2C1, F2C2, F2C3, F2C4, F2C5, F2C6, F2C7, F2C8, F2C9), 
    %Tercera fila
	esDistinto(F3C1, F3C2, F3C3, F3C4, F3C5, F3C6, F3C7, F3C8, F3C9), 
    %Cuarta fila
	esDistinto(F4C1, F4C2, F4C3, F4C4, F4C5, F4C6, F4C7, F4C8, F4C9), 
    %Quinta fila
	esDistinto(F5C1, F5C2, F5C3, F5C4, F5C5, F5C6, F5C7, F5C8, F5C9), 
    %Sexta fila
	esDistinto(F6C1, F6C2, F6C3, F6C4, F6C5, F6C6, F6C7, F6C8, F6C9), 
    %Setima fila
	esDistinto(F7C1, F7C2, F7C3, F7C4, F7C5, F7C6, F7C7, F7C8, F7C9), 
    %Octava fila
	esDistinto(F8C1, F8C2, F8C3, F8C4, F8C5, F8C6, F8C7, F8C8, F8C9), 
    %Novena fila
	esDistinto(F9C1, F9C2, F9C3, F9C4, F9C5, F9C6, F9C7, F9C8, F9C9), 
    %Primera columna
	esDistinto(F1C1, F2C1, F3C1, F4C1, F5C1, F6C1, F7C1, F8C1, F9C1), 
    %Segunda columna
	esDistinto(F1C2, F2C2, F3C2, F4C2, F5C2, F6C2, F7C2, F8C2, F9C2), 
    %Tercerca columna
	esDistinto(F1C3, F2C3, F3C3, F4C3, F5C3, F6C3, F7C3, F8C3, F9C3),
    %Cuarta columna
	esDistinto(F1C4, F2C4, F3C4, F4C4, F5C4, F6C4, F7C4, F8C4, F9C4), 
    %Quinta columna
	esDistinto(F1C5, F2C5, F3C5, F4C5, F5C5, F6C5, F7C5, F8C5, F9C5), 
    %Sexta columna
	esDistinto(F1C6, F2C6, F3C6, F4C6, F5C6, F6C6, F7C6, F8C6, F9C6), 
    %Setima columna
	esDistinto(F1C7, F2C7, F3C7, F4C7, F5C7, F6C7, F7C7, F8C7, F9C7), 
    %Octava columna
	esDistinto(F1C8, F2C8, F3C8, F4C8, F5C8, F6C8, F7C8, F8C8, F9C8), 
    %Novena columna
	esDistinto(F1C9, F2C9, F3C9, F4C9, F5C9, F6C9, F7C9, F8C9, F9C9), 
    %Cuadrante superior izquierda
	esDistinto(F1C1, F1C2, F1C3, F2C1, F2C2, F2C3, F3C1, F3C2, F3C3), 
    %Cuadrante Superior del medio
	esDistinto(F1C4, F1C5, F1C6, F2C4, F2C5, F2C6, F3C4, F3C5, F3C6), 
    %Cuadrante Superior derecho
	esDistinto(F1C7, F1C8, F1C9, F2C7, F2C8, F2C9, F3C7, F3C8, F3C9), 
    %Cuadrante medio izquierda
	esDistinto(F4C1, F4C2, F4C3, F5C1, F5C2, F5C3, F6C1, F6C2, F6C3), 
    %Cuadrante del centro
	esDistinto(F4C4, F4C5, F4C6, F5C4, F5C5, F5C6, F6C4, F6C5, F6C6), 
    %Cuadrante medio derecho
	esDistinto(F4C7, F4C8, F4C9, F5C7, F5C8, F5C9, F6C7, F6C8, F6C9), 
    %Cuadrante inferior izquerda
	esDistinto(F7C1, F7C2, F7C3, F8C1, F8C2, F8C3, F9C1, F9C2, F9C3), 
    %Cuadrante inferior medio
	esDistinto(F7C4, F7C5, F7C6, F8C4, F8C5, F8C6, F9C4, F9C5, F9C6), 
    %Caudrante inferior derecho
    different(F7C7, F7C8, F7C9, F8C7, F8C8, F8C9, F9C7, F9C8, F9C9).
