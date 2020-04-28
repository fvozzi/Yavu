Class {
	#name : #YavuTransientSubsystem,
	#superclass : #YavuStoredSubsystem,
	#instVars : [
		'instances',
		'customers',
		'menuElements',
		'financialSituations',
		'kegs',
		'securityFunctions'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #adding }
YavuTransientSubsystem >> addCustomer: aNaturalPerson [ 
	
	self customers add: aNaturalPerson 
]

{ #category : #'initialize-release' }
YavuTransientSubsystem >> ccOperationType [

	^OperationType name: 'Credito Consumo' code: 'CC'
]

{ #category : #'initialize-release' }
YavuTransientSubsystem >> commerceOfName: aName inCompany: aCompany [
	"Cuando necesitemos definir los comercios a nivel de transient system, tenemos que cambiar este metodo para que use commerces y lo los
	allowed commerces del usuario logueado."

	^self allowedCommerces detect: [ :one | one name = aName ] ifNone: []"No es necesario usar aCompany porque no estamos recorriendo todos los comercios sino solo los permitidos."
]

{ #category : #'initialize-release' }
YavuTransientSubsystem >> facundoVozziCustomer [

	^YavuNaturalPerson 
		nombre: 'Facundo Vozzi' dni: '27634975'  sexo: 'M' 
]

{ #category : #'initialize-release' }
YavuTransientSubsystem >> facundoVozziFinancialSituation1 [

	^(FinancialSituation 
		comercio: self demoCommerce
		fecha: '01/01/2014' asDate
		type: AmountOfDebt
		cliente: self facundoVozziCustomer
		fechaUltimoPago: '01/01/2014' asDate)
			operationType: self ccOperationType;
			operationCharacter: self titOperationCharacter;
			amountOfDebt: 100;
			yourself
			
]

{ #category : #accessing }
YavuTransientSubsystem >> financialSituationsOf: aPerson [	
	
	^self financialSituations select: [ :each | each customer = aPerson ]
	
	
]

{ #category : #initialization }
YavuTransientSubsystem >> initialize [

	instances := Dictionary new 
]

{ #category : #'initialize-release' }
YavuTransientSubsystem >> initializeCustomers [
	
	customers  := OrderedCollection new
						add: self facundoVozziCustomer;
						yourself.
]

{ #category : #'initialize-release' }
YavuTransientSubsystem >> initializeFinancialSituations [
	
	financialSituations  := OrderedCollection new
						add: self facundoVozziFinancialSituation1;
						yourself.
]

{ #category : #accessing }
YavuTransientSubsystem >> initializeMenuElements [ 
	
	menuElements := OrderedCollection new
		add: ((YavuCompositeMenuElement label: 'Inicio' presenterClass: TBSYavuSystemView) id: 1);
		add: ((YavuCompositeMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView) id: 2);
		add: ((YavuCompositeMenuElement label: 'Tablero' presenterClass: WAActualizarSituacionesView) id: 3);
		add: ((YavuCompositeMenuElement label: 'Ayuda' presenterClass: WAHelpVideosView) id: 4);
		add: ((YavuCompositeMenuElement label: 'Acerca de' presenterClass: WAHelpVideosView) id: 5);
		add: ((YavuCompositeMenuElement label: 'Salir' presenterClass: WAConfirmLogOffView) id: 6);
		yourself
]

{ #category : #initialization }
YavuTransientSubsystem >> initializeSystem: aSystem [

	super initializeSystem: aSystem.
	aSystem setUpTransientSubsystem: self
]

{ #category : #accessing }
YavuTransientSubsystem >> instanceCurrentAt: aDate entity: aCustomer class: aClass [ 

	#needRefactoring.
	^OrderedCollection  new
]

{ #category : #accessing }
YavuTransientSubsystem >> instancesOf: aClass [ 
	
	^instances at: aClass ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> instancesOfClass: aClass from: startDate to: endDate entities: aCollectionOfEntities [ 
	
	| setOfEntities |
	
	setOfEntities := aCollectionOfEntities asSet.
	^ (self instancesOf: aClass ) select: [ :each | (setOfEntities includes: each entity) and: [ 
			each date between: startDate and: endDate
			] ]
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> instancesOfClass: aClass withEntity: aYavuSupplier [ 
	
	^ (self instancesOf: aClass ) select: [ :each | each entity = aYavuSupplier ]
]

{ #category : #adding }
YavuTransientSubsystem >> save: anObject [

	(self instancesOf: anObject class) add: anObject 
]

{ #category : #accessing }
YavuTransientSubsystem >> securityFunctions [
	
	securityFunctions ifNil: [ self initializeSecurityFunctions ].
	^securityFunctions
]

{ #category : #initialization }
YavuTransientSubsystem >> setInstancesOf: aClass with: aCollectionOfInstances [
	
	^instances at: aClass put: aCollectionOfInstances
]

{ #category : #'initialize-release' }
YavuTransientSubsystem >> titOperationCharacter [

	^OperationCharacter name: 'Titular' code: 'TIT'
]

{ #category : #adding }
YavuTransientSubsystem >> update: anObject [

	
]
