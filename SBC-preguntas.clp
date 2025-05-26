
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
	(print "¿Qué estilo de cocina quiere? (Introduzca el número)")
	(print crlf)
	(print "Estilos disponibles:")
	(print crlf)

	(bind ?i 1)
	(while (<= ?i (length$ ?allowed-values))
	do
	(bind ?e (nth$ ?i ?allowed-values))
	(printout t ?i ". " ?e crlf)
	(bind ?i (+ ?i 1))
	)

	(bind ?answer (read))
	?answer)

;; Generamos la lista de eventos disponibles
(deftemplate lista-eventos
(multislot eventos)
)
(deftemplate lista-nombres-eventos
(multislot nombres (type STRING))
)
(defrule generar-lista-eventos
    ""(declare (salience 150))
	(not (lista-eventos)) =>
	(assert (lista-eventos (eventos (find-all-instances ((?e Tipo_Evento)) TRUE))))
)
(defrule generar-lista-nombres-eventos
    ""(declare (salience 125))
	?l <- (lista-eventos (eventos $?eventos))
	(not (lista-nombres-eventos)) =>
	(bind $?nombres (create$))
	
	(bind ?i 1)
	(while (<= ?i (length$ ?eventos))
	do
	(bind ?e (nth$ ?i ?eventos))
	(bind $?nombres (insert$ ?nombres ?i (send ?e get-nombre)))
	(bind ?i (+ ?i 1))
	)
	
	(assert (lista-nombres-eventos (nombres ?nombres)))
)
;;
(deffunction ask-evento ($?allowed-values)
	(print "¿Qué tipo de evento se celebrará? (Introduzca el número)")
	(print crlf)
	(print "Eventos disponibles:")
	(print crlf)

	(bind ?i 1)
	(while (<= ?i (length$ ?allowed-values))
	do
	(bind ?e (nth$ ?i ?allowed-values))
	(printout t ?i ". " ?e crlf)
	(bind ?i (+ ?i 1))
	)

	(bind ?answer (read))
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
	(not (estilo-de-cocina))
	=>
	(bind ?i (ask-estilo ?nombres))
    (assert (estilo-de-cocina (nth$ ?i $?nombres)))
)

(defrule determinar-tipo-de-evento
    (declare (salience 97)) 
	?l <- (lista-nombres-eventos (nombres $?nombres))
	(not (tipo-de-evento))
	=> 
	(bind ?i (ask-evento ?nombres))
    (assert (tipo-de-evento (nth$ ?i $?nombres)))
)

(defrule determinar-restricciones-activas
    (declare (salience 96)) 
	(not (restricciones-activas))
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
    (slot evento)
    (slot comensales)
    (slot incluir-bebida)
    (slot presupuesto-minimo)
    (slot presupuesto-maximo)
    (multislot restricciones)
)
;; Y los unificamos en un solo hecho que representa el problema concreto
(defrule crear-problema-concreto
    ?es <- (estilo-de-cocina ?estilo)
    ?ev <- (tipo-de-evento ?evento)
    ?c <- (comensales ?comensales)
    ?b <- (menu-con-bebida ?bebida)
    ?pmin <- (precio-minimo-menu ?pminimo)
    ?pmax <- (precio-maximo-menu ?pmaximo)
    ?r <- (lista-restricciones-activas (restricciones $?restricciones))
    =>
    (assert (problema-concreto 
        (estilo ?estilo)
        (evento ?evento)
        (comensales ?comensales)
		(incluir-bebida ?bebida)
		(presupuesto-minimo ?pminimo)
		(presupuesto-maximo ?pmaximo)
		(restricciones ?restricciones)
    ))
    (retract ?es)
    (retract ?ev)
    (retract ?c)
    (retract ?b)
    (retract ?pmin)
    (retract ?pmax)
    (retract ?r)
)