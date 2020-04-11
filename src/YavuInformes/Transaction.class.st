Class {
	#name : #Transaction,
	#superclass : #YvObject,
	#instVars : [
		'entity',
		'date',
		'ts'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
Transaction class >> allowMultipleEntitiesForQuery [

	^true
]

{ #category : #'sin categoria' }
Transaction class >> defaultObjectQueryStrategy [

	^FromToQueryStrategy forClass: self
	
]

{ #category : #'as yet unclassified' }
Transaction class >> defaultSearchLabel [

	^self entityLabel 
]

{ #category : #'sin categoria' }
Transaction class >> descripcion [
	"Answer the receiver description string."
	
	^'Transacción'
]

{ #category : #'sin categoria' }
Transaction class >> entity: unaEntidad date: unaFecha [
	"Crea una nueva instancia del receptor y la inicializa con unaEntidad y unaFecha."
	
	^super new initializeEntity: unaEntidad date: unaFecha
]

{ #category : #'sin categoria' }
Transaction class >> entityClass [
	
	^self subclassResponsibility
]

{ #category : #'sin categoria' }
Transaction class >> entityLabel [

	^'Entidad'
]

{ #category : #'as yet unclassified' }
Transaction class >> instanceCurrentAt: aDate entity: aCustomer [ 

	| instances |
	
	instances := self yavuSystem readManyOf: self 
		where: [:each | (each entity in: (Array with: aCustomer)) AND: [each date between: '01/01/1900' asDate and: aDate]].
	^instances asSortedCollection ifEmpty: [] ifNotEmpty: [:each | each last ]
]

{ #category : #'as yet unclassified' }
Transaction class >> instanceOf: startDate entity: anEntity [

	^self yavuSystem readOneOf: self 
		where: [:each | (each entity in: (Array with: anEntity)) AND: [each date between: startDate and: startDate]]
]

{ #category : #'as yet unclassified' }
Transaction class >> instancesFrom: startDate to: endDate entities: aCollectionOfEntities [

	^self yavuSystem readManyOf: self 
		where: [:each | (each entity in: (aCollectionOfEntities)) AND: [each date between: startDate and: endDate]]
]

{ #category : #'as yet unclassified' }
Transaction class >> instancesFrom: startDate to: endDate entity: anEntity [

	^self instancesFrom: startDate to: endDate  entities: (Array with: anEntity)
]

{ #category : #'sin categoria' }
Transaction class >> instancesFrom: startDate to: endDate for: anEntity [

	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Transaction class >> instancesFrom: startDate to: endDate forCompany: aCompany [

	^self yavuSystem readManyOf: self 
		where: [:each | each entity company = aCompany AND: [each date between: startDate and: endDate]]
]

{ #category : #'as yet unclassified' }
Transaction class >> instancesOf: startDate entity: anEntity [

	^self instancesFrom: startDate to: startDate entity: anEntity
]

{ #category : #'as yet unclassified' }
Transaction class >> possibleSearchSelectors [

	^Dictionary new 
		at: self entityLabel put: #entity;
		yourself
]

{ #category : #'sin categoria' }
Transaction class >> waTableReportColumns [

	^OrderedCollection new
			add: (WAReportColumn	selector: #entity title: self entityLabel);
			add: (WAReportColumn	selector: #date title: 'Fecha');		
			yourself		
]

{ #category : #'sin categoria' }
Transaction >> <= otherTransaction [
	"Answer whether the receiver is less than or equal to the argument."
	
	^self entity <= otherTransaction entity and: [self date <= otherTransaction date]
]

{ #category : #'sin categoria' }
Transaction >> = otraTransaccion [
	"Devuelve true si el receptor es igual a otraTransaccion."

	self class = otraTransaccion class ifFalse: [^false].
	^self entity = otraTransaccion entity and: [
		self date = otraTransaccion date]
]

{ #category : #'sin categoria' }
Transaction >> date [
	^ date
]

{ #category : #'sin categoria' }
Transaction >> date: unaFecha [	
	
	date:= unaFecha
]

{ #category : #'as yet unclassified' }
Transaction >> dateDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new 
		componentClass: MAMonthYearSelectorComponent;
        	accessor: #date;
        	label: 'Fecha';
        	priority: 110;
		beRequired;
        	yourself
]

{ #category : #'sin categoria' }
Transaction >> entity [
	^ entity
]

{ #category : #'sin categoria' }
Transaction >> entity: unaEntidad [
	
	entity:= unaEntidad
]

{ #category : #'as yet unclassified' }
Transaction >> entityDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #entity;
		default: nil;
		options: self class entityClass all;
		label: self class entityLabel;
		priority: 100;
		beRequired;
		yourself
]

{ #category : #'sin categoria' }
Transaction >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity."

	^self entity hash bitXor: self date hash
]

{ #category : #'sin categoria' }
Transaction >> initializeEntity: unaEntidad date: unaFecha [
	"Inicializa la entidad del receptor con unaEntidad y la fecha con unaFecha."
	
	entity:= unaEntidad.
	date:= unaFecha
]

{ #category : #'as yet unclassified' }
Transaction >> maDescriptionForReport [
	"Devuelve un magritte description para ver en una tabla."

	^self magritteDescription
]

{ #category : #'as yet unclassified' }
Transaction >> ts [
	 ts isNil ifTrue: [ ts:= TimeStamp now ].
	^ts
]

{ #category : #'sin categoria' }
Transaction >> ts: anObject [
	ts := anObject
]
