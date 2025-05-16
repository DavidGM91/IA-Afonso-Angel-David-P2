;;; ---------------------------------------------------------
;;; ../ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology .\SBCAAD0.2.ttl
;;; :Date 16/05/2025 21:22:45

(defclass Plato "Nos indica un plato del menu"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot es_del_estilo
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
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
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Evento "Nos indica los datos del evento"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Ingrediente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Menu "Define el menu con una serie de aggregados que dependen de su primero, segundo, postre y bebida"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Restriccion "Define una serie de ingredientes que se desaconseja o prohibe usar en función de su peso.
Puede ser de distintos tipos como restricciones alimentarias, dietas o religiosas que nos ayuda a definir su peso."
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Template_Menu
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Tipo_Evento "Define un patrón de un evento que puede tener restricciones implicitas y sobre-escribir algún plato del menu. 
Como una fiesta religiosa teniendo las restricciones de esta o un banquete de boda incluyendo el pastel."
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(definstances instances
)
