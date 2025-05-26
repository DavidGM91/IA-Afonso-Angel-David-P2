
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
)

(defrule escoger-templates-menu-mediterraneo
    (not (template-menu))
	?pa <- (problema-abstracto (estilo-activo "Mediterraneo"))
    =>
    (bind ?t1 [Pasta_y_pescado])
	(make-instance (gensym) of Template_Escogido
        (nombre (send ?t1 get-nombre))
        (primer_plato_t (send ?t1 get-primer_plato_t))
        (segundo_plato_t (send ?t1 get-segundo_plato_t))
        (tercer_plato_t (send ?t1 get-tercer_plato_t))
    )
    (bind ?t2 [Menu_Espanol])
	(make-instance (gensym) of Template_Escogido
        (nombre (send ?t2 get-nombre))
        (primer_plato_t (send ?t2 get-primer_plato_t))
        (segundo_plato_t (send ?t2 get-segundo_plato_t))
        (tercer_plato_t (send ?t2 get-tercer_plato_t))
    )
	;(bind ?t3 [Template-...])
	;(make-instance (gensym) of Template_Escogido
    ;    (nombre (send ?t3 get-nombre))
    ;    (primer_plato_t (send ?t3 get-primer_plato_t))
    ;    (segundo_plato_t (send ?t3 get-segundo_plato_t))
    ;    (tercer_plato_t (send ?t3 get-tercer_plato_t))
    ;)
)

(deftemplate complejidad-maxima
   (slot maximo))

(defrule determinar-complejidad-maxima
	(not (complejidad-maxima))
	(problema-abstracto (clasificacion-grupo ?grupo))
	=>
	(if (eq ?grupo mediano) then (assert (complejidad-maxima (maximo 4))))
	(if (eq ?grupo grande) then (assert (complejidad-maxima (maximo 3))))
	(if (eq ?grupo enorme) then (assert (complejidad-maxima (maximo 2))))
	(if (eq ?grupo mass-catering) then (assert (complejidad-maxima (maximo 2))))
)

(defrule eliminar-platos-complejos
	(complejidad-maxima (maximo ?cm))
	?plato <- (object 
        (is-a Plato)
        (complejidad ?c))
	=>
	(if (> ?c ?cm) then (unmake-instance ?plato))
)

(defrule primer-plato-celiaco
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
    )
	(unmake-instance ?t)
)

(defrule segundo-plato-celiaco
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
    )
	(unmake-instance ?t)
)

(defrule tercer-plato-celiaco
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
    )
	(unmake-instance ?t)
)

(defrule forzar-pastel
    (declare (salience 200))
	(or (problema-abstracto (nombre-evento "Boda")) (problema-abstracto (nombre-evento "Cumpleaños Infantil")))
	?t <- (object 
        (is-a Template_Escogido))
	(test (not (eq (send ?t get-tercer_plato_t) [Cat_Pastel])))
	=>
	(make-instance (gensym) of Template_Escogido
        (nombre (send ?t get-nombre))
        (primer_plato_t (send ?t get-primer_plato_t))
        (segundo_plato_t (send ?t get-segundo_plato_t))
        (tercer_plato_t [Cat_Pastel])
    )
	(unmake-instance ?t)
)
