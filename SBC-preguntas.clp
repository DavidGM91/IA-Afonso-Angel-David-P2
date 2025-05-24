
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

;; Generamos la lista de restricciones posibles
(deftemplate lista-restricciones-posibles
(multislot restricciones)
)
(deftemplate lista-restricciones-activas
(multislot restricciones)
)
(defrule generar-lista-restricciones-posibles
    ""(declare (salience 150))
	(not (lista-restricciones-posibles)) =>
	(assert (lista-restricciones-posibles (restricciones (find-all-instances ((?e Restriccion)) TRUE))))
)

;; Realizamos las preguntas al usuario y almacenamos las respuestas en hechos separados
(defrule determinar-estilo-de-cocina
    (declare (salience 98)) 
	?l <- (lista-nombres-estilos (nombres $?nombres))
	=> 
    (assert (estilo-de-cocina (ask-estilo ?nombres)))
)

(defrule determinar-restricciones-activas
    (declare (salience 96)) 
	?l <- (lista-restricciones-posibles (restricciones $?restricciones-posibles))
	=> 
	(bind $?restricciones-activas (create$))

	(bind ?i 1)
	(while (<= ?i (length$ ?restricciones-posibles))
	do
	(bind ?r (nth$ ?i ?restricciones-posibles))
	(bind ?answer (ask-question-with-values (str-cat "¿Aplicar la restriccion \"" (send ?r get-nombre) "\"? (Y/N): ") y n))
	(if (eq ?answer y) then (bind $?restricciones-activas (insert$ ?restricciones-activas ?i ?r)))
	(bind ?i (+ ?i 1))
	)
	
	(assert (lista-restricciones-activas (restricciones ?restricciones-activas)))
)

(defrule determinar-comensales
	""(declare (salience 95))
	(not (comensales)) =>
	(assert (comensales 
		(ask-question "¿Para cuantos comensales?")
    ))
)

(defrule determinar-bebida
    (declare (salience 90)) 
	(not (menu-con-bebida)) =>
	(bind ?answer (ask-question-with-values "¿Debería el menú incluir bebida? (Y/N): " y n))
	(assert (menu-con-bebida (eq ?answer y)))
)

(defrule determinar-precio-minimo-menu
    (declare (salience 80)) 
	(not (precio-minimo-menu)) =>
	(assert (precio-minimo-menu 
		(ask-question "¿Cuál es el presupuesto mínimo por persona?")
    ))
)

(defrule determinar-precio-maximo-menu
    (declare (salience 70)) 
	(not (precio-maximo-menu)) =>
	(assert (precio-maximo-menu 
		(ask-question "¿Cuál es el presupuesto máximo por persona?")
    ))
)

;; Definimos el template para almacenar el problema concreto
(deftemplate problema-concreto
    (slot estilo)
    (slot comensales)
    (slot incluir-bebida)
    (slot presupuesto-minimo)
    (slot presupuesto-maximo)
    (multislot restricciones)
)
;; Y los unificamos en un solo hecho que representa el problema concreto
(defrule crear-problema-concreto
    ?e <- (estilo-de-cocina ?estilo)
    ?c <- (comensales ?comensales)
    ?b <- (menu-con-bebida ?bebida)
    ?pmin <- (precio-minimo-menu ?pminimo)
    ?pmax <- (precio-maximo-menu ?pmaximo)
    ?r <- (lista-restricciones-activas (restricciones $?restricciones))
    =>
    (assert (problema-concreto 
        (estilo ?estilo)
        (comensales ?comensales)
		(incluir-bebida ?bebida)
		(presupuesto-minimo ?pminimo)
		(presupuesto-maximo ?pmaximo)
		(restricciones ?restricciones)
    ))
    (retract ?e)
    (retract ?c)
    (retract ?b)
    (retract ?pmin)
    (retract ?pmax)
    (retract ?r)
)