Class {
	#name : #WAQueryMainMenuView,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAQueryMainMenuView >> openQueryReportView [

	self call: WAQuerySelectorView new
]

{ #category : #'as yet unclassified' }
WAQueryMainMenuView >> renderContentOn: html [
	"Render the receiver instances contents."
	
	html div class: 'item'; with: [
		html anchor 
			callback: [self openQueryReportView];
			with: [html image resourceUrl: 'online.png'].		
		html heading level2 with: [html paragraph: 'Consultas generales del sistema'].
		html heading level5 with: [html paragraph: 'Desde aquí podrá consultar datos relacionados a la facturación, configuración y emisión de reportes.']].
]

{ #category : #'as yet unclassified' }
WAQueryMainMenuView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet resourceUrl: 'actualizacionSituaciones.css'
]
