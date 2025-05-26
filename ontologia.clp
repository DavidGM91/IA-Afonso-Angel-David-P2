;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology .\SBCAAD1.5.ttl
;;; :Date 26/05/2025 20:42:18

(defclass Plato "Nos indica un plato del menu"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot compatibilidad
        (type INSTANCE)
        (create-accessor read-write))
    (multislot es_de_categoria
        (type INSTANCE)
        (create-accessor read-write))
    (multislot es_de_estilo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tiene
        (type INSTANCE)
        (create-accessor read-write))
    (slot complejidad
        (type INTEGER)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (slot pesadez
        (type FLOAT)
        (create-accessor read-write))
    (slot precio
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Bebida
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass Postre
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass Primero
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass Segundo
    (is-a Plato)
    (role concrete)
    (pattern-match reactive)
)

(defclass Categoria
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Estilo "Nos indica el estilo de cocina"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot es_fusionable_con
        (type INSTANCE)
        (create-accessor read-write))
    (multislot tiene_template
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Evento "Nos indica los datos del evento"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot barato
        (type INSTANCE)
        (create-accessor read-write))
    (slot es_de_tipo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot es_del_estilo
        (type INSTANCE)
        (create-accessor read-write))
    (slot gucci
        (type INSTANCE)
        (create-accessor read-write))
    (slot intermedio
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (multislot rango_precio
        (type INTEGER)
        (create-accessor read-write))
    (slot tipo_de_grupo
        (type STRING)
        (create-accessor read-write))
)

(defclass Ingrediente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot es_alternativa
        (type INSTANCE)
        (create-accessor read-write))
    (multislot es_compuesto_de
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (multislot temporada
        (type STRING)
        (create-accessor read-write))
)

(defclass Menu "Define el menu con una serie de aggregados que dependen de su primero, segundo, postre y bebida"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot bebida
        (type INSTANCE)
        (create-accessor read-write))
    (slot primer_plato
        (type INSTANCE)
        (create-accessor read-write))
    (slot segundo_plato
        (type INSTANCE)
        (create-accessor read-write))
    (slot tercer_plato
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Restriccion "Define una serie de ingredientes que se desaconseja o prohibe usar en función de su peso.
Puede ser de distintos tipos como restricciones alimentarias, dietas o religiosas que nos ayuda a definir su peso."
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot ofrece_alternativa
        (type INSTANCE)
        (create-accessor read-write))
    (multislot restringe
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (slot peso
        (type FLOAT)
        (create-accessor read-write))
    (multislot tipo
        (type STRING)
        (create-accessor read-write))
)

(defclass Template_Menu
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot primer_plato_t
        (type INSTANCE)
        (create-accessor read-write))
    (slot segundo_plato_t
        (type INSTANCE)
        (create-accessor read-write))
    (slot tercer_plato_t
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Tipo_Evento "Define un patrón de un evento que puede tener restricciones implicitas y sobre-escribir algún plato del menu. 
Como una fiesta religiosa teniendo las restricciones de esta o un banquete de boda incluyendo el pastel."
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot incluye
        (type INSTANCE)
        (create-accessor read-write))
    (multislot limita
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(definstances instances
    ([Aceite] of Ingrediente
         (nombre  "Aceite")
    )

    ([Agua] of Ingrediente
         (nombre  "Agua")
    )

    ([Agua_Mineral] of Bebida
         (es_de_categoria  [Cat_Bebida])
         (es_de_estilo  [Asiatico] [Espanol] [Italiano] [Mediterraneo])
         (tiene  [Agua])
         (complejidad  0)
         (nombre  "Agua")
         (pesadez  0)
         (precio  1)
    )

    ([Alcohol] of Ingrediente
         (nombre  "Alcohol")
    )

    ([Alga] of Ingrediente
         (nombre  "Alga")
    )

    ([Arroz] of Ingrediente
         (nombre  "Arroz")
    )

    ([Arroz_con_pollo] of Segundo
         (es_de_categoria  [Cat_Carne])
         (es_de_estilo  [Espanol] [Mediterraneo])
         (tiene  [Arroz] [Pollo] [Salsa_de_tomate])
         (complejidad  3)
         (nombre  "Arroz con pollo")
         (pesadez  0.7)
         (precio  10)
    )

    ([Arroz_frito] of Segundo
         (es_de_categoria  [Cat_Arroz])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz] [Huevo] [Verduras])
         (complejidad  3)
         (nombre  "Arroz frito")
         (pesadez  0.6)
         (precio  8)
    )

    ([Asiatico] of Estilo
         (es_fusionable_con  [Tailandes])
         (tiene_template  [Menu_Asiatico])
         (nombre  "Asiatico")
    )

    ([Boda] of Tipo_Evento
         (incluye  [Cat_Pastel])
         (limita  [Vegetariano])
         (nombre  "Boda")
    )

    ([Cafe] of Ingrediente
         (nombre  "Cafe")
    )

    ([Carne] of Ingrediente
         (nombre  "Carne")
    )

    ([Cat_Arroz] of Categoria
    )

    ([Cat_Bebida] of Categoria
    )

    ([Cat_Carne] of Categoria
    )

    ([Cat_Dulce] of Categoria
    )

    ([Cat_Ensalada] of Categoria
    )

    ([Cat_Fruta] of Categoria
    )

    ([Cat_Pasta] of Categoria
    )

    ([Cat_Pasta_Sin_Glutten] of Categoria
    )

    ([Cat_Pastel] of Categoria
    )

    ([Cat_Pescado] of Categoria
    )

    ([Cat_Sopa] of Categoria
    )

    ([Cebada] of Ingrediente
         (nombre  "Cebada")
    )

    ([Cerveza] of Bebida
         (es_de_categoria  [Cat_Bebida])
         (es_de_estilo  [Espanol] [Mediterraneo])
         (tiene  [Alcohol] [Cebada])
         (complejidad  1)
         (nombre  "Cerveza")
         (pesadez  0.5)
         (precio  3)
    )

    ([Chocolate] of Ingrediente
         (nombre  "Chocolate")
    )

    ([Coco] of Ingrediente
         (nombre  "Coco")
    )

    ([Cumpleanos_infantil] of Tipo_Evento
         (incluye  [Cat_Pastel])
         (limita  [No-Alcoholico])
         (nombre  "Cumpleaños infantil")
    )

    ([Ensalada_Cesar] of Primero
         (es_de_categoria  [Cat_Ensalada])
         (es_de_estilo  [Mediterraneo])
         (tiene  [Lechuga] [Pan] [Pollo] [Queso])
         (complejidad  2)
         (nombre  "Ensalada César")
         (pesadez  0.5)
         (precio  8)
    )

    ([Espanol] of Estilo
         (es_fusionable_con  [Italiano] [Mediterraneo])
         (tiene_template  [Menu_Espanol])
         (nombre  "Espanol")
    )

    ([Flan] of Postre
         (es_de_categoria  [Cat_Dulce])
         (tiene  [Huevo] [Leche])
         (complejidad  2)
         (nombre  "Flan")
         (pesadez  0.6)
         (precio  4)
    )

    ([Fruta_fresca] of Postre
         (es_de_categoria  [Cat_Fruta])
         (es_de_estilo  [Tailandes])
         (tiene  [Coco] [Mango])
         (complejidad  1)
         (nombre  "Fruta fresca")
         (pesadez  0.3)
         (precio  4)
    )

    ([Gluten-free] of Restriccion
         (ofrece_alternativa  [Cat_Pasta_Sin_Glutten])
         (restringe  [Cat_Pasta])
         (peso  1)
         (tipo  "Dietaria" "Intolerancia" "Moda")
    )

    ([Huevo] of Ingrediente
         (nombre  "Huevo")
    )

    ([Italiano] of Estilo
         (es_fusionable_con  [Espanol] [Mediterraneo])
         (tiene_template  [Pasta_y_pescado])
         (nombre  "Italiano")
    )

    ([Leche] of Ingrediente
         (nombre  "Leche")
    )

    ([Lechuga] of Ingrediente
         (nombre  "Lechuga")
    )

    ([Limon] of Ingrediente
         (nombre  "Limon")
    )

    ([Mango] of Ingrediente
         (nombre  "Mango")
    )

    ([Mediterraneo] of Estilo
         (es_fusionable_con  [Espanol] [Italiano])
         (tiene_template  [Pasta_y_pescado])
         (nombre  "Mediterraneo")
    )

    ([Menu_Asiatico] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Arroz])
         (tercer_plato_t  [Cat_Dulce])
    )

    ([Menu_Espanol] of Template_Menu
         (primer_plato_t  [Cat_Ensalada])
         (segundo_plato_t  [Cat_Carne])
         (tercer_plato_t  [Cat_Dulce])
    )

    ([Menu_Tailandes] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Arroz])
         (tercer_plato_t  [Cat_Fruta])
    )

    ([Merluza] of Ingrediente
         (es_alternativa  [Tofu])
         (es_compuesto_de  [Pescado])
         (nombre  "Merluza")
    )

    ([Ninguno] of Tipo_Evento
         (nombre  "Ninguno")
    )

    ([No-Alcoholico] of Restriccion
         (restringe  [Alcohol])
         (peso  1)
         (tipo  "Estilo de vida")
    )

    ([Pan] of Ingrediente
         (nombre  "Pan")
    )

    ([Pasta] of Ingrediente
         (nombre  "Pasta")
    )

    ([Pasta_Carbonara] of Primero
         (es_de_categoria  [Cat_Pasta])
         (es_de_estilo  [Italiano])
         (tiene  [Huevo] [Pasta] [Queso])
         (complejidad  3)
         (nombre  "Pasta Carbonara")
         (pesadez  0.7)
         (precio  12)
    )

    ([Pasta_Carbonara_Sin_Glutten] of Primero
         (es_de_categoria  [Cat_Pasta_Sin_Glutten])
         (es_de_estilo  [Italiano])
         (tiene  [Huevo] [Queso])
         (complejidad  3)
         (nombre  "Pasta Carbonara Sin Glutten")
         (pesadez  0.7)
         (precio  8)
    )

    ([Pasta_y_pescado] of Template_Menu
         (primer_plato_t  [Cat_Pasta])
         (segundo_plato_t  [Cat_Pescado])
         (tercer_plato_t  [Cat_Dulce])
    )

    ([Pescado] of Ingrediente
         (nombre  "Pescado")
    )

    ([Pescado_al_horno] of Segundo
         (es_de_categoria  [Cat_Pescado])
         (tiene  [Limon] [Merluza])
         (complejidad  3)
         (nombre  "Pescado al Horno")
         (precio  6)
    )

    ([Pollo] of Ingrediente
         (es_alternativa  [Tofu])
         (nombre  "Pollo")
    )

    ([Queso] of Ingrediente
         (es_compuesto_de  [Leche])
         (nombre  "Queso")
    )

    ([Romero] of Ingrediente
         (nombre  "Romero")
    )

    ([Salsa_de_tomate] of Ingrediente
         (es_compuesto_de  [Tomate])
         (nombre  "Salsa de tomate")
    )

    ([Sopa_de_miso] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Asiatico])
         (tiene  [Alga] [Tofu])
         (complejidad  2)
         (nombre  "Sopa de miso")
         (pesadez  0.4)
         (precio  5)
    )

    ([Tailandes] of Estilo
         (es_fusionable_con  [Asiatico])
         (tiene_template  [Menu_Tailandes])
         (nombre  "Tailandes")
    )

    ([Tiramisu] of Postre
         (es_de_categoria  [Cat_Dulce] [Cat_Pastel])
         (tiene  [Cafe] [Chocolate] [Queso])
         (complejidad  3)
         (nombre  "Tiramisu")
         (pesadez  0.8)
         (precio  5)
    )

    ([Tofu] of Ingrediente
         (es_alternativa  [Merluza] [Pollo])
         (nombre  "Tofu")
    )

    ([Tomate] of Ingrediente
         (nombre  "Tomate")
         (temporada  "otono" "verano")
    )

    ([Uva] of Ingrediente
         (nombre  "Uva")
    )

    ([Vegano] of Restriccion
         (restringe  [Carne] [Cat_Carne] [Cat_Pescado] [Huevo] [Leche] [Pescado] [Queso])
         (peso  1)
         (tipo  "Dietaria" "Estilo de vida")
    )

    ([Vegetariano] of Restriccion
         (restringe  [Carne] [Cat_Carne] [Cat_Pescado] [Pescado])
         (peso  0.8)
         (tipo  "Dietaria" "Estilo de vida")
    )

    ([Verduras] of Ingrediente
         (nombre  "Verduras")
    )

    ([Vino] of Bebida
         (es_de_categoria  [Cat_Bebida])
         (es_de_estilo  [Espanol] [Italiano] [Mediterraneo])
         (tiene  [Alcohol] [Uva])
         (complejidad  1)
         (nombre  "Vino Tinto")
         (pesadez  0.5)
         (precio  6)
    )

    ([Cat_Marisco] of Categoria
    )

    ([Cat_Vegetariano] of Categoria
    )

    ([Cat_Pasta_Fresca] of Categoria
    )

    ([Frances] of Estilo
         (es_fusionable_con  [Mediterraneo] [Espanol])
         (tiene_template  [Menu_Frances])
         (nombre  "Frances")
    )

    ([Mexicano] of Estilo
         (es_fusionable_con  [Espanol])
         (tiene_template  [Menu_Mexicano])
         (nombre  "Mexicano")
    )

    ([Menu_Frances] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Carne])
         (tercer_plato_t  [Cat_Pastel])
    )

    ([Menu_Mexicano] of Template_Menu
         (primer_plato_t  [Cat_Ensalada])
         (segundo_plato_t  [Cat_Vegetariano])
         (tercer_plato_t  [Cat_Dulce])
    )

    ([Maiz] of Ingrediente
         (nombre  "Maiz")
    )

    ([Chile] of Ingrediente
         (nombre  "Chile")
    )

    ([Aguacate] of Ingrediente
         (nombre  "Aguacate")
    )

    ([Crema] of Ingrediente
         (es_compuesto_de  [Leche])
         (nombre  "Crema")
    )

    ([Sopa_de_cebolla] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Frances])
         (tiene  [Cebolla] [Pan] [Queso])
         (complejidad  2)
         (nombre  "Sopa de cebolla")
         (pesadez  0.5)
         (precio  7)
    )

    ([Tacos_vegetarianos] of Segundo
         (es_de_categoria  [Cat_Vegetariano])
         (es_de_estilo  [Mexicano])
         (tiene  [Maiz] [Aguacate] [Lechuga] [Crema])
         (complejidad  2)
         (nombre  "Tacos vegetarianos")
         (pesadez  0.6)
         (precio  9)
    )

    ([Profiteroles] of Postre
         (es_de_categoria  [Cat_Pastel])
         (es_de_estilo  [Frances])
         (tiene  [Crema] [Chocolate])
         (complejidad  3)
         (nombre  "Profiteroles")
         (pesadez  0.7)
         (precio  6)
    )

    ([Halal] of Restriccion
         (restringe  [Cerdo] [Alcohol])
         (peso  0.9)
         (tipo  "Religiosa")
    )

    ([Kosher] of Restriccion
         (restringe  [Cerdo] [Marisco])
         (peso  0.9)
         (tipo  "Religiosa")
    )

    ([Cena_de_gala] of Tipo_Evento
         (incluye  [Cat_Marisco])
         (limita  [Vegetariano])
    )

    ([Fiesta_infantil] of Tipo_Evento
         (incluye  [Cat_Pastel])
         (limita  [No-Alcoholico] [Vegano])
    )

    ([Menu_Frances_Ejemplo] of Menu
         (bebida  [Vino])
         (primer_plato  [Sopa_de_cebolla])
         (segundo_plato  [Filete])
         (tercer_plato  [Profiteroles])
    )

    ([Menu_Mexicano_Ejemplo] of Menu
         (bebida  [Cerveza])
         (primer_plato  [Ensalada_Cesar])
         (segundo_plato  [Tacos_vegetarianos])
         (tercer_plato  [Flan])
    )

    ([Cerdo] of Ingrediente
         (nombre  "Cerdo")
    )

    ([Filete] of Segundo
         (es_de_categoria  [Cat_Carne])
         (es_de_estilo  [Frances])
         (tiene  [Carne] [Romero])
         (complejidad  3)
         (nombre  "Filete")
         (pesadez  0.8)
         (precio  15)
    )

)
