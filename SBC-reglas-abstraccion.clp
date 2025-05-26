
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
                  else (assert (clasificacion-grupo (categoria mass-catering)))
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
(deftemplate clasificacion-rango-precio
    (multislot categorias)
    (slot minimo)
    (slot maximo))

(defrule clasificar-rango-precio
    (problema-concreto (presupuesto-minimo ?min) (presupuesto-maximo ?max))
    =>
    (bind $?categorias (create$))
    
    (if (or (<= ?max 20)
            (and (>= ?min 0) (< ?min 20)))
        then
        (bind $?categorias (create$ $?categorias "economico")))
    
    (if (or (and (> ?max 20) (<= ?max 35))
            (and (> ?min 20) (<= ?min 35))
            (and (<= ?min 20) (> ?max 35)))
        then
        (bind $?categorias (create$ $?categorias "normal")))
    
    (if (> ?max 35) then
        (bind $?categorias (create$ $?categorias "caro")))
    
    
    (assert (clasificacion-rango-precio
        (categorias $?categorias)
        (minimo ?min)
        (maximo ?max)
    ))
)


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

;; Tipo Evento 
(deftemplate clasificacion-evento
    (slot tipo)
    (slot nombre-evento))

(defrule clasificar-evento
    (problema-concreto (evento ?e))
    =>
    (if (eq ?e "boda") then
        (assert (clasificacion-evento
            (tipo "formal")
            (nombre-evento ?e)
        ))
    else if (eq ?e "cumpleaños") then
        (assert (clasificacion-evento
            (tipo "informal")
            (nombre-evento ?e)
        ))
    )
)

;;Unificationss

(deftemplate problema-abstracto
    (slot clasificacion-grupo) 
    (slot estilo-activo)
    (multislot restricciones-activas)
    (multislot categorias-precio)
    (slot incluir-bebida)
    (slot tipo-evento)
    (slot nombre-evento)
)

(defrule crear-problema-abstracto
   ?cg <- (clasificacion-grupo (categoria ?grupo))
   ?ea <- (estilo-activo (nombre-estilo ?estilo))
   ?cr <- (clasificacion-restricciones (nombres-restricciones $?restricciones))
   ?cp <- (clasificacion-rango-precio (categorias $?categorias-precio))
   ?b <- (problema-concreto (incluir-bebida ?bebida))
   ?ce <- (clasificacion-evento (tipo ?tipo-evento) (nombre-evento ?nombre-evento))
   =>
   (assert (problema-abstracto
      (clasificacion-grupo ?grupo)
      (estilo-activo ?estilo)
      (restricciones-activas ?restricciones)
      (categorias-precio $?categorias-precio)
      (incluir-bebida ?bebida)
      (tipo-evento ?tipo-evento)
      (nombre-evento ?nombre-evento)
   ))
   (retract ?cg ?ea ?cr ?cp ?ce)
)

