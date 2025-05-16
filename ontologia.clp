(defclass Plato "Nos indica un plato del menu"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot compatibilidad
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

(defclass Restriccion "Define una serie de ingredientes que se desaconseja o prohibe usar en funci�n de su peso.
Puede ser de distintos tipos como restricciones alimentarias, dietas o religiosas que nos ayuda a definir su peso."
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (slot peso
        (type FLOAT)
        (create-accessor read-write))
    (slot tipo
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

(defclass Tipo_Evento "Define un patr�n de un evento que puede tener restricciones implicitas y sobre-escribir alg�n plato del menu. 
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
    ;; ========== Estilo Instances ==========
    ([Estilo-Italiano] of Estilo
        (nombre "Italiano")
        (es_fusionable_con [Estilo-Mediterraneo] [Estilo-Europeo])
    )
    ([Estilo-Mediterraneo] of Estilo
        (nombre "Mediterráneo")
        (es_fusionable_con [Estilo-Italiano] [Estilo-Espanol])
    )
    ([Estilo-Asiatico] of Estilo
        (nombre "Asiático")
        (es_fusionable_con [Estilo-Fusion])
    )

    ;; ========== Ingrediente Instances ==========
    ([Ingrediente-Tomate] of Ingrediente
        (nombre "Tomate")
        (temporada "verano" "otoño")
        (es_alternativa [Ingrediente-Pimiento])
    )
    ([Ingrediente-Pollo] of Ingrediente
        (nombre "Pollo")
        (es_compuesto_de [Ingrediente-Pechuga] [Ingrediente-Muslo])
    )
    ([Ingrediente-Queso] of Ingrediente
        (nombre "Queso")
        (es_alternativa [Ingrediente-Tofu])
    )
    ([Ingrediente-Chocolate] of Ingrediente
        (nombre "Chocolate")
        (temporada "invierno")
    )
    ([Ingrediente-Lechuga] of Ingrediente
        (nombre "Lechuga")
        (temporada "primavera" "verano" "otoño")
    )
    ([Ingrediente-Tomate] of Ingrediente
        (nombre "Tomate")
        (temporada "verano")
    )
    ([Ingrediente-Cebolla] of Ingrediente
        (nombre "Cebolla")
        (temporada "todo el año")
    )
    ([Ingrediente-Pollo] of Ingrediente
        (nombre "Pollo")
    )
    ([Ingrediente-Queso] of Ingrediente
        (nombre "Queso")
        (es_alternativa [Ingrediente-Tofu])
    )
    ([Ingrediente-Dorada] of Ingrediente
        (nombre "Dorada")
    )
    ([Ingrediente-Limon] of Ingrediente
        (nombre "Limón")
    )
    ([Ingrediente-Salmon] of Ingrediente
        (nombre "Salmón")
    )
    ([Ingrediente-Eneldo] of Ingrediente
        (nombre "Eneldo")
    )
    ([Ingrediente-Yogur] of Ingrediente
        (nombre "Yogur")
    )
    ([Ingrediente-Miel] of Ingrediente
        (nombre "Miel")
    )
    ([Ingrediente-Fresas] of Ingrediente
        (nombre "Fresas")
        (temporada "primavera")
    )
    ([Ingrediente-Arandanos] of Ingrediente
        (nombre "Arándanos")
        (temporada "verano")
    )
    ([Ingrediente-Tofu] of Ingrediente
        (nombre "Tofu")
    )
    ([Ingrediente-Huevo] of Ingrediente
        (nombre "Huevo")
    )
    ([Ingrediente-Cafe] of Ingrediente
        (nombre "Café")
    )
    ([Ingrediente-Uva] of Ingrediente
        (nombre "Uva")
    )
    ([Ingrediente-Romero] of Ingrediente
        (nombre "Romero")
    )
    ([Ingrediente-Merluza] of Ingrediente
        (nombre "Merluza")
    )
    ([Ingrediente-Pasta] of Ingrediente
        (nombre "Pasta")
    )

    ;; ========== Plato Subclasses ==========
    ;; Primeros
    ([Primero-PastaCarbonara] of Primero
        (nombre "Pasta Carbonara")
        (es_de_estilo [Estilo-Italiano])
        (tiene [Ingrediente-Pasta] [Ingrediente-Queso] [Ingrediente-Huevo])
        (compatibilidad [Segundo-PolloAsado] [Postre-Tiramisu])
        (complejidad 3)
        (pesadez 0.7)
        (precio 12)
    )
    ([Primero-EnsaladaCesar] of Primero
        (nombre "Ensalada César")
        (es_de_estilo [Estilo-Mediterraneo])
        (tiene [Ingrediente-Lechuga] [Ingrediente-Pollo] [Ingrediente-Queso])
        (compatibilidad [Segundo-PescadoHorno] [Postre-Flan])
        (complejidad 2)
        (pesadez 0.4)
        (precio 10)
    )

    ;; Segundos
    ([Segundo-PolloAsado] of Segundo
        (nombre "Pollo Asado")
        (es_de_estilo [Estilo-Italiano])
        (tiene [Ingrediente-Pollo] [Ingrediente-Romero])
        (compatibilidad [Primero-PastaCarbonara] [Postre-Fruta])
        (complejidad 2)
        (pesadez 0.6)
        (precio 15)
    )
    ([Segundo-PescadoHorno] of Segundo
        (nombre "Pescado al Horno")
        (es_de_estilo [Estilo-Mediterraneo])
        (tiene [Ingrediente-Merluza] [Ingrediente-Limon])
        (compatibilidad [Primero-EnsaladaCesar] [Postre-Flan])
        (complejidad 3)
        (pesadez 0.5)
        (precio 18)
    )

    ;; Postres
    ([Postre-Tiramisu] of Postre
        (nombre "Tiramisú")
        (es_de_estilo [Estilo-Italiano])
        (tiene [Ingrediente-Queso] [Ingrediente-Chocolate] [Ingrediente-Cafe])
        (compatibilidad [Primero-PastaCarbonara] [Segundo-PolloAsado])
        (complejidad 4)
        (pesadez 0.8)
        (precio 8)
    )
    ([Postre-Flan] of Postre
        (nombre "Flan")
        (es_de_estilo [Estilo-Espanol])
        (tiene [Ingrediente-Huevo] [Ingrediente-Leche])
        (compatibilidad [Primero-EnsaladaCesar] [Segundo-PescadoHorno])
        (complejidad 2)
        (pesadez 0.6)
        (precio 6)
    )

    ;; Bebidas
    ([Bebida-VinoTinto] of Bebida
        (nombre "Vino Tinto")
        (es_de_estilo [Estilo-Mediterraneo])
        (tiene [Ingrediente-Uva] [Ingrediente-Alcohol])
        (compatibilidad [Segundo-PolloAsado] [Segundo-PescadoHorno])
        (complejidad 1)
        (pesadez 0.5)
        (precio 12)
    )
     ([Bebida-VinoBlanco] of Bebida
        (nombre "Vino Blanco")
        (tiene [Ingrediente-Uva] [Ingrediente-Alcohol])
        (complejidad 1)
        (pesadez 0.4)
        (precio 12)
    )
    ([Bebida-AguaMineral] of Bebida
        (nombre "Agua Mineral")
        (compatibilidad [Primero-PastaCarbonara] [Primero-EnsaladaCesar])
        (complejidad 0)
        (pesadez 0.0)
        (precio 2)
    )

    ;; ========== Template_Menu Instances ==========
    ([Template-Mediterraneo] of Template_Menu
        (nombre "Plantilla Mediterránea")
        (primer_plato_t [Categoria-Ensalada])  
        (segundo_plato_t [Categoria-Pescado])  
        (tercer_plato_t [Categoria-Yogur])    
    )
    ([Template-Italiano] of Template_Menu
        (nombre "Plantilla Italiano")
        (primer_plato_t [Categoria-Pasta])
        (segundo_plato_t [Categoria-Carne])
        (tercer_plato_t [Categoria-Tarta])
    )

    ;; ========== Restriccion Instances ==========
    ([Restriccion-Celiaquia] of Restriccion
        (nombre "Celiaquía")
        (peso 1.0)
        (tipo "Alergia")
    )
    ([Restriccion-Lactosa] of Restriccion
        (nombre "Intolerancia a la Lactosa")
        (peso 0.8)
        (tipo "Intolerancia")
    )
    ([Restriccion-Halal] of Restriccion
        (nombre "Halal")
        (peso 0.9)
        (tipo "Religioso")
    )

    ;; ========== Tipo_Evento Instances ==========
    ([TipoEvento-Boda] of Tipo_Evento
        (nombre "Boda")
        (incluye [Postre-TartaBodas])
        (limita [Restriccion-Halal] [Restriccion-Vegano])
    )
    ([TipoEvento-Cumpleanos] of Tipo_Evento
        (nombre "Cumpleaños")
        (incluye [Postre-Tarta])
    )

    ;; ========== Categoria Instances (for template structure) ==========
    ([Categoria-Entrante] of Categoria
        (nombre "Entrante")
    )
    ([Categoria-Ensalada] of Categoria
        (nombre "Ensalada")
    )
    ([Categoria-Pasta] of Categoria
        (nombre "Pasta")
    )
    ([Categoria-Pescado] of Categoria
        (nombre "Pescado")
    )
    ([Categoria-Carne] of Categoria
        (nombre "Carne")
    )
    ([Categoria-Yogur] of Categoria
        (nombre "Yogur")
    )
    ([Categoria-Fruta] of Categoria
        (nombre "Fruta")
    )
    ([Categoria-Tarta] of Categoria
        (nombre "Tarta")
    )

    ;; ========== Estilo Instances ==========
    ([Estilo-Mediterraneo] of Estilo
        (nombre "Mediterráneo")
        (es_fusionable_con [Estilo-Italiano] [Estilo-Espanol])
    )
    ([Estilo-Italiano] of Estilo
        (nombre "Italiano")
    )
    ([Estilo-Asiatico] of Estilo
        (nombre "Asiático")
    )

    ;; ========== Plato Instances (with category reference) ==========
    ;; Primeros that match "Ensalada" category
    ([Primero-EnsaladaMixta] of Primero
        (nombre "Ensalada Mixta")
        (es_de_estilo [Estilo-Mediterraneo])
        (tiene [Ingrediente-Lechuga] [Ingrediente-Tomate] [Ingrediente-Cebolla])
        (complejidad 1)
        (pesadez 0.3)
        (precio 8)
    )
    ([Primero-EnsaladaCesar] of Primero
        (nombre "Ensalada César")
        (es_de_estilo [Estilo-Mediterraneo])
        (tiene [Ingrediente-Lechuga] [Ingrediente-Pollo] [Ingrediente-Queso])
        (complejidad 2)
        (pesadez 0.4)
        (precio 10)
    )

    ;; Segundos that match "Pescado" category
    ([Segundo-DoradaHorno] of Segundo
        (nombre "Dorada al Horno")
        (es_de_estilo [Estilo-Mediterraneo])
        (tiene [Ingrediente-Dorada] [Ingrediente-Limon])
        (complejidad 3)
        (pesadez 0.5)
        (precio 18)
    )
    ([Segundo-SalmónPlancha] of Segundo
        (nombre "Salmón a la Plancha")
        (es_de_estilo [Estilo-Mediterraneo])
        (tiene [Ingrediente-Salmon] [Ingrediente-Eneldo])
        (complejidad 2)
        (pesadez 0.6)
        (precio 20)
    )

    ;; Postres that match "Yogur" category
    ([Postre-YogurNatural] of Postre
        (nombre "Yogur Natural")
        (es_de_estilo [Estilo-Mediterraneo])
        (tiene [Ingrediente-Yogur] [Ingrediente-Miel])
        (complejidad 1)
        (pesadez 0.2)
        (precio 4)
    )
    ([Postre-YogurFrutosRojos] of Postre
        (nombre "Yogur con Frutos Rojos")
        (es_de_estilo [Estilo-Mediterraneo])
        (tiene [Ingrediente-Yogur] [Ingrediente-Fresas] [Ingrediente-Arandanos])
        (complejidad 1)
        (pesadez 0.3)
        (precio 5)
    )
)
