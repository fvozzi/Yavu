Class {
	#name : #YavuTransaction,
	#superclass : #YavuObject,
	#instVars : [
		'entity',
		'date',
		'ts'
	],
	#category : #'YavuCommon-DomainObjects'
}

{ #category : #'sin categoria' }
YavuTransaction class >> allowMultipleEntitiesForQuery [

	^true
]

{ #category : #'sin categoria' }
YavuTransaction class >> defaultObjectQueryStrategy [

	^FromToQueryStrategy forClass: self
	
]

{ #category : #'as yet unclassified' }
YavuTransaction class >> defaultSearchLabel [

	^self entityLabel 
]

{ #category : #'sin categoria' }
YavuTransaction class >> descripcion [
	"Answer the receiver description string."
	
	^'Transacción'
]

{ #category : #'sin categoria' }
YavuTransaction class >> entity: unaEntidad date: unaFecha [
	"Crea una nueva instancia del receptor y la inicializa con unaEntidad y unaFecha."
	
	^super new initializeEntity: unaEntidad date: unaFecha
]

{ #category : #'sin categoria' }
YavuTransaction class >> entityClass [
	
	^self subclassResponsibility
]

{ #category : #'sin categoria' }
YavuTransaction class >> entityLabel [

	^'Entidad'
]

{ #category : #'as yet unclassified' }
YavuTransaction class >> instanceCurrentAt: aDate entity: aCustomer [ 

	| instances |
	
	instances := self yavuSystem readManyOf: self 
		where: [:each | (each entity in: (Array with: aCustomer)) AND: [each date between: '01/01/1900' asDate and: aDate]].
	^instances asSortedCollection ifEmpty: [] ifNotEmpty: [:each | each last ]
]

{ #category : #'as yet unclassified' }
YavuTransaction class >> instanceOf: startDate entity: anEntity [

	^self yavuSystem readOneOf: self 
		where: [:each | (each entity in: (Array with: anEntity)) AND: [each date between: startDate and: startDate]]
]

{ #category : #'as yet unclassified' }
YavuTransaction class >> instancesFrom: startDate to: endDate [

	^ self yavuSystem storedSubsystem instancesOfClass: self from: startDate to: endDate 
]

{ #category : #'as yet unclassified' }
YavuTransaction class >> instancesFrom: startDate to: endDate entities: aCollectionOfEntities [

	^ self yavuSystem storedSubsystem instancesOfClass: self from: startDate to: endDate entities: aCollectionOfEntities  
]

{ #category : #'as yet unclassified' }
YavuTransaction class >> instancesFrom: startDate to: endDate entity: anEntity [

	^self instancesFrom: startDate to: endDate  entities: (Array with: anEntity)
]

{ #category : #'sin categoria' }
YavuTransaction class >> instancesFrom: startDate to: endDate for: anEntity [

	^self subclassResponsibility
]

{ #category : #'as yet unclassified' }
YavuTransaction class >> instancesFrom: startDate to: endDate forCompany: aCompany [

	^self yavuSystem readManyOf: self 
		where: [:each | each entity company = aCompany AND: [each date between: startDate and: endDate]]
]

{ #category : #'as yet unclassified' }
YavuTransaction class >> instancesOf: startDate entity: anEntity [

	^self instancesFrom: startDate to: startDate entity: anEntity
]

{ #category : #'as yet unclassified' }
YavuTransaction class >> mongoDate [
<mongoDescription>

	^  VOToOneDescription new
			attributeName: 'date';
			accessor: (MAPluggableAccessor
				read: [ :transaction | transaction date ]
				write: [ :transaction :value  | transaction date: value asDate]);
			yourself

]

{ #category : #'as yet unclassified' }
YavuTransaction class >> possibleSearchSelectors [

	^Dictionary new 
		at: self entityLabel put: #entity;
		yourself
]

{ #category : #accessing }
YavuTransaction class >> subsystemClass [
	^ Smalltalk at: #YavuSubsystem
]

{ #category : #'sin categoria' }
YavuTransaction class >> waTableReportColumns [

	^OrderedCollection new
			add: (WAReportColumn	selector: #entity title: self entityLabel);
			add: (WAReportColumn	selector: #date title: 'Fecha');		
			yourself		
]

{ #category : #'sin categoria' }
YavuTransaction >> <= otherTransaction [
	"Answer whether the receiver is less than or equal to the argument."
	
	self entity ifNil: [ ^ false ].
	^ self entity <= otherTransaction entity and: [self date <= otherTransaction date]
]

{ #category : #'sin categoria' }
YavuTransaction >> date [
	^ date 
]

{ #category : #'sin categoria' }
YavuTransaction >> date: unaFecha [	
	
	date:= unaFecha
]

{ #category : #descriptions }
YavuTransaction >> descriptionDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new 
		componentClass: TBSMagritteDateInputComponent;
        	accessor: #date;
        	label: 'Fecha';
        	priority: 20;
		beRequired;
        	yourself
]

{ #category : #descriptions }
YavuTransaction >> descriptionEntity [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #entity;
		default: nil;
		options: self class entityClass all;
		label: self class entityLabel;
		priority: 10;
		beRequired;
		beReadonly;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #'sin categoria' }
YavuTransaction >> entity [
	^ entity
]

{ #category : #'sin categoria' }
YavuTransaction >> entity: unaEntidad [
	
	entity:= unaEntidad
]

{ #category : #'sin categoria' }
YavuTransaction >> equalTo: otraSituacionComercial [
	"Devuelve true si otraSituacionComercial es igual al receptor."
	
	^(self entity = otraSituacionComercial entity) and: [
		self date = otraSituacionComercial date]
]

{ #category : #initialization }
YavuTransaction >> initialize [ 

	super initialize.
	date := Date today
]

{ #category : #'sin categoria' }
YavuTransaction >> initializeEntity: unaEntidad date: unaFecha [
	"Inicializa la entidad del receptor con unaEntidad y la fecha con unaFecha."
	
	entity:= unaEntidad.
	date:= unaFecha
]

{ #category : #descriptions }
YavuTransaction >> maDescriptionForReport [
	"Devuelve un magritte description para ver en una tabla."

	^self magritteDescription reject: [:each | each label = 'Agregar']
]

{ #category : #'as yet unclassified' }
YavuTransaction >> ts [
	 ts isNil ifTrue: [ ts:= TimeStamp now ].
	^ts
]

{ #category : #'sin categoria' }
YavuTransaction >> ts: anObject [
	ts := anObject
]
