
;;██████╗░██████╗░███████╗░██████╗░██╗░░░██╗███╗░░██╗████████╗░█████╗░░██████╗
;;██╔══██╗██╔══██╗██╔════╝██╔════╝░██║░░░██║████╗░██║╚══██╔══╝██╔══██╗██╔════╝
;;██████╔╝██████╔╝█████╗░░██║░░██╗░██║░░░██║██╔██╗██║░░░██║░░░███████║╚█████╗░
;;██╔═══╝░██╔══██╗██╔══╝░░██║░░╚██╗██║░░░██║██║╚████║░░░██║░░░██╔══██║░╚═══██╗
;;██║░░░░░██║░░██║███████╗╚██████╔╝╚██████╔╝██║░╚███║░░░██║░░░██║░░██║██████╔╝
;;╚═╝░░░░░╚═╝░░╚═╝╚══════╝░╚═════╝░░╚═════╝░╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░

;; En este archivo se definen las preguntas que se le hacen al usuario
;; y se almacenan las respuestas en la base de conocimiento como el problema concreto.

;; Definimos los tipos de preguntas
(deffunction ask-question-with-values (?question $?allowed-values)
    (print ?question)
    (bind ?answer (read))
    (if (lexemep ?answer) 
        then (bind ?answer (lowcase ?answer)))
    (while (not (member$ ?answer ?allowed-values)) do
        (print ?question)
        (bind ?answer (read))
        (if (lexemep ?answer) 
            then (bind ?answer (lowcase ?answer))))
    ?answer)
(deffunction ask-question (?question)
    (print ?question)
    (bind ?answer (read))
    ?answer)

;; Realizamos las preguntas al usuario y almacenamos las respuestas en hechos separados
(defrule determinar-estilo-de-cocina
    ""(declare (salience 100)) =>
    (assert (estilo-de-cocina 
        (ask-question-with-values "¿Qué estilo de cocina quieres?(Pasta/Sushi)" pasta sushi)
    ))
)

(defrule determinar-comensales
	""(declare (salience 95)) => 
	(assert (comensales 
		(ask-question "¿Para cuantos comensales?")
    ))
)

;; Definimos el template para almacenar el problema concreto
(deftemplate problema-concreto
    (slot estilo)
    (slot comensales)
)
;; Y los unificamos en un solo hecho que representa el problema concreto
(defrule crear-problema-concreto
    ?e <- (estilo-de-cocina ?estilo)
    ?c <- (comensales ?cantidad)
    =>
    (assert (problema-concreto 
        (estilo ?estilo)
        (comensales ?cantidad)
    ))
    (retract ?e)
    (retract ?c)
)