;;; ---------------------------------------------------------
;;; mvp.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology .\SBCAAD0.1.ttl
;;; :Date 15/05/2025 21:30:52

(defclass Plato "Nos indica un plato del menu"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot es_del_estilo
        (type INSTANCE)
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
)

(defclass Ingrediente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Menu "Define el menu con una serie de aggregados que dependen de su primero, segundo, postre y bebida"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Restriccion "Define una serie de ingredientes que se desaconseja o prohibe usar en funci�n de su peso.
Puede ser de distintos tipos como restricciones alimentarias, dietas o religiosas que nos ayuda a definir su peso."
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Template_Menu
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Tipo_Evento "Define un patr�n de un evento que puede tener restricciones implicitas y sobre-escribir alg�n plato del menu. 
Como una fiesta religiosa teniendo las restricciones de esta o un banquete de boda incluyendo el pastel."
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Estilo "Nos indica el estilo de cocina"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Evento "Nos indica los datos del evento"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(definstances instances
    ;; Plato instances
    ([Macarrones] of Primero
         (es_del_estilo [Pasta])
    )
    ([Sushi-de-aguacate] of Primero
         (es_del_estilo [Sushi])
    )
    ([Ensalada-Cesar] of Primero
         (es_del_estilo [Italiana])
    )
    ([Sopa-de-tomate] of Primero
         (es_del_estilo [Mediterranea])
    )

    ;; Bebida instances
    ([Refresco-de-cola] of Bebida
         (es_del_estilo [Americana])
    )
    ([Vino-tinto] of Bebida
         (es_del_estilo [Mediterranea])
    )
    ([Te-helado] of Bebida
         (es_del_estilo [Asiatica])
    )
    ([Agua-mineral] of Bebida
         (es_del_estilo [Universal])
    )

    ;; Postre instances
    ([Tarta-de-chocolate] of Postre
         (es_del_estilo [Francesa])
    )
    ([Helado-de-vainilla] of Postre
         (es_del_estilo [Italiana])
    )
    ([Flan] of Postre
         (es_del_estilo [Espanola])
    )
    ([Mochi] of Postre
         (es_del_estilo [Japonesa])
    )

    ;; Segundo instances
    ([Filete-de-ternera] of Segundo
         (es_del_estilo [Argentina])
    )
    ([Pescado-al-horno] of Segundo
         (es_del_estilo [Mediterranea])
    )
    ([Tofu-salteado] of Segundo
         (es_del_estilo [Vegetariana])
    )
    ([Pollo-al-curry] of Segundo
         (es_del_estilo [India])
    )

    ;; Categoria instances
    ([Vegetariano] of Categoria)
    ([Vegano] of Categoria)
    ([Sin-gluten] of Categoria)
    ([Bajo-en-carbohidratos] of Categoria)

    ;; Ingrediente instances
    ([Tomate] of Ingrediente)
    ([Pollo] of Ingrediente)
    ([Arroz] of Ingrediente)
    ([Queso] of Ingrediente)
    ([Chocolate] of Ingrediente)

    ;; Menu instances
    ([Menu-del-dia] of Menu)
    ([Menu-infantil] of Menu)
    ([Menu-degustacion] of Menu)
    ([Menu-vegetariano] of Menu)

    ;; Restriccion instances
    ([Halal] of Restriccion)
    ([Kosher] of Restriccion)
    ([Alergia-al-cacahuete] of Restriccion)
    ([Intolerancia-a-la-lactosa] of Restriccion)

    ;; Template_Menu instances
    ([Template-verano] of Template_Menu)
    ([Template-invierno] of Template_Menu)
    ([Template-fiesta] of Template_Menu)
    ([Template-formal] of Template_Menu)

    ;; Tipo_Evento instances
    ([Boda] of Tipo_Evento)
    ([Cumpleanos] of Tipo_Evento)
    ([Reunion-empresarial] of Tipo_Evento)
    ([Comida-familiar] of Tipo_Evento)

    ;; Estilo instances
    ([Pasta] of Estilo)
    ([Sushi] of Estilo)
    ([Italiana] of Estilo)
    ([Mediterranea] of Estilo)
    ([Americana] of Estilo)
    ([Asiatica] of Estilo)
    ([Francesa] of Estilo)
    ([Espanola] of Estilo)
    ([Japonesa] of Estilo)
    ([Argentina] of Estilo)
    ([Vegetariana] of Estilo)
    ([India] of Estilo)
    ([Universal] of Estilo)

    ;; Evento instances
    ([Evento-1] of Evento)
    ([Evento-2] of Evento)
    ([Evento-3] of Evento)
    ([Evento-4] of Evento)
)
