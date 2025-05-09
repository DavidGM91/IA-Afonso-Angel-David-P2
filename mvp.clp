;;; ---------------------------------------------------------
;;; mvp.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology .\mvp2.ttl
;;; :Date 09/05/2025 20:02:21

(defclass Estilo "Nos indica el estilo de cocina"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Evento "Nos indica los datos del evento"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot numero_de_comensales
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Plato "Nos indica un plato del menu"
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot es_del_estilo
        (type INSTANCE)
        (create-accessor read-write))
)

(definstances instances
    ([Macarrones] of Plato
         (es_del_estilo  [Pasta])
    )

    ([Pasta] of Estilo
    )

    ([Sushi] of Estilo
    )

    ([Sushi-de-aguacate] of Plato
         (es_del_estilo  [Sushi])
    )

)
