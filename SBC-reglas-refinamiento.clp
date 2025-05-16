
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
(defrule find-plato-de-estilo
    (active-category ?style)
    ?primero <- (object 
        (is-a Primero)
        (es_de_estilo ?style))
    ?segundo <- (object 
        (is-a Segundo)
        (es_de_estilo ?style))
    ?postre <- (object 
        (is-a Postre)
        (es_de_estilo ?style))
    ?g <- (problema-concreto (comensales ?s))
    =>
    (bind ?precio (+ (+ 
        (send ?primero get-precio) 
        (send ?segundo get-precio))
        (send ?postre get-precio)))

    (printout t "Te recomendamos " (send ?primero get-nombre) ", " 
    (send ?segundo get-nombre) " y " (send ?postre get-nombre) 
     " para el estilo " (send ?style get-nombre) ". Por " 
     (* ?precio ?s)
     " euros. A " ?precio " por persona." crlf)
)