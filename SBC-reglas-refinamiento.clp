
;;██████╗░███████╗░██████╗░██╗░░░░░░█████╗░░██████╗  ██████╗░███████╗
;;██╔══██╗██╔════╝██╔════╝░██║░░░░░██╔══██╗██╔════╝  ██╔══██╗██╔════╝
;;██████╔╝█████╗░░██║░░██╗░██║░░░░░███████║╚█████╗░  ██║░░██║█████╗░░
;;██╔══██╗██╔══╝░░██║░░╚██╗██║░░░░░██╔══██║░╚═══██╗  ██║░░██║██╔══╝░░
;;██║░░██║███████╗╚██████╔╝███████╗██║░░██║██████╔╝  ██████╔╝███████╗
;;╚═╝░░╚═╝╚══════╝░╚═════╝░╚══════╝╚═╝░░╚═╝╚═════╝░  ╚═════╝░╚══════╝
;;
;;██████╗░███████╗███████╗██╗███╗░░██╗░█████╗░███╗░░░███╗██╗███████╗███╗░░██╗████████╗░█████╗░
;;██╔══██╗██╔════╝██╔════╝██║████╗░██║██╔══██╗████╗░████║██║██╔════╝████╗░██║╚══██╔══╝██╔══██╗
;;██████╔╝█████╗░░█████╗░░██║██╔██╗██║███████║██╔████╔██║██║█████╗░░██╔██╗██║░░░██║░░░██║░░██║
;;██╔══██╗██╔══╝░░██╔══╝░░██║██║╚████║██╔══██║██║╚██╔╝██║██║██╔══╝░░██║╚████║░░░██║░░░██║░░██║
;;██║░░██║███████╗██║░░░░░██║██║░╚███║██║░░██║██║░╚═╝░██║██║███████╗██║░╚███║░░░██║░░░╚█████╔╝
;;╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░░╚════╝░

;; En este archivo se definen las reglas para refinar la solución utilizando datos del problema concreto.
(defrule find-plato-de-estilo-sin-bebida
"Esta regla encuentra un plato de un estilo concreto sin incluir bebida. En el rango de precios indicado."
    (problema-concreto (estilo ?nombre-estilo) (instance-estilo ?estilo) (comensales ?s) (incluir-bebida ?b) (presupuesto-minimo ?min) (presupuesto-maximo ?max))
	(test (not (eq ?b TRUE)))
	?t <- (object (is-a Template_Escogido))
    ?primero <- (object (is-a Primero))
	(test (member$ (send ?t get-primer_plato_t) (send ?primero get-es_de_categoria)))
	(test (member$ ?estilo (send ?primero get-es_de_estilo)))
    ?segundo <- (object (is-a Segundo))
	(test (member$ (send ?t get-segundo_plato_t) (send ?segundo get-es_de_categoria)))
	(test (member$ ?estilo (send ?segundo get-es_de_estilo)))
    ?postre <- (object (is-a Postre))
	(test (member$ (send ?t get-tercer_plato_t) (send ?postre get-es_de_categoria)))
	(test (member$ ?estilo (send ?postre get-es_de_estilo)))
	(test (> (+ (+ (send ?primero get-precio) (send ?segundo get-precio)) (send ?postre get-precio)) ?min))
	(test (< (+ (+ (send ?primero get-precio) (send ?segundo get-precio)) (send ?postre get-precio)) (* ?max (send ?t get-multiplicador-precio-max))))
    =>
    (bind ?precio (+ (+ 
        (send ?primero get-precio) 
        (send ?segundo get-precio))
        (send ?postre get-precio)))
	
    (printout t "Le recomendamos " (send ?primero get-nombre) ", " 
    (send ?segundo get-nombre) " y " (send ?postre get-nombre) 
     " para el estilo " ?nombre-estilo ". Por " 
     (* ?precio ?s)
     " euros. A " ?precio " por persona." crlf)
	(unmake-instance ?t)
)

(defrule find-plato-de-estilo-con-bebida
"Esta regla encuentra un plato de un estilo concreto incluyendo bebida. En el rango de precios indicado."
    (problema-concreto (estilo ?nombre-estilo) (instance-estilo ?estilo) (comensales ?s) (incluir-bebida ?b) (presupuesto-minimo ?min) (presupuesto-maximo ?max))
	(test (eq ?b TRUE))
	?t <- (object (is-a Template_Escogido))
    ?primero <- (object (is-a Primero))
	(test (member$ (send ?t get-primer_plato_t) (send ?primero get-es_de_categoria)))
	(test (member$ ?estilo (send ?primero get-es_de_estilo)))
    ?segundo <- (object (is-a Segundo))
	(test (member$ (send ?t get-segundo_plato_t) (send ?segundo get-es_de_categoria)))
	(test (member$ ?estilo (send ?segundo get-es_de_estilo)))
    ?postre <- (object (is-a Postre))
	(test (member$ (send ?t get-tercer_plato_t) (send ?postre get-es_de_categoria)))
	(test (member$ ?estilo (send ?postre get-es_de_estilo)))
    ?bebida <- (object (is-a Bebida))
	(test (member$ ?estilo (send ?bebida get-es_de_estilo)))
	(test (> (+ (+ (+ (send ?primero get-precio) (send ?segundo get-precio)) (send ?postre get-precio)) (send ?bebida get-precio)) ?min))
	(test (< (+ (+ (+ (send ?primero get-precio) (send ?segundo get-precio)) (send ?postre get-precio)) (send ?bebida get-precio)) (* ?max (send ?t get-multiplicador-precio-max))))
    =>
    (bind ?precio (+ (+ (+ (send ?primero get-precio) (send ?segundo get-precio)) (send ?postre get-precio)) (send ?bebida get-precio)))
	
    (printout t "Le recomendamos " (send ?primero get-nombre) ", " 
    (send ?segundo get-nombre) ", " (send ?postre get-nombre) " y " (send ?bebida get-nombre)
     " para el estilo " ?nombre-estilo ". Por " 
     (* ?precio ?s)
     " euros. A " ?precio " por persona." crlf)
	(unmake-instance ?t)
)
