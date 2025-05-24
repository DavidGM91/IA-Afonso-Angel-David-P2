
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
(deftemplate clasificacion-grupo
   (slot categoria))

(defrule clasificar-grupo
   ?g <- (problema-concreto (comensales ?s))
   =>
   (if (< ?s 2)
      then (assert (clasificacion-grupo (categoria solo)))
      else 
      (if (< ?s 5)
         then (assert (clasificacion-grupo (categoria pequeño)))
         else 
         (if (< ?s 11)
            then (assert (clasificacion-grupo (categoria mediano)))
            else 
            (if (< ?s 26)
               then (assert (clasificacion-grupo (categoria grande)))
               else 
               (if (< ?s 50)
                  then (assert (clasificacion-grupo (categoria enorme)))
                  else (assert (clasificacion-grupo (categoria astronomico)))
               )
            )
         )
      )
   )
)


;; Estilo de cocina

(deftemplate estilo-activo
  (slot nombre-estilo))

(defrule clasificar-estilo
  (problema-concreto (estilo ?e))
  =>
  (assert (estilo-activo (nombre-estilo ?e))))


;; Rango Precio Menu
; (deftemplate clasificacion-precio-menu
;    (slot categoria))
; (defrule clasificar-precio-menu
;    ?g <- (problema-concreto (rango-precio-menu ?s))
;    =>
;    (if (< ?s 15)
;       then (assert (clasificacion-precio-menu (category barato)))
;       else 
;       (if (< ?s 30)
;          then (assert (clasificacion-precio-menu (category intermedio)))
;          else (assert (clasificacion-precio-menu (category caro)))
;       )
;    )
; )


;; Restricciones Activas
(deftemplate clasificacion-restricciones
  (multislot nombres-restricciones))

(defrule clasificar-restricciones
  ?lr <- (problema-concreto (restricciones $?restricciones))
  =>
  (bind $?nombres (create$))
  (foreach ?r ?restricciones
    (bind $?nombres (create$ $?nombres (send ?r get-nombre)))
  )
  (assert (clasificacion-restricciones (nombres-restricciones ?nombres)))
)



;;Unificationss

(deftemplate problema-abstracto
    (slot clasificacion-grupo) 
    (slot estilo-activo)
    (multislot restricciones-activas)
    ;(slot clasificacion-precio-menu)
)

(defrule crear-problema-abstracto
   ?cg <- (clasificacion-grupo (categoria ?grupo))
   ?ea <- (estilo-activo (nombre-estilo ?estilo))
   ?cr <- (clasificacion-restricciones (nombres-restricciones $?restricciones))
   ; ?cpm <- (clasificacion-precio-menu (categoria ?precio))
   =>
   (assert (problema-abstracto
      (clasificacion-grupo ?grupo)
      (estilo-activo ?estilo)
      (restricciones-activas ?restricciones)
      ;(clasificacion-precio-menu ?precio)
   ))
   (retract ?cg ?ea ?cr );?cpm
)



