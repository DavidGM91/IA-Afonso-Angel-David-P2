(defrule preguntas-auto
    ""(declare (salience 300)) =>
	
	(assert (estilo-de-cocina italiano))
	(assert (comensales 6))
	(assert (tipo-de-evento boda))
	(assert (menu-con-bebida TRUE))
	(assert (precio-minimo-menu 12))
	(assert (precio-maximo-menu 22))
	(assert (lista-restricciones-activas (restricciones (create$ [Restriccion-Celiaquia]))))
	
	(undefrule determinar-estilo-de-cocina)
	(undefrule determinar-tipo-de-evento)
	(undefrule determinar-comensales)
	(undefrule determinar-bebida)
	(undefrule determinar-precio-minimo-menu)
	(undefrule determinar-precio-maximo-menu)
	(undefrule determinar-restricciones-activas)
)
