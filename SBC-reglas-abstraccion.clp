
;;██████╗░███████╗░██████╗░██╗░░░░░░█████╗░░██████╗  ██████╗░███████╗
;;██╔══██╗██╔════╝██╔════╝░██║░░░░░██╔══██╗██╔════╝  ██╔══██╗██╔════╝
;;██████╔╝█████╗░░██║░░██╗░██║░░░░░███████║╚█████╗░  ██║░░██║█████╗░░
;;██╔══██╗██╔══╝░░██║░░╚██╗██║░░░░░██╔══██║░╚═══██╗  ██║░░██║██╔══╝░░
;;██║░░██║███████╗╚██████╔╝███████╗██║░░██║██████╔╝  ██████╔╝███████╗
;;╚═╝░░╚═╝╚══════╝░╚═════╝░╚══════╝╚═╝░░╚═╝╚═════╝░  ╚═════╝░╚══════╝
;;
;;░█████╗░██████╗░░██████╗████████╗██████╗░░█████╗░░█████╗░░█████╗░██╗░█████╗░███╗░░██╗
;;██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗████╗░██║
;;███████║██████╦╝╚█████╗░░░░██║░░░██████╔╝███████║██║░░╚═╝██║░░╚═╝██║██║░░██║██╔██╗██║
;;██╔══██║██╔══██╗░╚═══██╗░░░██║░░░██╔══██╗██╔══██║██║░░██╗██║░░██╗██║██║░░██║██║╚████║
;;██║░░██║██████╦╝██████╔╝░░░██║░░░██║░░██║██║░░██║╚█████╔╝╚█████╔╝██║╚█████╔╝██║░╚███║
;;╚═╝░░╚═╝╚═════╝░╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░╚════╝░╚═╝░░╚══╝

;; En este archivo se definen las reglas para abstraer el problema concreto al problema abstracto.

;; Tamaño del grupo
(deftemplate group-classification
   (slot category))
(defrule classify-group
   ?g <- (problema-concreto (comensales ?s))
   =>
   (if (< ?s 2)
      then (assert (group-classification (category "solo")))
      else 
      (if (< ?s 5)
         then (assert (group-classification (category "small")))
         else 
         (if (< ?s 11)
            then (assert (group-classification (category "medium")))
            else 
            (if (< ?s 26)
               then (assert (group-classification (category "large")))
               else 
               (if (< ?s 50)
                  then (assert (group-classification (category "very large")))
                  else (assert (group-classification (category "mass catering")))
               )
            )
         )
      )
   )
)
;; Estilo de cocina
(defrule classify-style-pasta
   (problema-concreto (estilo pasta))
   =>
   (assert (active-category [Pasta]))
)
(defrule classify-style-sushi
   (problema-concreto (estilo sushi))
   =>
   (assert (active-category [Sushi]))
)