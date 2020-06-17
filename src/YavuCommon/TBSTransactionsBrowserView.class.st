Class {
	#name : #TBSTransactionsBrowserView,
	#superclass : #TBSYavuObjectBrowserView,
	#instVars : [
		'entity',
		'startDateLiteral',
		'endDateLiteral',
		'queryAllEntities'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> browserCaption [

	^ super browserCaption, ' | Transacciones'
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> defaultEntity [ 
	
	self possibleEntities first
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> endDate [
	
	^ self endDateLiteral asDate
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> endDateLiteral [

	^ endDateLiteral
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> endDateLiteral: yyyymmddString [

	endDateLiteral := yyyymmddString
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> entity [
	^ entity
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> entity: aYavuSupplier [ 
	
	entity := aYavuSupplier 
]

{ #category : #initialization }
TBSTransactionsBrowserView >> initialize [ 

	super initialize.
	startDateLiteral := Date today beginOfMonth yyyymmdd.
	endDateLiteral := Date today endOfMonth yyyymmdd.
	queryAllEntities := false.
]

{ #category : #subclassResponsability }
TBSTransactionsBrowserView >> instances [

	^ queryAllEntities 
		ifTrue: [ objectClass instancesFrom: self startDate to: self endDate ]
		ifFalse: [ objectClass instancesFrom: self startDate to: self endDate entity: self entity ]
]

{ #category : #initialization }
TBSTransactionsBrowserView >> onYavuSubsystemChanged [ 

	super onYavuSubsystemChanged.
	entity := self defaultEntity
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> possibleEntities [

	^ self objectClass entityClass all
]

{ #category : #subclassResponsability }
TBSTransactionsBrowserView >> possibleInstancesClasses [

	^ (self session yavuSystem allowedTransactionsClassesOn: self subsystemClass)
]

{ #category : #subclassResponsability }
TBSTransactionsBrowserView >> renderObjectClassSelection: html [

	html tbsColumn: [ 
		html tbsRow: 'Transacción:'.
		html tbsRow: [html select
						list: self possibleInstancesClasses;
						selected: self objectClass ;
						callback: [ :oneObjectClass | self objectClass: oneObjectClass ];
						labels: [ :each | each label]
						] ] mediumSize: 3.
	html tbsColumn: [ 
		html tbsRow: 'Entidad:'.
		html tbsRow: [ 
			html select
			list: self possibleEntities;
			selected: self entity ;
			onChange: 'submit()';
			callback: [ :oneEntity | self entity: oneEntity ]] ] mediumSize: 2.
	html tbsColumn: [ 
		html tbsRow: 'Todas:'.
		html tbsRow: [ 
			html label: [
				html checkbox
					value: queryAllEntities ;
					callback: [ :value | queryAllEntities := value ].
			 ]]] mediumSize: 1.
	
	html tbsColumn: [ 
		html tbsRow: 'Desde:'.
		html tbsRow: [ html dateInput5
						on: #startDateLiteral of: self] ] mediumSize: 2.
	html tbsColumn: [ 
		html tbsRow: 'Hasta:'.
		html tbsRow: [ html dateInput5
						on: #endDateLiteral of: self] ] mediumSize: 2.
	html tbsColumn: [ 
			html tbsRow: [ html tbsSubmitButton 
				bePrimary;
				callback: [ self search];
				with: 'Buscar' ] ] mediumSize: 2
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> startDate [
	
	^ self startDateLiteral asDate
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> startDateLiteral [

	^ startDateLiteral
]

{ #category : #'as yet unclassified' }
TBSTransactionsBrowserView >> startDateLiteral: yyyymmddString [

	startDateLiteral := yyyymmddString 
]

{ #category : #initialization }
TBSTransactionsBrowserView >> yavuObjectsBrowserClass [
	^ TBSYavuTransactionsBrowser
]
