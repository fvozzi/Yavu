Class {
	#name : #WAAyudaIngresarSituacionesComerciales,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAAyudaIngresarSituacionesComerciales >> renderContentOn: html [

	html div class: 'titulo'; with: [html
		text: 'Ingresa situaciones comerciales'].
	html div class: 'detalle'; with: [
		html paragraph: 'De aquí se podrá ingresar las situaciones comerciales actualizadas de cada cliente con deuda del comercio.'].
		html div class: 'titulo'; with: [html text: 'El proceso'].
	html div class: 'detalle'; with: [
		html paragraph: 'Cada comercio deberá proveer al sistema las situaciones comerciales actualizadas de cada cliente con deuda. Para ingresarlo al sistema deberá contar con el DNI, si es una persona, o el CUIT si es una organización, la fecha de pago y la deuda actual. Es importante informar la deuda CERO cuando el cliente termine de abonar su deuda para poder informar su deuda correctamente.'].
		html div class: 'titulo'; with: [html text: 'Los campos a completar'].
		html div class: 'detalle'; with: [
			html paragraph: 'La siguiente imagen indica los campos que debe completar el usuario y debajo se encuentra la explicación de cada uno de los mismos..'].
		html div class: 'imagen'; with: [html image resourceUrl: 'ayudaIngresoDeSituacionComerciales.png'].
		html div class: 'detalle'; with: [
			html strong: 'A - '.
			html text: 'Se debe seleccionar el Comercio para el cual vamos a ingresar los informes de situación comercial.'; break.
			html strong: 'B - '.
			html text: 'Debe ingresar el DNI si el informe es para una persona o el CUIT si es para una organización.'; break.
			html strong: 'C - '.
			html text: 'Deberá seleccionar el sexo para una persona o Organización en caso contrario.'; break.
			html strong: 'D - '.
			html text: 'Una vez que se ingresó el documento se debe cliquear en buscar, sí el cliente no es nuevo se completará el campo NOMBRE y sino se deberá ingresar el mismo para poder darlo de alta en el sistema.'; break.
			html strong: 'E - '.
			html text: 'Sí se encontró el cliente se verá el nombre y sino habrá que ingresar el nombre completo por UNICA vez.'; break.
			html strong: 'F - '.
			html text: 'Se debe ingresar la fecha de última actualización de la deuda.'; break.
			html strong: 'G - '.
			html text: 'Se ingresar el monto correspondiente a la deuda actual.'; break.
			html strong: 'H - '.
			html text: 'Se debe seleccionar el tipo de operación por el que el cliente contrajo la deuda.'; break.
			html strong: 'I - '.
			html text: 'Se debe seleccionar en calidad de que el cliente contrajo la deuda.'; break.
			html strong: 'J - '.
			html text: 'Se debe cliquear aquí para agregar la situación comercial al la lista de las situaciones que vamos a agregar al sistema.'; break.		
			html strong: 'K - '.
			html text: 'Se visualiza la lista preliminar de situaciones, si queremos quitar alguna debemos presionar quitar.'; break.																														
			html strong: 'Por último y para confirmar la operación se debe cliquear en Guardar Informes.'.
			].			
		html div class: 'titulo'; with: [html text: 'Observación'].
		html div class: 'detalle'; with: [
			html 
				paragraph: 'Recuerde que hasta no cliquear en Guardar Informes no se ingresarán al sistema las situaciones agregadas.']
]

{ #category : #'as yet unclassified' }
WAAyudaIngresarSituacionesComerciales >> updateRoot: anHtmlRoot [

			super updateRoot: anHtmlRoot.  
    anHtmlRoot stylesheet resourceUrl: 'ayuda.css'
]
