Class {
	#name : #WAAyudaConsultas,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAAyudaConsultas >> renderContentOn: html [

	html div class: 'titulo'; with: [html
		text: 'Consulta de transacciones'].
	html div class: 'detalle'; with: [
		html paragraph: 'Desde este módulo podrá consultar cualquier objeto del sistema.'].
		html div class: 'titulo'; with: [html text: 'El proceso'].
	html div class: 'detalle'; with: [
		html paragraph: 'Mediante dos simples pasos podrá consultar cualquier objeto del sistema. En el primer paso deberá seleccionar la transacción que desea consultar y en el segundo elegir la entidad y la fecha. Luego del segundo paso solo resta observar los resultados.'].
		html div class: 'titulo'; with: [html text: 'Los dos pasos explicados'].
		html div class: 'detalle'; with: [
			html paragraph: 'Las siguientes dos imagenes nos muestran como completar los pasos para emitir la consulta.'].
		html div class: 'imagen'; with: [html image resourceUrl: 'ayudaConsultaPaso1.png'].
		html div class: 'imagen'; with: [html image resourceUrl: 'ayudaConsultaPaso2.png'].
		html div class: 'imagen'; with: [html image resourceUrl: 'ayudaConsultaPaso3.png']				
]

{ #category : #'as yet unclassified' }
WAAyudaConsultas >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
    anHtmlRoot stylesheet resourceUrl: 'ayuda.css'
]
