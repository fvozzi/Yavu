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

	^NaturalPerson 
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
		add: ((CompositeMenuElement label: 'Inicio' presenterClass: TBSYavuSystemView) id: 1);
		add: ((CompositeMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView) id: 2);
		add: ((CompositeMenuElement label: 'Tablero' presenterClass: WAActualizarSituacionesView) id: 3);
		add: ((CompositeMenuElement label: 'Ayuda' presenterClass: WAHelpVideosView) id: 4);
		add: ((CompositeMenuElement label: 'Acerca de' presenterClass: WAHelpVideosView) id: 5);
		add: ((CompositeMenuElement label: 'Salir' presenterClass: WAConfirmLogOffView) id: 6);
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

{ #category : #adding }
YavuTransientSubsystem >> save: anObject [

	
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
