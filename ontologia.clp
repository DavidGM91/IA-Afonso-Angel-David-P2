;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology .\SBCAAD1.8.ttl
;;; :Date 27/05/2025 00:49:42

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

    ([Aguacate] of Ingrediente
         (nombre  "Aguacate")
    )

    ([Albahaca] of Ingrediente
         (nombre  "Albahaca")
    )

    ([Alcachofa] of Ingrediente
         (nombre  "Alcachofa")
    )

    ([Alcohol] of Ingrediente
         (nombre  "Alcohol")
    )

    ([Alga] of Ingrediente
         (nombre  "Alga")
    )

    ([Almejas] of Ingrediente
         (nombre  "Almejas")
    )

    ([Arroz] of Ingrediente
         (nombre  "Arroz")
    )

    ([Arroz_chaufa] of Segundo
         (es_de_categoria  [Cat_Arroz])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz] [Huevo] [Verduras])
         (complejidad  3)
         (nombre  "Arroz chaufa")
         (pesadez  0.7)
         (precio  10)
    )

    ([Arroz_con_curry] of Segundo
         (es_de_categoria  [Cat_Arroz])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz] [Curry])
         (complejidad  2)
         (nombre  "Arroz con curry")
         (pesadez  0.6)
         (precio  9)
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

    ([Arroz_con_verduras] of Primero
         (es_de_categoria  [Cat_Arroz])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz] [Verduras])
         (complejidad  2)
         (nombre  "Arroz con verduras")
         (pesadez  0.6)
         (precio  8)
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

    ([Arroz_glutinoso] of Ingrediente
         (nombre  "Arroz glutinoso")
    )

    ([Arroz_negro] of Segundo
         (es_de_categoria  [Cat_Marisco])
         (es_de_estilo  [Mediterraneo])
         (tiene  [Arroz] [Calamares])
         (complejidad  3)
         (nombre  "Arroz negro")
         (pesadez  0.8)
         (precio  15)
    )

    ([Asiatico] of Estilo
         (es_fusionable_con  [Tailandes])
         (tiene_template  [Menu_Asiatico] [Menu_Asiatico_2] [Menu_Asiatico_3])
         (nombre  "Asiatico")
    )

    ([Atun] of Ingrediente
         (nombre  "Atún")
    )

    ([Atun_con_verduras] of Segundo
         (es_de_categoria  [Cat_Pescado])
         (es_de_estilo  [Asiatico] [Tailandes])
         (tiene  [Atun] [Verduras])
         (complejidad  2)
         (nombre  "Atún con verduras")
         (pesadez  0.5)
         (precio  14)
    )

    ([Azucar] of Ingrediente
         (nombre  "Azúcar")
    )

    ([Bacalao_al_horno] of Segundo
         (es_de_categoria  [Cat_Pescado])
         (es_de_estilo  [Espanol] [Mediterraneo])
         (tiene  [Pescado] [Tomate])
         (complejidad  3)
         (nombre  "Bacalao al horno")
         (pesadez  0.7)
         (precio  15)
    )

    ([Boda] of Tipo_Evento
         (incluye  [Cat_Pastel])
         (limita  [Vegetariano])
         (nombre  "Boda")
    )

    ([Brocheta_de_fruta] of Postre
         (es_de_categoria  [Cat_Fruta])
         (es_de_estilo  [Asiatico] [Tailandes])
         (tiene  [Coco] [Mango])
         (complejidad  1)
         (nombre  "Brocheta de fruta")
         (pesadez  0.3)
         (precio  4)
    )

    ([Cafe] of Ingrediente
         (nombre  "Cafe")
    )

    ([Calamares] of Ingrediente
         (nombre  "Calamares")
    )

    ([Cannoli_Siciliani] of Postre
         (es_de_categoria  [Cat_Dulce])
         (es_de_estilo  [Italiano])
         (tiene  [Chocolate] [Queso])
         (complejidad  2)
         (nombre  "Cannoli Siciliani")
         (pesadez  0.5)
         (precio  8)
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

    ([Cat_Marisco] of Categoria
    )

    ([Cat_Pasta] of Categoria
    )

    ([Cat_Pasta_Fresca] of Categoria
    )

    ([Cat_Pasta_Sin_Glutten] of Categoria
    )

    ([Cat_Pastel] of Categoria
    )

    ([Cat_Pescado] of Categoria
    )

    ([Cat_Sopa] of Categoria
    )

    ([Cat_Vegetariano] of Categoria
    )

    ([Cebada] of Ingrediente
         (nombre  "Cebada")
    )

    ([Cebolla] of Ingrediente
         (nombre  "Cebolla")
    )

    ([Cena_de_gala] of Tipo_Evento
         (incluye  [Cat_Marisco])
         (limita  [Vegetariano])
         (nombre  "Cena de gala")
    )

    ([Cerdo] of Ingrediente
         (nombre  "Cerdo")
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

    ([Ceviche] of Primero
         (es_de_categoria  [Cat_Pescado])
         (es_de_estilo  [Asiatico] [Tailandes])
         (tiene  [Limon] [Pescado])
         (complejidad  2)
         (nombre  "Ceviche")
         (pesadez  0.4)
         (precio  10)
    )

    ([Chile] of Ingrediente
         (nombre  "Chile")
    )

    ([Chocolate] of Ingrediente
         (nombre  "Chocolate")
    )

    ([Coco] of Ingrediente
         (nombre  "Coco")
    )

    ([Crema] of Ingrediente
         (es_compuesto_de  [Leche])
         (nombre  "Crema")
    )

    ([Cumpleanos_infantil] of Tipo_Evento
         (incluye  [Cat_Pastel])
         (limita  [No-Alcoholico])
         (nombre  "Cumpleaños infantil")
    )

    ([Curry] of Ingrediente
         (nombre  "Curry")
    )

    ([Ensalada_Caprese] of Primero
         (es_de_categoria  [Cat_Ensalada])
         (es_de_estilo  [Italiano])
         (tiene  [Albahaca] [Queso] [Tomate])
         (complejidad  1)
         (nombre  "Ensalada Caprese")
         (pesadez  0.3)
         (precio  7)
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

    ([Ensalada_de_alcachofas] of Primero
         (es_de_categoria  [Cat_Ensalada])
         (es_de_estilo  [Italiano] [Mediterraneo])
         (tiene  [Alcachofa] [Limon])
         (complejidad  2)
         (nombre  "Ensalada de alcachofas")
         (pesadez  0.4)
         (precio  8)
    )

    ([Ensalada_de_frutas] of Postre
         (es_de_categoria  [Cat_Fruta])
         (es_de_estilo  [Asiatico] [Espanol] [Italiano] [Mediterraneo] [Tailandes])
         (tiene  [Coco] [Mango])
         (complejidad  1)
         (nombre  "Ensalada de frutas")
         (pesadez  0.3)
         (precio  4)
    )

    ([Ensalada_griega] of Primero
         (es_de_categoria  [Cat_Ensalada])
         (es_de_estilo  [Mediterraneo])
         (tiene  [Aceite] [Queso] [Tomate])
         (complejidad  1)
         (nombre  "Ensalada griega")
         (pesadez  0.4)
         (precio  6)
    )

    ([Espanol] of Estilo
         (es_fusionable_con  [Italiano] [Mediterraneo])
         (tiene_template  [Menu_Espanol])
         (nombre  "Espanol")
    )

    ([Espinacas] of Ingrediente
         (nombre  "Espinacas")
    )

    ([Fiesta_infantil] of Tipo_Evento
         (incluye  [Cat_Pastel])
         (limita  [No-Alcoholico] [Vegano])
         (nombre  "Fiesta infantil")
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

    ([Flan] of Postre
         (es_de_categoria  [Cat_Dulce])
         (tiene  [Huevo] [Leche])
         (complejidad  2)
         (nombre  "Flan")
         (pesadez  0.6)
         (precio  4)
    )

    ([Frances] of Estilo
         (es_fusionable_con  [Espanol] [Mediterraneo])
         (tiene_template  [Menu_Frances])
         (nombre  "Frances")
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
         (nombre  "Gluten free")
         (peso  1)
         (tipo  "Dietaria" "Intolerancia" "Moda")
    )

    ([Halal] of Restriccion
         (restringe  [Alcohol] [Cerdo])
         (nombre  "Halal")
         (peso  0.9)
         (tipo  "Religiosa")
    )

    ([Huevo] of Ingrediente
         (nombre  "Huevo")
    )

    ([Italiano] of Estilo
         (es_fusionable_con  [Espanol] [Mediterraneo])
         (tiene_template  [Menu_Italiano] [Menu_Italiano_2] [Menu_Italiano_3])
         (nombre  "Italiano")
    )

    ([Kosher] of Restriccion
         (restringe  [Cerdo] [Marisco])
         (nombre  "Kosher")
         (peso  0.9)
         (tipo  "Religiosa")
    )

    ([Lasagna] of Segundo
         (es_de_categoria  [Cat_Pasta])
         (es_de_estilo  [Italiano])
         (tiene  [Carne] [Queso] [Salsa_de_tomate])
         (complejidad  3)
         (nombre  "Lasagna")
         (pesadez  0.8)
         (precio  14)
    )

    ([Leche] of Ingrediente
         (nombre  "Leche")
    )

    ([Leche_de_coco] of Ingrediente
         (nombre  "Leche de coco")
    )

    ([Lechuga] of Ingrediente
         (nombre  "Lechuga")
    )

    ([Limon] of Ingrediente
         (nombre  "Limon")
    )

    ([Maiz] of Ingrediente
         (nombre  "Maiz")
    )

    ([Mango] of Ingrediente
         (nombre  "Mango")
    )

    ([Mango_Sticky_Rice] of Postre
         (es_de_categoria  [Cat_Fruta])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz_glutinoso] [Mango])
         (complejidad  2)
         (nombre  "Mango Sticky Rice")
         (pesadez  0.4)
         (precio  7)
    )

    ([Marisco] of Ingrediente
         (nombre  "Marisco")
    )

    ([Matcha_Tiramisu] of Postre
         (es_de_categoria  [Cat_Dulce])
         (es_de_estilo  [Asiatico])
         (tiene  [Queso] [Te_Verde])
         (complejidad  3)
         (nombre  "Matcha Tiramisú")
         (pesadez  0.6)
         (precio  10)
    )

    ([Mediterraneo] of Estilo
         (es_fusionable_con  [Espanol] [Italiano])
         (tiene_template  [Menu_Mediterraneo] [Menu_Mediterraneo_2] [Menu_Mediterraneo_3])
         (nombre  "Mediterraneo")
    )

    ([Mejillones] of Ingrediente
         (nombre  "Mejillones")
    )

    ([Melon] of Ingrediente
         (nombre  "Melón")
    )

    ([Melon_con_jamon] of Postre
         (es_de_categoria  [Cat_Fruta])
         (es_de_estilo  [Espanol] [Italiano] [Mediterraneo])
         (tiene  [Melon])
         (complejidad  1)
         (nombre  "Melón con jamón")
         (pesadez  0.4)
         (precio  5)
    )

    ([Menu_Asiatico] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Arroz])
         (tercer_plato_t  [Cat_Dulce])
    )

    ([Menu_Asiatico_2] of Template_Menu
         (primer_plato_t  [Cat_Arroz])
         (segundo_plato_t  [Cat_Pescado])
         (tercer_plato_t  [Cat_Pastel])
    )

    ([Menu_Asiatico_3] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Pescado])
         (tercer_plato_t  [Cat_Pastel])
    )

    ([Menu_Espanol] of Template_Menu
         (primer_plato_t  [Cat_Ensalada])
         (segundo_plato_t  [Cat_Carne])
         (tercer_plato_t  [Cat_Dulce])
    )

    ([Menu_Frances] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Carne])
         (tercer_plato_t  [Cat_Pastel])
    )

    ([Menu_Frances_Ejemplo] of Menu
         (bebida  [Vino])
         (primer_plato  [Sopa_de_cebolla])
         (segundo_plato  [Filete])
         (tercer_plato  [Profiteroles])
    )

    ([Menu_Italiano] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Pasta])
         (tercer_plato_t  [Cat_Pastel])
    )

    ([Menu_Italiano_2] of Template_Menu
         (primer_plato_t  [Cat_Ensalada])
         (segundo_plato_t  [Cat_Carne])
         (tercer_plato_t  [Cat_Fruta])
    )

    ([Menu_Italiano_3] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Pasta])
         (tercer_plato_t  [Cat_Fruta])
    )

    ([Menu_Mediterraneo] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Carne])
         (tercer_plato_t  [Cat_Pastel])
    )

    ([Menu_Mediterraneo_2] of Template_Menu
         (primer_plato_t  [Cat_Ensalada])
         (segundo_plato_t  [Cat_Marisco])
         (tercer_plato_t  [Cat_Fruta])
    )

    ([Menu_Mediterraneo_3] of Template_Menu
         (primer_plato_t  [Cat_Sopa])
         (segundo_plato_t  [Cat_Pescado])
         (tercer_plato_t  [Cat_Fruta])
    )

    ([Menu_Mexicano] of Template_Menu
         (primer_plato_t  [Cat_Ensalada])
         (segundo_plato_t  [Cat_Vegetariano])
         (tercer_plato_t  [Cat_Dulce])
    )

    ([Menu_Mexicano_Ejemplo] of Menu
         (bebida  [Cerveza])
         (primer_plato  [Ensalada_Cesar])
         (segundo_plato  [Tacos_vegetarianos])
         (tercer_plato  [Flan])
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

    ([Mexicano] of Estilo
         (es_fusionable_con  [Espanol])
         (tiene_template  [Menu_Mexicano])
         (nombre  "Mexicano")
    )

    ([Miel] of Ingrediente
         (nombre  "Miel")
    )

    ([Minestrone] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Italiano] [Mediterraneo])
         (tiene  [Pasta] [Tomate] [Verduras])
         (complejidad  2)
         (nombre  "Minestrone")
         (pesadez  0.5)
         (precio  8)
    )

    ([Mochi] of Postre
         (es_de_categoria  [Cat_Dulce])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz_glutinoso] [Azucar])
         (complejidad  2)
         (nombre  "Mochi")
         (pesadez  0.4)
         (precio  5)
    )

    ([Ninguno] of Tipo_Evento
         (nombre  "Ninguno")
    )

    ([No-Alcoholico] of Restriccion
         (restringe  [Alcohol])
         (nombre  "No alcoholico")
         (peso  1)
         (tipo  "Estilo de vida")
    )

    ([Osso_buco] of Segundo
         (es_de_categoria  [Cat_Carne])
         (es_de_estilo  [Italiano])
         (tiene  [Carne] [Tomate])
         (complejidad  3)
         (nombre  "Osso buco")
         (pesadez  0.8)
         (precio  14)
    )

    ([Pad_Thai_Vegano] of Segundo
         (es_de_categoria  [Cat_Vegetariano])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz] [Tofu])
         (complejidad  3)
         (nombre  "Pad Thai Vegano")
         (pesadez  0.6)
         (precio  11)
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

    ([Pasta_e_fagioli] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Italiano] [Mediterraneo])
         (tiene  [Pasta] [Tomate])
         (complejidad  2)
         (nombre  "Pasta e fagioli")
         (pesadez  0.6)
         (precio  7)
    )

    ([Pasta_y_pescado] of Template_Menu
         (primer_plato_t  [Cat_Pasta])
         (segundo_plato_t  [Cat_Pescado])
         (tercer_plato_t  [Cat_Dulce])
    )

    ([Pato_Lacado] of Segundo
         (es_de_categoria  [Cat_Carne])
         (es_de_estilo  [Asiatico])
         (tiene  [Cerdo] [Miel])
         (complejidad  4)
         (nombre  "Pato Lacado")
         (pesadez  0.8)
         (precio  20)
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

    ([Piña] of Ingrediente
         (nombre  "Piña")
    )

    ([Piña_asada] of Postre
         (es_de_categoria  [Cat_Fruta])
         (es_de_estilo  [Asiatico] [Tailandes])
         (tiene  [Piña])
         (complejidad  2)
         (nombre  "Piña asada")
         (pesadez  0.5)
         (precio  5)
    )

    ([Pollo] of Ingrediente
         (es_alternativa  [Tofu])
         (nombre  "Pollo")
    )

    ([Profiteroles] of Postre
         (es_de_categoria  [Cat_Pastel])
         (es_de_estilo  [Frances])
         (tiene  [Chocolate] [Crema])
         (complejidad  3)
         (nombre  "Profiteroles")
         (pesadez  0.7)
         (precio  6)
    )

    ([Queso] of Ingrediente
         (es_compuesto_de  [Leche])
         (nombre  "Queso")
    )

    ([Risotto_al_Tartufo] of Segundo
         (es_de_categoria  [Cat_Arroz])
         (es_de_estilo  [Italiano])
         (tiene  [Arroz] [Queso])
         (complejidad  4)
         (nombre  "Risotto al Tartufo")
         (pesadez  0.7)
         (precio  18)
    )

    ([Risotto_de_setas] of Primero
         (es_de_categoria  [Cat_Arroz])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz] [Setas])
         (complejidad  3)
         (nombre  "Risotto de setas")
         (pesadez  0.7)
         (precio  10)
    )

    ([Romero] of Ingrediente
         (nombre  "Romero")
    )

    ([Salmón] of Ingrediente
         (nombre  "Salmón")
    )

    ([Salmón_a_la_plancha] of Segundo
         (es_de_categoria  [Cat_Pescado])
         (es_de_estilo  [Frances] [Mediterraneo])
         (tiene  [Limon] [Salmón])
         (complejidad  2)
         (nombre  "Salmón a la plancha")
         (pesadez  0.6)
         (precio  12)
    )

    ([Salsa_de_tomate] of Ingrediente
         (es_compuesto_de  [Tomate])
         (nombre  "Salsa de tomate")
    )

    ([Setas] of Ingrediente
         (nombre  "Setas")
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

    ([Sopa_de_fideos] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Asiatico])
         (tiene  [Pasta] [Verduras])
         (complejidad  2)
         (nombre  "Sopa de fideos")
         (pesadez  0.4)
         (precio  6)
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

    ([Sopa_de_pescado] of Primero
         (es_de_categoria  [Cat_Pescado])
         (es_de_estilo  [Espanol] [Mediterraneo])
         (tiene  [Pescado] [Tomate])
         (complejidad  3)
         (nombre  "Sopa de pescado")
         (pesadez  0.6)
         (precio  12)
    )

    ([Sopa_de_wakame] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Asiatico])
         (tiene  [Alga] [Tofu])
         (complejidad  1)
         (nombre  "Sopa de wakame")
         (pesadez  0.3)
         (precio  5)
    )

    ([Spaghetti_alle_vongole] of Segundo
         (es_de_categoria  [Cat_Marisco])
         (es_de_estilo  [Italiano])
         (tiene  [Almejas] [Pasta])
         (complejidad  3)
         (nombre  "Spaghetti alle vongole")
         (pesadez  0.7)
         (precio  16)
    )

    ([Stracciatella] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Italiano] [Mediterraneo])
         (tiene  [Huevo] [Queso])
         (complejidad  1)
         (nombre  "Stracciatella")
         (pesadez  0.4)
         (precio  6)
    )

    ([Sushi_de_Salmón] of Segundo
         (es_de_categoria  [Cat_Pescado])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz] [Salmón])
         (complejidad  4)
         (nombre  "Sushi de Salmón")
         (pesadez  0.5)
         (precio  16)
    )

    ([Tacos_vegetarianos] of Segundo
         (es_de_categoria  [Cat_Vegetariano])
         (es_de_estilo  [Mexicano])
         (tiene  [Aguacate] [Crema] [Lechuga] [Maiz])
         (complejidad  2)
         (nombre  "Tacos vegetarianos")
         (pesadez  0.6)
         (precio  9)
    )

    ([Tailandes] of Estilo
         (es_fusionable_con  [Asiatico])
         (tiene_template  [Menu_Tailandes])
         (nombre  "Tailandes")
    )

    ([Tarta_de_queso] of Postre
         (es_de_categoria  [Cat_Pastel])
         (es_de_estilo  [Espanol] [Frances] [Italiano] [Mediterraneo])
         (tiene  [Azucar] [Huevo] [Queso])
         (complejidad  3)
         (nombre  "Tarta de queso")
         (pesadez  0.8)
         (precio  7)
    )

    ([Tartar_de_atun] of Primero
         (es_de_categoria  [Cat_Pescado])
         (es_de_estilo  [Frances])
         (tiene  [Aguacate] [Atun])
         (complejidad  2)
         (nombre  "Tartar de atún")
         (pesadez  0.5)
         (precio  14)
    )

    ([Tempura_de_Verduras] of Primero
         (es_de_categoria  [Cat_Vegetariano])
         (es_de_estilo  [Asiatico])
         (tiene  [Verduras])
         (complejidad  2)
         (nombre  "Tempura de Verduras")
         (pesadez  0.5)
         (precio  9)
    )

    ([Tiramisu] of Postre
         (es_de_categoria  [Cat_Dulce] [Cat_Pastel])
         (es_de_estilo  [Italiano])
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

    ([Tom_yum] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Asiatico])
         (tiene  [Chile] [Leche_de_coco])
         (complejidad  3)
         (nombre  "Tom yum")
         (pesadez  0.5)
         (precio  7)
    )

    ([Tomate] of Ingrediente
         (nombre  "Tomate")
         (temporada  "otono" "verano")
    )

    ([Te_Verde] of Ingrediente
         (nombre  "Te Verde")
    )

    ([Uva] of Ingrediente
         (nombre  "Uva")
    )

    ([Vegano] of Restriccion
         (restringe  [Carne] [Cat_Carne] [Cat_Pescado] [Huevo] [Leche] [Pescado] [Queso])
         (nombre  "Vegano")
         (peso  1)
         (tipo  "Dietaria" "Estilo de vida")
    )

    ([Vegetariano] of Restriccion
         (restringe  [Carne] [Cat_Carne] [Cat_Pescado] [Pescado])
         (nombre  "Vegetariano")
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

    ([Zuppa_di_Pesce] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Italiano])
         (tiene  [Pescado] [Tomate])
         (complejidad  2)
         (nombre  "Zuppa di Pesce")
         (pesadez  0.6)
         (precio  12)
    )

    ([Pasta_Carbonara_Sin_Gluten] of Primero
         (es_de_categoria  [Cat_Pasta_Sin_Glutten])
         (es_de_estilo  [Italiano])
         (tiene  [Huevo] [Queso])
         (complejidad  2)
         (nombre  "Carbonara Sin Gluten")
         (pesadez  0.6)
         (precio  10)
    )

    ([Minestrone_Sin_Gluten] of Primero
         (es_de_categoria  [Cat_Pasta_Sin_Glutten])
         (es_de_estilo  [Italiano] [Mediterraneo])
         (tiene  [Tomate] [Verduras])
         (complejidad  2)
         (nombre  "Minestrone Sin Gluten")
         (pesadez  0.5)
         (precio  7)
    )

    ([Vongole_Sin_Gluten] of Segundo
         (es_de_categoria  [Cat_Pasta_Sin_Glutten])
         (es_de_estilo  [Italiano])
         (tiene  [Almejas] [Aceite] [Ajo])
         (complejidad  2)
         (nombre  "Vongole Sin Gluten")
         (pesadez  0.5)
         (precio  13)
    )

    ([Fagioli_Sin_Gluten] of Primero
         (es_de_categoria  [Cat_Pasta_Sin_Glutten])
         (es_de_estilo  [Italiano])
         (tiene  [Tomate] [Alubias])
         (complejidad  1)
         (nombre  "Fagioli Sin Gluten")
         (pesadez  0.4)
         (precio  6)
    )

    ([Mochi_TeVerde] of Postre
         (es_de_categoria  [Cat_Pastel])
         (es_de_estilo  [Asiatico])
         (tiene  [Arroz_glutinoso] [Te_Verde] [Azucar])
         (complejidad  2)
         (nombre  "Mochi de Té Verde")
         (pesadez  0.4)
         (precio  8)
    )

    ([Zuppa_di_Pomodoro] of Primero
         (es_de_categoria  [Cat_Sopa])
         (es_de_estilo  [Italiano])
         (tiene  [Tomate] [Cebolla] [Albahaca])
         (complejidad  1)
         (nombre  "Zuppa di Pomodoro")
         (pesadez  0.4)
         (precio  4)
    )

    ([Insalata_di_Rucola] of Primero
         (es_de_categoria  [Cat_Ensalada])
         (es_de_estilo  [Italiano])
         (tiene  [Lechuga] [Tomate] [Aceite])
         (complejidad  1)
         (nombre  "Insalata Verde")
         (pesadez  0.3)
         (precio  5)
    )

    ([Bruschetta_al_Pomodoro] of Primero
         (es_de_categoria  [Cat_Ensalada])
         (es_de_estilo  [Italiano])
         (tiene  [Pan] [Tomate] [Albahaca])
         (complejidad  1)
         (nombre  "Bruschetta al Pomodoro")
         (pesadez  0.4)
         (precio  4)
    )

    ([Polpette_di_Verdure] of Segundo
         (es_de_categoria  [Cat_Vegetariano])
         (es_de_estilo  [Italiano])
         (tiene  [Verduras] [Huevo] [Queso])
         (complejidad  2)
         (nombre  "Polpette di Verdure")
         (pesadez  0.6)
         (precio  5)
    )

    ([Pollo_al_Limone] of Segundo
         (es_de_categoria  [Cat_Carne])
         (es_de_estilo  [Italiano])
         (tiene  [Pollo] [Limon] [Romero])
         (complejidad  2)
         (nombre  "Pollo al Limone")
         (pesadez  0.5)
         (precio  6)
    )

    ([Frittata_di_Zucchine] of Segundo
         (es_de_categoria  [Cat_Vegetariano])
         (es_de_estilo  [Italiano])
         (tiene  [Huevo] [Verduras])
         (complejidad  1)
         (nombre  "Frittata di Verdure")
         (pesadez  0.5)
         (precio  5)
    )

    ([Panna_Cotta_Semplice] of Postre
         (es_de_categoria  [Cat_Pastel])
         (es_de_estilo  [Italiano])
         (tiene  [Crema] [Azucar])
         (complejidad  2)
         (nombre  "Panna Cotta")
         (pesadez  0.6)
         (precio  4)
    )

    ([Macedonia_di_Frutta] of Postre
         (es_de_categoria  [Cat_Fruta])
         (es_de_estilo  [Italiano])
         (tiene  [Melon] [Uva])
         (complejidad  1)
         (nombre  "Macedonia")
         (pesadez  0.3)
         (precio  3)
    )

    ([Cantucci_Senza_Glutine] of Postre
         (es_de_categoria  [Cat_Dulce])
         (es_de_estilo  [Italiano])
         (tiene  [Almendra] [Azucar])
         (complejidad  1)
         (nombre  "Cantucci (GF)")
         (pesadez  0.4)
         (precio  6)
    )

    ([Pastel_Luna_Asiatico] of Postre
         (es_de_categoria  [Cat_Pastel])
         (es_de_estilo  [Asiatico])
         (tiene  [Mango] [Coco] [Azucar])
         (complejidad  3)
         (nombre  "Pastel de Luna (Mango-Coco)")
         (pesadez  0.6)
         (precio  12)
    )

    ([Tarta_Coco_Vapor] of Postre
         (es_de_categoria  [Cat_Pastel])
         (es_de_estilo  [Asiatico])
         (tiene  [Leche_de_coco] [Arroz_glutinoso] [Huevo])
         (complejidad  2)
         (nombre  "Khanom Chan Tailandés")
         (pesadez  0.5)
         (precio  7)
    )

)
