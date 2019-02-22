Class {
	#name : #WAEntitySelectorView,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'selectedEntities',
		'transactionClass',
		'objectQueryStrategy',
		'objectQueryStrategyComponent'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAEntitySelectorView class >> transactionClass: aTransactionClass [

	^self new
		transactionClass: aTransactionClass
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> defaultEntity [

	^self entities first
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> entities [
	"Devuelve las entidades de la clase del receptor en la session del usaurio."
	
	^self session user commerces asSortedCollection  
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> entityClass [

	^self transactionClass entityClass
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> initializeObjectQueryStrategy [

	objectQueryStrategy := self transactionClass defaultObjectQueryStrategy
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> isMultipleSelect [

	^self transactionClass notNil and: [self transactionClass allowMultipleEntitiesForQuery]
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> objectQueryStrategy [

	objectQueryStrategy isNil ifTrue: [self initializeObjectQueryStrategy].
	^objectQueryStrategy
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> objectQueryStrategy: anObjectQueryStrategy [

	objectQueryStrategy:= anObjectQueryStrategy
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> objectQueryStrategyComponent [

	objectQueryStrategyComponent isNil ifTrue: [objectQueryStrategyComponent := self objectQueryStrategy asComponent].
	^objectQueryStrategyComponent
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> queryResultElements [

	self updateModel.
	^self objectQueryStrategy transactionsForEntities: self selectedEntities
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> renderContentOn: html [
	"Render the menu elements."
	
	html form: [
		html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Paso 2 de 2: Seleccione el rango de fechas a consultar'].
		html div id: 'contenidoWorkFlow'; with: [
			html div id: 'seleccionEntidad'; with: [self renderEntitySelectionOn: html].
			html div id: 'seleccionFechas'; with: [html render: (self objectQueryStrategyComponent)].
			].
		html div class:'acciones'; with: [html submitButton text: 'Siguiente'; 
			callback: [self call: (WAQueryReportView forRows: self queryResultElements)]]]
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> renderEntitySelectionOn: html [
	
	(self isMultipleSelect ifTrue: [html multiSelect] ifFalse: [html select])
		size: 15;
		list: self entities;
		selected: (Array with: self defaultEntity);
		callback: [:selected | self selectedEntities: selected]
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> selectedEntities [

	^selectedEntities
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> selectedEntities: aCollection [

	self isMultipleSelect
		ifTrue: [selectedEntities:= aCollection]
		ifFalse: [selectedEntities:= Array with: aCollection]
	
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> startDate: aDate [

	self objectQueryStrategy defaultDate: aDate
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> transactionClass [

	^transactionClass
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> transactionClass: aTransactionClass [

	transactionClass:= aTransactionClass
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> updateModel [

	^self objectQueryStrategyComponent save
]

{ #category : #'as yet unclassified' }
WAEntitySelectorView >> updateRoot: anHtmlRoot [

			super updateRoot: anHtmlRoot.  
    anHtmlRoot stylesheet resourceUrl: 'query.css'
]
