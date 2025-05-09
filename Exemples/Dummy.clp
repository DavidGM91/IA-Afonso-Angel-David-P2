;;; ---------------------------------------------------------
;;; Dummy.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology .\Dummy.ttl
;;; :Date 13/04/2025 19:20:15

(defclass Lugar
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Estar un lugar cerca de otro lugar
    (multislot cerca_de
        (type INSTANCE)
        (create-accessor read-write))
    ;;; Functional indica que solo se tiene una copia de este valor
    (slot habitantes
        (type SYMBOL)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (multislot topDataProperty
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Ciudad
    (is-a Lugar)
    (role concrete)
    (pattern-match reactive)
)

(defclass Pueblo
    (is-a Lugar)
    (role concrete)
    (pattern-match reactive)
)

(defclass Persona "Clase de persiana o persona"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Funcional implica 1-N
    (slot vive_en
        (type INSTANCE)
        (create-accessor read-write))
    (slot edad
        (type INTEGER)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Adulto
    (is-a Persona)
    (role concrete)
    (pattern-match reactive)
    (multislot progenitor_de
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Niño
    (is-a Persona)
    (role concrete)
    (pattern-match reactive)
)

(definstances instances
    ([Barcelona] of Ciudad
         (cerca_de  [Centelles])
         (habitantes  3)
         (nombre  "Barcelona")
    )

    ([Centelles] of Pueblo
    )

    ([María] of Niño
    )

    ([Pepe] of Adulto
         (progenitor_de  [María])
    )

)
