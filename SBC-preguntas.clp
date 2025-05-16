
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
        (print crlf)
        (bind ?answer (read))
        (if (lexemep ?answer) 
            then (bind ?answer (lowcase ?answer))))
    ?answer)
(deffunction ask-question (?question)
    (print ?question)
    (print crlf)
    (bind ?answer (read))
    ?answer)

;; Generamos la lista de estilos disponibles
(deftemplate lista-estilos
(multislot estilos)
)
(deftemplate lista-nombres-estilos
(multislot nombres (type STRING))
)
(defrule generar-lista-estilos
    ""(declare (salience 150))
	(not (lista-estilos)) =>
	(assert (lista-estilos (estilos (find-all-instances ((?e Estilo)) TRUE))))
)
(defrule generar-lista-nombres-estilos
    ""(declare (salience 125))
	?l <- (lista-estilos (estilos $?estilos))
	(not (lista-nombres-estilos)) =>
	(bind $?nombres (create$))
	
	(bind ?i 1)
	(while (<= ?i (length$ ?estilos))
	do
	(bind ?e (nth$ ?i ?estilos))
	(bind $?nombres (insert$ ?nombres ?i (send ?e get-nombre)))
	(bind ?i (+ ?i 1))
	)
	
	(assert (lista-nombres-estilos (nombres ?nombres)))
)
;;
(deffunction ask-estilo ($?allowed-values)
	(print "¿Qué estilo de cocina quieres?")
	(print crlf)
	(print "Estilos disponibles:")
	(print crlf)

	(bind ?i 1)
	(while (<= ?i (length$ ?allowed-values))
	do
	(bind ?e (nth$ ?i ?allowed-values))
	(printout t ?e crlf)
	(bind ?i (+ ?i 1))
	)

	(bind ?answer (read))
	;(while (not (member$ ?answer ?allowed-values)) do
	;	(print "¿Qué estilo de cocina quieres?")
	;	(print crlf)
	;	(print "Estilos disponibles:")
	;	(print crlf)
	;
	;	(bind ?i 1)
	;	(while (<= ?i (length$ ?allowed-values))
	;	do
	;	(bind ?e (nth$ ?i ?allowed-values))
	;	(printout t ?e crlf)
	;	(bind ?i (+ ?i 1))
	;	)
	;	
	;	(bind ?answer (read))
	;	(if (lexemep ?answer) 
	;		then (bind ?answer ?answer)))
	?answer)

;; Realizamos las preguntas al usuario y almacenamos las respuestas en hechos separados
(defrule determinar-estilo-de-cocina
    (declare (salience 98)) 
	?l <- (lista-nombres-estilos (nombres $?nombres))
	=> 
    (assert (estilo-de-cocina (ask-estilo ?nombres)))
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
    ?c <- (comensales ?blah)
    =>
    (assert (problema-concreto 
        (estilo ?estilo)
        (comensales ?blah)
    ))
    (retract ?e)
    (retract ?c)
)