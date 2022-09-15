% Problema 3, Mente maestra -- Richard Osvaldo Leon Chinchilla 2019003759

/*Se encarga de generar la ruta donde se van a crear todos los archivos
    usando la ruta en la que este la ejecucion de swipl*/
path_file(Name,Path):-
    working_directory(Dir,Dir),
    atom_concat(Dir,Name,Path).


/*Aqui inicializo los predicados dinamos que voy a usar*/

inicializar:-
  assert(correcto([])),
  assert(rondas(0)),
  assert(asertados(0)),assert(parciales(0)),
  assert(combinaciones([])).

/*Con esto elimino el numero que se selecciona correcto en cada juego*/
limpiarCorrecto:-
    (retract(correcto(_)), limpiarCorrecto;!).
/*Aqui genero el numero correcto que el usuario tendra que adivinar*/
generarCorrecto:-
    random(0,10,N1),
    random(0,10,N2),
    random(0,10,N3),
    random(0,10,N4),
    assert(correcto([N1,N2,N3,N4])).
/*Aqui elimino el predicado que lleva el conteo de las rodas de cada juego
  'rondas que tarda el usuario en adivinar'*/
limpiarRondas:-
  (retract(rondas(_)), limpiarRondas;!).

/*Con esto se inicia los predicados dinamos que se usaran por todo el juego*/
restablecer:-
    limpiarRondas,assert(rondas(1)),
    limpiarCorrecto,generarCorrecto,
    correcto(A),
    nl,nl,
    write(A),%quitar comentario si se desea saber la secuenca oculta
    nl,nl,
    write('Secuencia: '),write('[X,X,X,X]').

/*Los siguientes se encargan de crear todo lo que se necesita para comparar un numero con otro
  y decir los asertados en valor y los asertados en valor y posicion*/
creaAsertados:-
    assert(asertados(0)).
eliasertados:-
  (retract(asertados(_)) , eliasertados;!).
creaParciales:-
  assert(parciales(0)).
eliparciales:-
  (retract(parciales(_)) , eliparciales;!).
buenosparciales:-
  eliasertados,creaAsertados,
  eliparciales,creaParciales.

/*Aumenta la cantidad de numeros de igual valor y posicion*/
incrementarAsertados:-
    asertados(B),
    retract(asertados(B)),
    B1 is B + 1,
    assert(asertados(B1)).

/*Aumenta la cantidad de numeros de igual valor*/
incrementarParciales:-
    parciales(R),
    retract(parciales(R)),
    R1 is R + 1,
    assert(parciales(R1)).

/*Aumenta Rondas que tarda el usuario en adivinar*/
incrementarRondas:-
    rondas(R),
    retract(rondas(R)),
    R1 is R + 1,
    write(R1),
    assert(rondas(R1)).



/*La siguientes se encargan de comparar dos secuencias de numeros
  y decir cuantos son similares en valor y cuantos en valor y posicion*/
revisaValor(E, [X], Restante):-
    (E == X, Restante = [], incrementarParciales,!
    ;
    Restante = [X]).

revisaValor(E,[X|Resto],Restante):-
    (E == X, Restante = Resto, incrementarParciales,!
    ;
    revisaValor(E,Resto,Restante2), append([X],Restante2,Restante)).

revisaValor([A],Lista):-
    revisaValor(A,Lista,_),!.

revisaValor([A|Resto],Lista):-
    revisaValor(A,Lista,Resultado),revisaValor(Resto,Resultado).

revisa([A,B,C,D],[A,B,C,D],_,_):-
    nl,nl,
    write('Ese numero es correcto.'),nl,nl,rondas(R),write('Total de rondas en adivinarlo: '),write(R),nl.

/*De todas la anteriores esta es la que se encarga de llamarlas*/
revisa([X1,B,C,D],[E,F,G,H],Asertados,Parciales):-
    buenosparciales,
    Err = [],
    Aser = [],
    (X1 == E, X1,Err1 = Err, Aser1 = Aser; 
    append([X1],Err,Err1), append([E],Aser,Aser1)),
    (B == F, X1,Err2 = Err1, Aser2 = Aser1; 
    append([B],Err1,Err2), append([F],Aser1,Aser2)),
    (C == G, X1,Err3 = Err2, Aser3 = Aser2; 
    append([C],Err2,Err3), append([G],Aser2,Aser3)),
    (D == H, X1,Err4 = Err3, Aser4 = Aser3; 
    append([D],Err3,Err4), append([H],Aser3,Aser4)),
    revisaValor(Err4,Aser4),
    asertados(Asertados),
    parciales(Parciales),
    write('Cantidad correctos: '),
    write(Asertados),nl,
    write('Cantidad correctos pero en diferente posicion: '),
    write(Parciales),nl,nl,
    incrementarRondas,
    jAdivina. 

/*Lista con los numeros permitidos para la secuencia de 4 numeros*/
numeros0_9(['1','2','3','4','5','6','7','8','9','0']).

/*Aqui se lee la secuencia de 4 numeros y tambien se revisa que sea una secuencia de 4 numeros*/
leerNumero(N1,N2,N3,N4):-
    nl,
    write('Ingrese una combinacion de 4 numeros'),nl,nl,
    get_char(A),get_char(B),get_char(C),get_char(D),
    read_string(user_input, "\n", "\r", _, _),
    numeros0_9(Numeros),
    (member(A,Numeros),
        member(B,Numeros),
        member(C,Numeros),
        member(D,Numeros),N1 = A, N2 = B,N3 = C, N4 = D,!;
        write('Debe ser un Secuencia de 4 numeros'),nl,
        leerNumero(A1,B1,C1,D1),N1 = A1, N2 = B1, N3 = C1, N4 = D1).

/*Con esto se Comienza la parte del juego donde el usuario tiene que adivinar*/
jAdivina:-
    nl,
    rondas(NumRondas),
    write('Ronda: '),write(NumRondas),nl,
    write('Digite la combinacion correcta'),
    path_file('tempPVC.pl',Path),
    leerNumero(N1,N2,N3,N4),
    tell(Path),
    write('propuesto('),write([N1,N2,N3,N4]),write(').'),
    told,
    consult(Path),
    propuesto(Propuesto),nl,
    write('Propuesto: '),write(Propuesto),nl,
    correcto(Correcto),
    revisa(Propuesto,Correcto,_,_).


/************************************************************************/

/*Esta se encarga de llevar al usuario por todo el juego*/
jugar:-
    write('Ingrese su nombre'),nl,
    read_string(user_input, "\n", "\r", _, X),
    restablecer,
    nl,write('Adivina la secuencia secreta de la maquina'),
    nl,
    jAdivina,
   rondas(RS), 
    nl, write('Rondas que tardo el usuario para adivinar: '), write(RS), nl.

/*Funciones de append para caso especial*/
my_append([],[],[]).
my_append([],Lista,Lista).
my_append(Lista1,Lista2,[Lista1|Lista2]).

/*Opcion para jugar*/
opcion("1"):- jugar,nl.

/*opcion para salir del programa*/
opcion('4'):- write('Se cerro el programa :D'),nl,nl.

menuPrincipal:-
    write('1. Jugar (maquina adivina)'),nl,
    write('2. Jugar (usted adivina)'),nl,
    write('3. Ver tabla de puntuaciones '),nl,
    write('4. Salir'),nl,nl,
    write('Digite la opcion'),nl,
    read_string(user_input, "\n", "\r", _, String),nl,
    opcion(String).



% Para correrlo, llamar a menuPrincipal. en la consola de swipl
