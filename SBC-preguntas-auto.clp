(defrule preguntas-auto
    ""(declare (salience 300)) =>
	
	(assert (estilo-de-cocina "Mediterraneo"))
    (assert (instancia-estilo [Mediterraneo]))
	(assert (comensales 1))
	(assert (tipo-de-evento "Ninguno"))
	(assert (menu-con-bebida TRUE))
	(assert (precio-minimo-menu 1))
	(assert (precio-maximo-menu 200000))
	(assert (lista-restricciones-activas (restricciones (create$ [Restriccion-Celiaquia]))))
	
	(undefrule determinar-estilo-de-cocina)
	(undefrule determinar-tipo-de-evento)
	(undefrule determinar-comensales)
	(undefrule determinar-bebida)
	(undefrule determinar-precio-minimo-menu)
	(undefrule determinar-precio-maximo-menu)
	(undefrule determinar-restricciones-activas)
)
