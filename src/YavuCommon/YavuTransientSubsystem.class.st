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

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> addNewKed: aKeg [ 
	
	kegs add: aKeg
]

{ #category : #demoObjects }
YavuTransientSubsystem >> administratorCommerces [

	^OrderedCollection 
		with: self variosCommerce with: self demoCommerce
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> afipDataOf: aPerson [

	^InscripcionAFIP inexistente
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> bouncedChecksOf: aPerson [

	^OrderedCollection new
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

{ #category : #accessing }
YavuTransientSubsystem >> customers [
	
	customers ifNil: [ self initializeCustomers ].
	^customers
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> customersOfNameBeginsWith: firstsLetterOfName [
	"Devuelve una coleccion de clientes cuyo nombre comienza con unString."

	^self customers select: [ :each | each name asUppercase beginsWith: firstsLetterOfName asUppercase ]
]

{ #category : #demoObjects }
YavuTransientSubsystem >> demoCommerce [
			
		^(Commerce name: 'Polirubros')
			inputStrategy: AffectationStrategy;
			yourself
]

{ #category : #demoObjects }
YavuTransientSubsystem >> demoCompany [
			
		^Company name: 'Cámara Comercio'
			
]

{ #category : #accessing }
YavuTransientSubsystem >> electoralRollOf: aCustomer [

	^ElectoralRoll new
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> entityOfClass: anEntityClass atID: aNumber ifAbsent: aBlock [

	| instances |
	
	instances := self perform: anEntityClass instancesSelector.
	^instances detect: [ :one | one id = aNumber ] ifNone: aBlock
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
YavuTransientSubsystem >> financialSituations [
	
	financialSituations ifNil: [ self initializeFinancialSituations ].
	^financialSituations
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

{ #category : #'initialize-release' }
YavuTransientSubsystem >> initializeUsers [

	users := OrderedCollection
				with: self administratorUser
				
]

{ #category : #accessing }
YavuTransientSubsystem >> instanceCurrentAt: aDate entity: aCustomer class: aClass [ 

	#needRefactoring.
	^OrderedCollection  new
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> instancesOf: aClass [ 
	
	^instances at: aClass ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> lostChecksOf: aPerson [

	^OrderedCollection new
]

{ #category : #demoObjects }
YavuTransientSubsystem >> menuElements [
	
	menuElements ifNil: [ self initializeMenuElements ].
	^menuElements
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> read: aClass where: aBlockClosure [ 
	
	 ^(self instancesOf: aClass) select: [ :each |  aBlockClosure value: each]
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> reportEmissionsOf: aPerson [

	^OrderedCollection new
]

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> searchCustomerByCUIT: aCuitLiteral [
	"Devuelve una instancia del receptor desde la BD cuyo cuit es igual a aCUITLiteral."

	^self customers detect:  [:each | each cuit = aCuitLiteral] ifNone: [  ]
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

{ #category : #'as yet unclassified' }
YavuTransientSubsystem >> store: anObject [

	
]

{ #category : #'initialize-release' }
YavuTransientSubsystem >> titOperationCharacter [

	^OperationCharacter name: 'Titular' code: 'TIT'
]

{ #category : #demoObjects }
YavuTransientSubsystem >> variosCommerce [
			
		^(Commerce name: 'Varios')
			inputStrategy: AffectationStrategy;
			yourself
]
