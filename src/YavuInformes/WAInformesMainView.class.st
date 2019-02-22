Class {
	#name : #WAInformesMainView,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAInformesMainView >> abrirInformesPorDocumentoView [

	self call: WAPremiumFinancialReportView new
]

{ #category : #'as yet unclassified' }
WAInformesMainView >> abrirInformesPorNombreView [

	self call: WABasicPlusFinancialReportView new
]

{ #category : #'as yet unclassified' }
WAInformesMainView >> renderContentOn: html [
	"Render the receiver instances contents."
	
	html div class: 'item'; with: [
		html anchor 
			callback: [self abrirInformesPorDocumentoView];
			with: [html image resourceUrl: 'InformeDNI.png'].		
		html heading level2 with: [html paragraph: 'Generar informe por número de documento'].
		html heading level5 with: [html paragraph: 'Para poder generar el informe comercial necesitará el número de DNI o CUIT de la persona o empresa buscada.']].
		html heading level5 with: [html anchor callback: [self mostrarFormatoArchivoCSV]; with: ['Ver formato requerido']].
	html div class: 'item'; with: [
		html anchor 
			callback: [self abrirInformesPorNombreView];
			with: [html image resourceUrl: 'InformeNombre.png'].	
		html heading level2 with: [html paragraph:  'Generar informe por nombre o denominación'].
		html heading level5 with: [html paragraph: 'Si usted solo conoce el nombre o denominación o parte del mismo podrá usar esta opción para generar el documento de la persona o empresa buscada.']].
]

{ #category : #'as yet unclassified' }
WAInformesMainView >> updateRoot: anHtmlRoot [

			super updateRoot: anHtmlRoot.  

    anHtmlRoot stylesheet resourceUrl: 'actualizacionSituaciones.css'
]
