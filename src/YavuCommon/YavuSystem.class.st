Class {
	#name : #YavuSystem,
	#superclass : #Object,
	#instVars : [
		'subsystems',
		'announcer'
	],
	#classVars : [
		'EnabledSubsystemsClasses'
	],
	#classInstVars : [
		'companyName'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #configuration }
YavuSystem class >> administratorUser [

	^ (YavuUser
		name: 'Administrador')
			password: 'yavu09';
			addRole: self superAdministratorRole;
			yourself
]

{ #category : #configuration }
YavuSystem class >> companyName [

	^ companyName 
]

{ #category : #configuration }
YavuSystem class >> companyName: aString [ 

	companyName := aString
]

{ #category : #initialization }
YavuSystem class >> companyName: aString enabledSubsystemsClasses: aCollectionOfSubsystemsClasses [
	"Desde el environment definimos que subsistemas van a estar disponibles."
	
	self companyName: aString.
	self enabledSubsystemsClasses: aCollectionOfSubsystemsClasses 
]

{ #category : #configuration }
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
YavuSystem class >> fontAwesomeClass [

	^ 'fa-beer'
]

{ #category : #configuration }
YavuSystem class >> homeViewClass [
	
	 ^ Smalltalk at: #TBSYavuHomeView
]

{ #category : #initialization }
YavuSystem class >> initializeSubsystemsForDevelopment [
]

{ #category : #initialization }
YavuSystem class >> initializeSubsystemsForTesting [

	self enabledSubsystemsClasses: (Array with: YavuTransientSubsystem with: YavuSecuritySubsystem)
]

{ #category : #configuration }
YavuSystem class >> mainView [

	^TBSYavuSystemView 
]

{ #category : #subsystemsProtocol }
YavuSystem class >> menuElements [
	^ self subsystemsMenuElements, self systemMenuElements
]

{ #category : #configuration }
YavuSystem class >> mongoDatabaseName [
	^ companyName
		ifNil: [ self systemName ]
		ifNotNil: [ companyName ]
]

{ #category : #seaside }
YavuSystem class >> registerSeasideApplication [

	self registerYavuApp 
]

{ #category : #seaside }
YavuSystem class >> registerYavuApp [
	^ (WAAdmin
		register: self seasideApplicationRoot
		asApplicationAt: self seasideApplicationName)
		preferenceAt: #sessionClass put: YavuSession;
		preferenceAt: #resourceBaseUrl put: YavuEnvironment current resourceBaseUrl;
		preferenceAt: #maximumRelativeAge put: 28800;
		addLibrary: YavuEnvironment current jqLibrary;
		addLibrary: YavuEnvironment current tbsLibrary;
		addLibrary: YavuEnvironment current fontAwesomeLibrary
]

{ #category : #configuration }
YavuSystem class >> seasideApplicationName [
	^ companyName asLowercase
]

{ #category : #'as yet unclassified' }
YavuSystem class >> seasideApplicationRoot [

	^ TBSYavuLogin 
]

{ #category : #initialization }
YavuSystem class >> setUpTransientSubsystem: aTransientSubsystem [

	aTransientSubsystem setInstancesOf: YavuUser with: (OrderedCollection with: self administratorUser).
	aTransientSubsystem setInstancesOf: YavuMenuElement with: self menuElements.

]

{ #category : #configuration }
YavuSystem class >> subsystemName [
	
	^ self systemName
]

{ #category : #subsystemsProtocol }
YavuSystem class >> subsystemsMenuElements [
	^ self enabledSubsystemsClasses
		inject: OrderedCollection new
		into: [ :menues :subsystemClass | 
			menues
				addAll: subsystemClass menuElements;
				yourself ]
]

{ #category : #configuration }
YavuSystem class >> superAdministratorRole [

	^ (YavuRole name: 'Super Administrador') 
		menuElements: self menuElements; 
		yavuObjects: self yavuObjects;
		yourself

]

{ #category : #subsystemsProtocol }
YavuSystem class >> systemMenuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Migraciones' presenterClass: TBSMigrationView subsystem: self) id: 1);
		add: ((YavuSimpleMenuElement label: 'Acerca de' presenterClass: TBSSystemAboutView subsystem: self) id: 2);
		yourself
]

{ #category : #configuration }
YavuSystem class >> systemName [
	
	^ 'YavuSystem'
]

{ #category : #subsystemsProtocol }
YavuSystem class >> yavuObjects [

	^ self enabledSubsystemsClasses
		inject: OrderedCollection new
		into: [ :objects :subsystemClass | 
			objects
				addAll: subsystemClass entitiesClasses;
				addAll: subsystemClass transactionsClasses;
				yourself ]
]

{ #category : #'as yet unclassified' }
YavuSystem >> accountingSubsystem [

	^ self subsystemAt: 'accountingSubsystem'
]

{ #category : #'as yet unclassified' }
YavuSystem >> addUser: aSicUser [
	^ self loginSubsystem addUser: aSicUser
]

{ #category : #transientSystemInitialization }
YavuSystem >> administratorUser [ 

	^ self class administratorUser 
]

{ #category : #'sin categoria' }
YavuSystem >> allowedEntitiesClasses [
	
	^self loginSubsystem allowedEntitiesClasses
]

{ #category : #'as yet unclassified' }
YavuSystem >> allowedEntitiesClassesOn: aSubsystem [ 
	
	 ^ self loginSubsystem allowedEntitiesClassesOn: aSubsystem 
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
YavuSystem >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
YavuSystem >> company [
	
	^self loginSubsystem company
]

{ #category : #accessing }
YavuSystem >> companyName [
	
	^self class companyName
]

{ #category : #configuration }
YavuSystem >> completeString: aString withZeros: anInteger [ 
	
	| formattedString |
	
	formattedString := aString.
	anInteger - aString size timesRepeat: [ 
		formattedString := '0', formattedString 
		 ].
	^ formattedString 
]

{ #category : #initialization }
YavuSystem >> enabledSubsystems [

	^ subsystems
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
YavuSystem >> label [
	^ self class label
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

{ #category : #subsystemsProtocol }
YavuSystem >> menuElements [
	
	^ self class menuElements 
]

{ #category : #rendering }
YavuSystem >> migrationsToRun [

	^ YavuSystemMigration allSubclasses select: [ :each |
		each wasAlreadyRun not
		 ]
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
YavuSystem >> ranMigrationsLog [
		^ self storedSubsystem instancesOf: YavuSystemMigrationLog
]

{ #category : #'as yet unclassified' }
YavuSystem >> read: aClass where: aBlockClosure [ 
	
	 ^self storedSubsystem read: aClass where: aBlockClosure
]

{ #category : #accessing }
YavuSystem >> roles [
	
	^self loginSubsystem roles
]

{ #category : #'as yet unclassified' }
YavuSystem >> saleSubsystem [

	^ self subsystemAt: 'saleSubsystem'
]

{ #category : #'as yet unclassified' }
YavuSystem >> setGuestUser [

	^(self subsystemAt: 'loginSubsystem') setGuestUser
	
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
YavuSystem >> subsystemOfClass: aSubsystemClass [
	^ self subsystemAt: aSubsystemClass subsystemTag
]

{ #category : #'as yet unclassified' }
YavuSystem >> systemName [
	
	^ self class systemName 
]

{ #category : #'as yet unclassified' }
YavuSystem >> toReviseStatus [
	
	^ Smalltalk at: #YavuToReviseWorkflowStatus 
]

{ #category : #subsystemsProtocol }
YavuSystem >> yavuObjects [
	
	^ self class yavuObjects 
]
