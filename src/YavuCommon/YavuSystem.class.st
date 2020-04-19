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
	^ (YavuUser
		name: 'Administrador'
		company: (Company name: 'Cámara Comercio'))
		password: 'yavu09';
		roles: self allRoles;
		yourself
]

{ #category : #transientSystemInitialization }
YavuSystem class >> allMenuElements [
	"Answer all the available menues of the composite system."
	
	| menues |
	
	 menues := OrderedCollection new.
	^ menues 	
		addAll: self subsystemsMenuElement;
		yourself
]

{ #category : #transientSystemInitialization }
YavuSystem class >> allRoles [

	^OrderedCollection new 
		add: ((YavuRole name: 'Administrador') menuElements: self allMenuElements; securityFunctions: self allSecurityFunctions);
		yourself

]

{ #category : #transientSystemInitialization }
YavuSystem class >> allSecurityFunctions [

	^OrderedCollection new
						add: ((YavuSecurityFunction name: 'Users') yavuObjectClass: YavuUser) ;
						add: ((YavuSecurityFunction name: 'Suppliers') yavuObjectClass: YavuSupplier) ;
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

	^ EnabledSubsystemsClasses
]

{ #category : #initialization }
YavuSystem class >> enabledSubsystemsClasses: aCollectionOfSubsystemsClasses [
	"Desde el environment definimos que subsistemas van a estar disponibles."
	
	EnabledSubsystemsClasses  := aCollectionOfSubsystemsClasses
]

{ #category : #'as yet unclassified' }
YavuSystem class >> homeViewClass [
	
	 ^ Smalltalk at: #TBSYavuHomeView
]

{ #category : #'as yet unclassified' }
YavuSystem class >> mainView [

	^TBSYavuSystemView 
]

{ #category : #initialization }
YavuSystem class >> setUpTransientSubsystem: aTransientSubsystem [

	aTransientSubsystem setInstancesOf: YavuUser with: self allSicUser.
	aTransientSubsystem setInstancesOf: YavuMenuElement with: self allMenuElements.
	aTransientSubsystem setInstancesOf: YavuSecurityFunction with: self allSecurityFunctions.
	aTransientSubsystem setInstancesOf: YavuRole with: self allRoles

]

{ #category : #'as yet unclassified' }
YavuSystem class >> subsystemsMenuElement [

	^ self enabledSubsystemsClasses
		inject: OrderedCollection new
		into: [ :menues :subsystemClass | 
			menues
				addAll: subsystemClass menuElements;
				yourself ]
]

{ #category : #'as yet unclassified' }
YavuSystem class >> systemName [
	
	^ 'Yavusoft'
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
YavuSystem >> allowedEntitiesClassesOn: aClass [ 
	
	 ^ aClass entitiesClasses 
]

{ #category : #'as yet unclassified' }
YavuSystem >> allowedRootMenuActions [

	^self loginSubsystem  allowedRootMenuActions
]

{ #category : #'as yet unclassified' }
YavuSystem >> allowedTransactionsClassesOn: aClass [ 
	
	^ aClass transactionsClasses 
]

{ #category : #accessing }
YavuSystem >> company [
	
	^self loginSubsystem company
]

{ #category : #'as yet unclassified' }
YavuSystem >> homeViewClass [ 

	^ self class homeViewClass 
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
YavuSystem >> name [
	self shouldBeImplemented.
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

{ #category : #accessing }
YavuSystem >> setUpTransientSubsystem: aTransientSubsystem [

	^ self class setUpTransientSubsystem: aTransientSubsystem
]

{ #category : #'as yet unclassified' }
YavuSystem >> storedSubsystem [

	^self subsystemAt: 'storedSubsystem'
]

{ #category : #'as yet unclassified' }
YavuSystem >> subsystemAt: aSubsystemLabel [

	^subsystems at: aSubsystemLabel ifAbsent: [ self error: aSubsystemLabel, 'not installed.' ]
]

{ #category : #'as yet unclassified' }
YavuSystem >> systemName [
	
	^ self class systemName 
]
