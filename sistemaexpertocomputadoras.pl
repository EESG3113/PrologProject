% Opciones de componentes
opciones_procesador(['Intel Core i9', 'Intel Core i7', 'AMD Ryzen 9', 'AMD Ryzen 7']).
opciones_ram(['8GB', '16GB', '32GB', '64GB']).
opciones_almacenamiento(['256GB SSD', '512GB SSD', '1TB SSD', '2TB SSD']).
opciones_placa_base(['ASUS ROG Strix', 'MSI B450', 'Gigabyte Z490', 'ASRock B550']).
opciones_fuente_alimentacion(['500W', '650W', '750W', '850W']).
opciones_refrigeracion(['Aire', 'Líquida', 'Disipador']).

opcion(personalizada, 'Configurador personalizado en desarrollo...').

opcion_predisenada('Programación', alta,
    ['Intel Core i9, 32GB RAM, 1TB SSD, RTX 3080',
     'AMD Ryzen 9, 32GB RAM, 1TB SSD, RTX 3080']).
opcion_predisenada('Programación', media,
    ['Intel Core i7, 16GB RAM, 512GB SSD, GTX 1660',
     'AMD Ryzen 7, 16GB RAM, 512GB SSD, GTX 1660']).
opcion_predisenada('Programación', baja,
    ['Intel Core i5, 8GB RAM, 256GB SSD, GTX 1050',
     'AMD Ryzen 5, 8GB RAM, 256GB SSD, GTX 1050']).

opcion_predisenada('Gaming', alta,
    ['Intel Core i9, 32GB RAM, 1TB SSD, RTX 4090',
     'AMD Ryzen 9, 32GB RAM, 1TB SSD, RTX 4090']).
opcion_predisenada('Gaming', media,
    ['Intel Core i7, 16GB RAM, 512GB SSD, RTX 3060',
     'AMD Ryzen 7, 16GB RAM, 512GB SSD, RTX 3060']).
opcion_predisenada('Gaming', baja,
    ['Intel Core i5, 8GB RAM, 256GB SSD, GTX 1650',
     'AMD Ryzen 5, 8GB RAM, 256GB SSD, GTX 1650']).

opcion_predisenada('Renderizado', alta,
    ['Intel Core i9, 64GB RAM, 2TB SSD, RTX 3090',
     'AMD Ryzen 9, 64GB RAM, 2TB SSD, RTX 3090']).
opcion_predisenada('Renderizado', media,
    ['Intel Core i7, 32GB RAM, 1TB SSD, RTX 2070',
     'AMD Ryzen 7, 32GB RAM, 1TB SSD, RTX 2070']).
opcion_predisenada('Renderizado', baja,
    ['Intel Core i5, 16GB RAM, 512GB SSD, GTX 1660',
     'AMD Ryzen 5, 16GB RAM, 512GB SSD, GTX 1660']).

% Preguntar por cada componente con opciones
preguntar_componente(procesador, Respuesta) :-
    opciones_procesador(Opciones),
    write('Elige un procesador:'), nl,
    listar_opciones(Opciones),
    read(Opcion),
    nth1(Opcion, Opciones, Respuesta).

preguntar_componente(ram, Respuesta) :-
    opciones_ram(Opciones),
    write('Elige la memoria RAM:'), nl,
    listar_opciones(Opciones),
    read(Opcion),
    nth1(Opcion, Opciones, Respuesta).

preguntar_componente(almacenamiento, Respuesta) :-
    opciones_almacenamiento(Opciones),
    write('Elige el almacenamiento:'), nl,
    listar_opciones(Opciones),
    read(Opcion),
    nth1(Opcion, Opciones, Respuesta).

preguntar_componente(placa_base, Respuesta) :-
    opciones_placa_base(Opciones),
    write('Elige la placa base:'), nl,
    listar_opciones(Opciones),
    read(Opcion),
    nth1(Opcion, Opciones, Respuesta).

preguntar_componente(fuente_alimentacion, Respuesta) :-
    opciones_fuente_alimentacion(Opciones),
    write('Elige la fuente de alimentación:'), nl,
    listar_opciones(Opciones),
    read(Opcion),
    nth1(Opcion, Opciones, Respuesta).

preguntar_componente(refrigeracion, Respuesta) :-
    opciones_refrigeracion(Opciones),
    write('Elige la refrigeración:'), nl,
    listar_opciones(Opciones),
    read(Opcion),
    nth1(Opcion, Opciones, Respuesta).

% Función para listar las opciones disponibles con índices
listar_opciones(Opciones) :-
    listar_opciones(Opciones, 1).

listar_opciones([], _).
listar_opciones([Opcion | Resto], Indice) :-
    write(Indice), write('. '), write(Opcion), nl,
    NuevoIndice is Indice + 1,
    listar_opciones(Resto, NuevoIndice).

% Sistema experto actualizado
sistema_experto :-
    write('¿Qué tipo de computadora deseas?'), nl,
    write('1. Personalizada'), nl,
    write('2. Prediseñada'), nl,
    read(Tipo),
    (
        Tipo == 1 ->
            configuracion_personalizada;
        Tipo == 2 ->
            configuracion_predisenada
    ).

% Configuración personalizada
configuracion_personalizada :-
    write('Configurador personalizado...'), nl,
    preguntar_componente(procesador, Procesador),
    preguntar_componente(ram, RAM),
    preguntar_componente(almacenamiento, Almacenamiento),
    preguntar_componente(placa_base, PlacaBase),
    preguntar_componente(fuente_alimentacion, Fuente),
    preguntar_componente(refrigeracion, Refrigeracion),
    evaluar_compatibilidad(Procesador, RAM, Almacenamiento, PlacaBase, Fuente, Refrigeracion, Compatibilidad),
    calcular_uso_total(Procesador, RAM, Almacenamiento, PlacaBase, Fuente, Refrigeracion, UsoTotal),
    clasificar_gama_uso(Procesador, RAM, Gama, Uso),
    resumen_final(Procesador, RAM, Almacenamiento, PlacaBase, Fuente, Refrigeracion, Gama, Uso, Compatibilidad, UsoTotal).

% Evaluar compatibilidad
evaluar_compatibilidad(_, _, _, _, _, _, 'Compatible'). % Placeholder

% Calcular uso total
calcular_uso_total(_, _, _, _, _, _, 'Uso total calculado'). % Placeholder

% Clasificar gama y uso
clasificar_gama_uso(_, _, 'Gama alta', 'Uso recomendado'). % Placeholder

% Resumen final
resumen_final(Procesador, RAM, Almacenamiento, PlacaBase, Fuente, Refrigeracion, Gama, Uso, Compatibilidad, UsoTotal) :-
    format('Resumen de la configuración personalizada:\n'),
    format('Procesador: ~w\n', [Procesador]),
    format('Memoria RAM: ~w\n', [RAM]),
    format('Almacenamiento: ~w\n', [Almacenamiento]),
    format('Placa base: ~w\n', [PlacaBase]),
    format('Fuente de alimentación: ~w\n', [Fuente]),
    format('Refrigeración: ~w\n', [Refrigeracion]),
    format('Gama: ~w\n', [Gama]),
    format('Uso recomendado: ~w\n', [Uso]),
    format('Compatibilidad: ~w\n', [Compatibilidad]),
    format('Uso total: ~w\n', [UsoTotal]).

% Configuración prediseñada
configuracion_predisenada :-
    write('¿Para qué la necesitas?'), nl,
    write('1. Programación'), nl,
    write('2. Gaming'), nl,
    write('3. Renderizado'), nl,
    read(Campo),
    (
        Campo == 1 -> CampoElegido = 'Programación';
        Campo == 2 -> CampoElegido = 'Gaming';
        Campo == 3 -> CampoElegido = 'Renderizado';
        write('Opción no válida.'), nl, fail
    ),
    write('¿Qué gama prefieres?'), nl,
    write('1. Alta'), nl,
    write('2. Media'), nl,
    write('3. Baja'), nl,
    read(Gama),
    (
        Gama == 1 -> GamaElegida = alta;
        Gama == 2 -> GamaElegida = media;
        Gama == 3 -> GamaElegida = baja;
        write('Opción no válida.'), nl, fail
    ),
    opcion_predisenada(CampoElegido, GamaElegida, Opciones),
    write('Opciones disponibles:'), nl,
    listar_opciones(Opciones).