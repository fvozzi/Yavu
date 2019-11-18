Class {
	#name : #YavuSystem,
	#superclass : #Object,
	#instVars : [
		'subsystems'
	],
	#classVars : [
		'EnabledSubsystemsClasses'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #transientSystemInitialization }
YavuSystem class >> administratorUser [
	^ (SicUser
		name: 'Administrador'
		company: (Company name: 'Cámara Comercio'))
		password: 'yavu09';
		roles: self allRoles;
		yourself
]

{ #category : #transientSystemInitialization }
YavuSystem class >> allMenuElements [

	^OrderedCollection new
		add: ((CompositeMenuElement label: 'Inicio' presenterClass: TBSExamplesHome) id: 1);
		add: ((CompositeMenuElement label: 'Administración' presenterClass: TBSEntityClassSelectorView) id: 2);
		add: ((CompositeMenuElement label: 'Tablero' presenterClass: WAActualizarSituacionesView) id: 3);
		add: ((CompositeMenuElement label: 'Ayuda' presenterClass: WAHelpVideosView) id: 4);
		add: ((CompositeMenuElement label: 'Acerca de' presenterClass: WAHelpVideosView) id: 5);
		add: ((CompositeMenuElement label: 'Salir' presenterClass: WAConfirmLogOffView) id: 6);
		yourself
]

{ #category : #transientSystemInitialization }
YavuSystem class >> allRoles [

	^OrderedCollection new 
		add: ((Role name: 'Administrador') menuElements: self allMenuElements; securityFunctions: self allSecurityFunctions);
		yourself

]

{ #category : #transientSystemInitialization }
YavuSystem class >> allSecurityFunctions [

	^OrderedCollection new
						add: ((SecurityFunction name: 'Users') yavuObjectClass: SicUser) ;
						add: ((SecurityFunction name: 'Suppliers') yavuObjectClass: Supplier) ;
						yourself.

]

{ #category : #transientSystemInitialization }
YavuSystem class >> allSicUser [
	^ OrderedCollection new
		add: self administratorUser;
		yourself
]

{ #category : #view }
YavuSystem class >> demoCompany [
	self shouldBeImplemented.
]

{ #category : #initialization }
YavuSystem class >> enabledSubsystemsClasses [
	"Desde el environment definimos que subsistemas van a estar disponibles."
	
	^EnabledSubsystemsClasses
]

{ #category : #initialization }
YavuSystem class >> enabledSubsystemsClasses: aCollectionOfSubsystemsClasses [
	"Desde el environment definimos que subsistemas van a estar disponibles."
	
	EnabledSubsystemsClasses  := aCollectionOfSubsystemsClasses
]

{ #category : #'as yet unclassified' }
YavuSystem class >> mainView [

	^TBSYavuSystemView 
]

{ #category : #transientSystemInitialization }
YavuSystem class >> setUpTransientSubsystem: aTransientSubsystem [

	aTransientSubsystem setInstancesOf: SicUser with: self allSicUser.
	aTransientSubsystem setInstancesOf: MenuElement with: self allMenuElements.
	aTransientSubsystem setInstancesOf: SecurityFunction with: self allSecurityFunctions.
	aTransientSubsystem setInstancesOf: Role with: self allRoles

]

{ #category : #'as yet unclassified' }
YavuSystem >> addUser: aSicUser [
	^ self loginSubsystem addUser: aSicUser
]

{ #category : #'sin categoria' }
YavuSystem >> allowedEntitiesClasses [
	
	^self loginSubsystem allowedEntitiesClasses
]

{ #category : #'as yet unclassified' }
YavuSystem >> allowedRootMenuActions [

	^self loginSubsystem  allowedRootMenuActions
]

{ #category : #accessing }
YavuSystem >> company [
	
	^self loginSubsystem company
]

{ #category : #initialization }
YavuSystem >> initialize [
	super initialize.
	self initializeSubsystems 
]

{ #category : #initialization }
YavuSystem >> initializeSubsystems [

	subsystems := Dictionary new.
	self class enabledSubsystemsClasses do: [ :eachSubsystem |
		subsystems at: eachSubsystem subsystemTag put: (eachSubsystem on: self) ]
]

{ #category : #'as yet unclassified' }
YavuSystem >> instancesOf: aClass [ 
	
	^self storedSubsystem instancesOf: aClass
]

{ #category : #'as yet unclassified' }
YavuSystem >> loggedUser [
	
	^ self loginSubsystem loggedUser
]

{ #category : #'as yet unclassified' }
YavuSystem >> loginSubsystem [
	^ self subsystemAt: 'loginSubsystem'
]

{ #category : #'as yet unclassified' }
YavuSystem >> loginUserName: anUserName password: aLiteralPassword [

	^(self subsystemAt: 'loginSubsystem') loginUserName: anUserName password: aLiteralPassword
	
]

{ #category : #'as yet unclassified' }
YavuSystem >> mainView [

	^self class mainView
]

{ #category : #'as yet unclassified' }
YavuSystem >> purchaseSubsystem [
	^ self subsystemAt: 'purchaseSubsystem'
]

{ #category : #'as yet unclassified' }
YavuSystem >> read: aClass where: aBlockClosure [ 
	
	 ^self storedSubsystem read: aClass where: aBlockClosure
]

{ #category : #accessing }
YavuSystem >> roles [
	
	^self loginSubsystem roles
]

{ #category : #initialization }
YavuSystem >> setUpTransientSubsystem: aTransientSubsystem [

	self class setUpTransientSubsystem: aTransientSubsystem
]

{ #category : #'as yet unclassified' }
YavuSystem >> storedSubsystem [

	^self subsystemAt: 'storedSubsystem'
]

{ #category : #'as yet unclassified' }
YavuSystem >> subsystemAt: aSubsystemLabel [

	^subsystems at: aSubsystemLabel ifAbsent: [ self error: aSubsystemLabel, 'not installed.' ]
]
