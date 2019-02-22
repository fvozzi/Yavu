Class {
	#name : #WAAyudaABMEntidades,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAAyudaABMEntidades >> renderContentOn: html [

	html div class: 'titulo'; with: [html
		text: 'ABM de entidades del sistema'].
	html div class: 'detalle'; with: [
		html paragraph: 'De aquí se podrá ingresar cada una de las entidades que forman parte del flujo de trabajo del sistema..'].
		html div class: 'titulo'; with: [html text: 'El proceso'].
	html div class: 'detalle'; with: [
		html paragraph: 'Una entidad es un objeto que mantiene su identidad a lo largo de toda la vida del sistema y a la que se pueden asociar transacciones o configuraciones..'].
		html div class: 'titulo'; with: [html text: 'El uso'].
		html div class: 'detalle'; with: [
			html paragraph: 'La siguiente imagen nos muestra la simple interfaz para manejar todas las entidades del sistema.'].
		html div class: 'imagen'; with: [html image resourceUrl: 'ayudaABMEntidades.png'].
		html div class: 'detalle'; with: [
			html strong: 'A - '.
			html text: 'Cada uno de los botones modelan una entidad diferente. Para administrar, hacer un alta, baja o una modificación, se debe hacer un click en el nombre de la entidad deseada.'; break.
			html strong: 'B - '.
			html text: 'Cliqueando aquí se accederá al editor de la entidad previamente seleccionada.'; break.
			html strong: 'C - '.
			html text: 'Aquí verá la lista de entidades, de la clase seleccionada, y podrá visualizarla (ver), modificarla (modificar) o eliminarla (eliminar).'; break.
			].			
		html div class: 'titulo'; with: [html text: 'Observación'].
		html div class: 'detalle'; with: [
			html 
				paragraph: 'Dentro del editor de cada entidad habrá diferentes opción según los campos requeridos para la misma.']
]

{ #category : #'as yet unclassified' }
WAAyudaABMEntidades >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
    anHtmlRoot stylesheet resourceUrl: 'ayuda.css'
]
