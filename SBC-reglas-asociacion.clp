
;;██████╗░███████╗░██████╗░██╗░░░░░░█████╗░░██████╗  ██████╗░███████╗
;;██╔══██╗██╔════╝██╔════╝░██║░░░░░██╔══██╗██╔════╝  ██╔══██╗██╔════╝
;;██████╔╝█████╗░░██║░░██╗░██║░░░░░███████║╚█████╗░  ██║░░██║█████╗░░
;;██╔══██╗██╔══╝░░██║░░╚██╗██║░░░░░██╔══██║░╚═══██╗  ██║░░██║██╔══╝░░
;;██║░░██║███████╗╚██████╔╝███████╗██║░░██║██████╔╝  ██████╔╝███████╗
;;╚═╝░░╚═╝╚══════╝░╚═════╝░╚══════╝╚═╝░░╚═╝╚═════╝░  ╚═════╝░╚══════╝
;;
;;░█████╗░░██████╗░█████╗░░█████╗░██╗░█████╗░░█████╗░██╗░█████╗░███╗░░██╗
;;██╔══██╗██╔════╝██╔══██╗██╔══██╗██║██╔══██╗██╔══██╗██║██╔══██╗████╗░██║
;;███████║╚█████╗░██║░░██║██║░░╚═╝██║███████║██║░░╚═╝██║██║░░██║██╔██╗██║
;;██╔══██║░╚═══██╗██║░░██║██║░░██╗██║██╔══██║██║░░██╗██║██║░░██║██║╚████║
;;██║░░██║██████╔╝╚█████╔╝╚█████╔╝██║██║░░██║╚█████╔╝██║╚█████╔╝██║░╚███║
;;╚═╝░░╚═╝╚═════╝░░╚════╝░░╚════╝░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░╚════╝░╚═╝░░╚══╝

;; En este archivo se definen las reglas para derivar la solución del problema abstracto.

(defclass Template_Escogido
    (is-a Template_Menu)
    (role concrete)
    (pattern-match reactive)
    (slot multiplicador-precio-min (create-accessor read-write))
    (slot multiplicador-precio-max (create-accessor read-write))
)

(defrule escoger-templates-menu
	?pa <- (problema-abstracto (estilo-activo ?nombre-estilo))
	?estilo <- (object 
        (is-a Estilo)
        (nombre ?nombre-estilo))
    =>
	(bind ?i 1)
	(while (<= ?i 3)
	do
	(bind ?t (nth$ ?i (send ?estilo get-tiene_template)))
	(make-instance (gensym) of Template_Escogido
        (nombre (send ?t get-nombre))
        (primer_plato_t (send ?t get-primer_plato_t))
        (segundo_plato_t (send ?t get-segundo_plato_t))
        (tercer_plato_t (send ?t get-tercer_plato_t))
		(multiplicador-precio-min (+ 1.0 (* ?i 0.2)))
		(multiplicador-precio-max (+ 0.1 (* ?i 0.3)))
    )
	(bind ?i (+ ?i 1))
	)
)

(deftemplate complejidad-maxima
   (slot maximo))

(defrule determinar-complejidad-maxima
"Esta regla determina la complejidad máxima permitida para el menú en función del tamaño del grupo de comensales."
	(not (complejidad-maxima))
	(problema-abstracto (clasificacion-grupo ?grupo))
	=>
	(if (eq ?grupo mediano) then (assert (complejidad-maxima (maximo 5))))
	(if (eq ?grupo grande) then (assert (complejidad-maxima (maximo 4))))
	(if (eq ?grupo enorme) then (assert (complejidad-maxima (maximo 3))))
	(if (eq ?grupo mass-catering) then (assert (complejidad-maxima (maximo 2))))
)

(defrule eliminar-platos-complejos
"Esta regla elimina los platos cuya complejidad es mayor que la complejidad máxima permitida."
	(complejidad-maxima (maximo ?cm))
	?plato <- (object 
        (is-a Plato)
        (complejidad ?c))
	=>
	(if (> ?c ?cm) then (unmake-instance ?plato))
)

(defrule primer-plato-celiaco
"Esta regla adapta el primer plato del menú si el cliente tiene celiaquía. Por restricciones de tiempo no hemos podido hacerlo dinamico aunque se podría hacer utilizando de la restriccion la categoria recomendada."
    (declare (salience 200))
	(problema-abstracto (restricciones-activas $?restricciones))
	?t <- (object 
        (is-a Template_Escogido)
        (primer_plato_t [Cat_Pasta]))
	=>
	(make-instance (gensym) of Template_Escogido
        (nombre (send ?t get-nombre))
        (primer_plato_t [Cat_Pasta_Sin_Glutten])
        (segundo_plato_t (send ?t get-segundo_plato_t))
        (tercer_plato_t (send ?t get-tercer_plato_t))
		(multiplicador-precio-min (send ?t get-multiplicador-precio-min))
		(multiplicador-precio-max (send ?t get-multiplicador-precio-max))
    )
	(unmake-instance ?t)
)

(defrule segundo-plato-celiaco
"Esta regla adapta el segundo plato del menú si el cliente tiene celiaquía."
    (declare (salience 200))
	(problema-abstracto (restricciones-activas $?restricciones))
	?t <- (object 
        (is-a Template_Escogido)
        (segundo_plato_t [Cat_Pasta]))
	=>
	(make-instance (gensym) of Template_Escogido
        (nombre (send ?t get-nombre))
        (primer_plato_t (send ?t get-primer_plato_t))
        (segundo_plato_t [Cat_Pasta_Sin_Glutten])
        (tercer_plato_t (send ?t get-tercer_plato_t))
		(multiplicador-precio-min (send ?t get-multiplicador-precio-min))
		(multiplicador-precio-max (send ?t get-multiplicador-precio-max))
    )
	(unmake-instance ?t)
)

(defrule tercer-plato-celiaco
"Esta regla adapta el tercer plato del menú si el cliente tiene celiaquía."
    (declare (salience 200))
	(problema-abstracto (restricciones-activas $?restricciones))
	?t <- (object 
        (is-a Template_Escogido)
        (tercer_plato_t [Cat_Pasta]))
	=>
	(make-instance (gensym) of Template_Escogido
        (nombre (send ?t get-nombre))
        (primer_plato_t (send ?t get-primer_plato_t))
        (segundo_plato_t (send ?t get-segundo_plato_t))
        (tercer_plato_t [Cat_Pasta_Sin_Glutten])
		(multiplicador-precio-min (send ?t get-multiplicador-precio-min))
		(multiplicador-precio-max (send ?t get-multiplicador-precio-max))
    )
	(unmake-instance ?t)
)

(defrule forzar-pastel
"Esta regla fuerza el tercer plato a ser un pastel si el evento es una boda o un cumpleaños infantil."
    (declare (salience 200))
	(or (problema-abstracto (nombre-evento "Boda")) 
    (problema-abstracto (nombre-evento "Cumpleaños Infantil")))
	?t <- (object 
        (is-a Template_Escogido))
	(test (not (eq (send ?t get-tercer_plato_t) [Cat_Pastel])))
	=>
	(make-instance (gensym) of Template_Escogido
        (nombre (send ?t get-nombre))
        (primer_plato_t (send ?t get-primer_plato_t))
        (segundo_plato_t (send ?t get-segundo_plato_t))
        (tercer_plato_t [Cat_Pastel])
		(multiplicador-precio-min (send ?t get-multiplicador-precio-min))
		(multiplicador-precio-max (send ?t get-multiplicador-precio-max))
    )
	(unmake-instance ?t)
)

(defrule eliminar-alcohol
"Esta regla elimina los platos que contienen alcohol si el evento es un cumpleaños infantil o si la restricción No-Alcoholico está activa."
    (declare (salience 200))
	(or
		(and (problema-abstracto (restricciones-activas $?restricciones))
		(test (member$ [No-Alcoholico] ?restricciones)))
		
		(problema-abstracto (nombre-evento "Cumpleaños Infantil"))
	)
    ?plato <- (object 
        (is-a Plato))
	(test (member$ [Alcohol] (send ?plato get-tiene)))
	=>
	(unmake-instance ?plato)
)

