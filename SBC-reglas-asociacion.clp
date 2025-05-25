
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

(defrule escoger-templates-menu-italiano
    (not (template-menu))
	?pa <- (problema-abstracto (estilo-activo italiano))
    =>
    (bind ?t1 [Template-Italiano])
	(make-instance template1 of Template_Escogido
        (nombre (send ?t1 get-nombre))
        (primer_plato_t (send ?t1 get-primer_plato_t))
        (segundo_plato_t (send ?t1 get-segundo_plato_t))
        (tercer_plato_t (send ?t1 get-tercer_plato_t))
    )
    (bind ?t2 [Template-Mediterraneo])
	(make-instance template2 of Template_Escogido
        (nombre (send ?t2 get-nombre))
        (primer_plato_t (send ?t2 get-primer_plato_t))
        (segundo_plato_t (send ?t2 get-segundo_plato_t))
        (tercer_plato_t (send ?t2 get-tercer_plato_t))
    )
	;(bind ?t3 [Template-...])
	;(make-instance template3 of Template_Escogido
    ;    (nombre (send ?t3 get-nombre))
    ;    (primer_plato_t (send ?t3 get-primer_plato_t))
    ;    (segundo_plato_t (send ?t3 get-segundo_plato_t))
    ;    (tercer_plato_t (send ?t3 get-tercer_plato_t))
    ;)
)
