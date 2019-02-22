Class {
	#name : #WAActualizarSituacionesView,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #rendering }
WAActualizarSituacionesView >> abrirImportarInformesView [

	self call: WAImportarSituacionesComercialesView new
]

{ #category : #rendering }
WAActualizarSituacionesView >> abrirIngresarInformesView [

	self call: TBSInputFinancialSituationView new
]

{ #category : #'as yet unclassified' }
WAActualizarSituacionesView >> renderContentOn: html [
	"Render the receiver instances contents."
	
	html div class: 'item'; with: [
		html anchor 
			callback: [self abrirImportarInformesView];
			with: [html image resourceUrl: 'importarInformes.png'].		
		html heading level2 with: [html paragraph: 'Importar situaciones comerciales desde archivos (csv)'].
		html heading level5 with: [html paragraph: 'Deberá ingresar un archivo separado por coma con todos los campos requeridos para importar la situación comercial de cada uno de sus clientes automaticamente.']].
		html heading level5 with: [html anchor callback: [self mostrarFormatoArchivoCSV]; with: ['Ver formato requerido']].
	html div class: 'item'; with: [
		html anchor 
			callback: [self abrirIngresarInformesView];
			with: [html image resourceUrl: 'ingresarInforme.png'].	
		html heading level2 with: [html paragraph:  'Ingresar cada situación comercial manualmente'].
		html heading level5 with: [html paragraph: 'Si usted no posee un sistema con la información de sus deudores use esta opción del sistema para ingresar las situaciones de sus clientes manualmente.']].
]

{ #category : #'as yet unclassified' }
WAActualizarSituacionesView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
    anHtmlRoot stylesheet resourceUrl: 'actualizacionSituaciones.css'
]
