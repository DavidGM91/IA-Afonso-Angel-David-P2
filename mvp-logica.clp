(deffunction ask-question-with-values (?question $?allowed-values)
   (print ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member$ ?answer ?allowed-values)) do
      (print ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)
(deffunction ask-question (?question)
   (print ?question)
   (bind ?answer (read))
   ?answer)
(defrule determinar-estilo-de-cocina
	""(declare (salience 100)) =>
 	(assert (estilo-de-cocina 
		(ask-question-with-values "¿Qué estilo de cocina quieres?(Pasta/Sushi)" pasta sushi)
    )
))
(defrule determinar-comensales
	""(declare (salience 95)) => 
	(assert (comensales 
		(ask-question "¿Para cuantos comensales?")
    ))
)
