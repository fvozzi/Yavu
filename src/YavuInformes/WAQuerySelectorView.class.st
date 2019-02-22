Class {
	#name : #WAQuerySelectorView,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'transactionSelected'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAQuerySelectorView class >> claseDeAyuda [
	"Devuelve la clase que modela y define la ayuda del repcetor."
	
	^WAAyudaConsultas
]

{ #category : #'as yet unclassified' }
WAQuerySelectorView >> renderContentOn: html [

	html form: [
	self renderMenuAyudaOn: html.  
	html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Paso 1 de 2: Seleccione la transacción a consultar'].
	html div id: 'contenidoWorkFlow'; with: [
	html div class: 'label'; with: [html text: 'Transacción:'].
	html select
		 list: (Array with: ReportEmission with: Invoice with: MonthlyPayment with: FinancialSituationsReport with: FinancialSituation with: nil);
            selected: self transactionSelected;
		labels: [:value | value label];
            callback: [ :value | self transactionSelected: value ]].
	html div class: 'acciones'; with: [
	html submitButton text: 'Siguiente'; callback: [
		self siguienteOn: html]]]
]

{ #category : #'as yet unclassified' }
WAQuerySelectorView >> siguienteOn: html [

	self transactionSelected isNil
		ifTrue: [self inform: 'Se debe seleccionar una transacción para continuar.']
		ifFalse: [self call: (WAEntitySelectorView transactionClass: self transactionSelected)]
]

{ #category : #'as yet unclassified' }
WAQuerySelectorView >> transactionSelected [

	^transactionSelected
]

{ #category : #'as yet unclassified' }
WAQuerySelectorView >> transactionSelected: aTransaction [

	transactionSelected:= aTransaction
]

{ #category : #'as yet unclassified' }
WAQuerySelectorView >> updateRoot: anHtmlRoot [

			super updateRoot: anHtmlRoot.  

    anHtmlRoot stylesheet resourceUrl: 'query.css'
]
