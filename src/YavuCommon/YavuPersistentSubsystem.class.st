Class {
	#name : #YavuPersistentSubsystem,
	#superclass : #YavuStoredSubsystem,
	#instVars : [
		'dbConnection'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem class >> externalHttpConnectionTimeout [

	^15
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem class >> rolesPredeterminados [
	"Crea y devuelve los roles predeterminados del sistema."
	
	^OrderedCollection new
		add: ((Role named: 'Administrador') menuElements: self current menuElements);
		yourself
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem class >> sinNombreWorkspace [

	^UIManager default 
		edit: self sinNombreWorkspaceText
		label: 'Utilidades del sistema'
		accept: true.
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem class >> sinNombreWorkspaceText [
	"Abre un workspace con algun utilidades del sistema."

^'"Creación inicial"
StMagmaPersistence createDB.
StPersistence current connect.
SistemaDeInformes singleton empresas first add: (Empresa named: ''C.C. Chacabuco'')
StPersistence current commit: [StPersistence current root]

"Configuración"
WASICImages addAllFilesIn: FileDirectory default pathName, ''\Resources\images''
WASICImages addAllFilesIn: FileDirectory default pathName, ''\Resources\css''

"Conectar y desconectar la BD."
StPersistence current: StMagmaPersistence new
StPersistence current connect.
StPersistence current release

"Utilidades"
WARegistry clearAllHandlers.
Smalltalk garbageCollect 

"Resetear menu elements"
SistemaDeInformes singleton resetearElementosDeMenu.
(Rol named: ''Administrador'') menuElements: SistemaDeInformes singleton menuElements.
StPersistence current commit: [SistemaDeInformes singleton]

"Chequear instancias huerfanas"
(YavuObject withAllSubclasses select: [:each | each allInstances size ~= 0])
	do: [:each | each allInstances do: [:i | i become: String new]].
Individuo allInstances do: [:each | each become: String new].
SICSession  allInstances do: [:each | each become: String new].

"Utilidades Pharo"
ScriptLoader new cleanUpForRelease.

"Magma"
(MagmaUpgrader source: ''C:\FV\Desarrollo\Sistemas YavuSoft\YavuInformes\Sources\0.0.5\oldsicBD'') compressTo:
''C:\FV\Desarrollo\Sistemas YavuSoft\YavuInformes\Sources\0.0.5\sicBD''.

MagmaSession shutDown.
MagmaSession cleanUp. 
MagmaSession initialize.
MagmaSession cleanUp 

'
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem class >> smtpPassword [

	^'yavu09'
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem class >> smtpUserName [

	^'websic@fibercorp.com.ar'
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem class >> workspace [
	"Abre un workspace con algun utilidades del sistema."

	(Workspace new
		acceptContents: 
'"Creación inicial"
StMagmaPersistence createDB.
StPersistence current connect.
SistemaDeInformes singleton empresas first add: (Empresa named: ''C.C. Chacabuco'')
StPersistence current commit: [StPersistence current root]

"Configuración"
WASICImages addAllFilesIn: FileDirectory default pathName, ''\Resources\images''
WASICImages addAllFilesIn: FileDirectory default pathName, ''\Resources\css''

"Conectar y desconectar la BD."
StPersistence current: StMagmaPersistence new
StPersistence current connect.
StPersistence current release

"Utilidades"
WARegistry clearAllHandlers.
Smalltalk garbageCollect 

"Resetear menu elements"
SistemaDeInformes singleton resetearElementosDeMenu.
(Rol named: ''Administrador'') menuElements: SistemaDeInformes singleton menuElements.
StPersistence current commit: [SistemaDeInformes singleton]

"Chequear instancias huerfanas"
(YavuObject withAllSubclasses select: [:each | each allInstances size ~= 0])
	do: [:each | each allInstances do: [:i | i become: String new]].
Individuo allInstances do: [:each | each become: String new].
SICSession  allInstances do: [:each | each become: String new].

"Utilidades Pharo"
ScriptLoader new cleanUpForRelease.

"Magma"
(MagmaUpgrader source: ''C:\FV\Desarrollo\Sistemas YavuSoft\YavuInformes\Sources\0.0.5\oldsicBD'') compressTo:
''C:\FV\Desarrollo\Sistemas YavuSoft\YavuInformes\Sources\0.0.5\sicBD''.

MagmaSession shutDown.
MagmaSession cleanUp. 
MagmaSession initialize.
MagmaSession cleanUp 

')
	position: 80@90;
   	extent: 800 @ 500;
	openAsIs 
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> afipDataOf: aPerson [

	^InscripcionAFIP numeroDeDocumento: aPerson cuit
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> bouncedChecksOf: aPerson [

	^self yavuSystem readManyOf:  BouncedCheck where:  [ :each | each customer = aPerson ]
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> commerceOfName: aName inCompany: aCompany [

	^self yavuSystem readOneOf: self where: [:each | each name  = aName AND: [each company = aCompany]]
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> createDBConnection [

	dbConnection := StGLORPPersistence createConnection
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> dbConnection [

	dbConnection ifNil: [ self createDBConnection ].
	^dbConnection
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> electoralRollOf: aCustomer [

	^self yavuSystem readOneOf: self where: [:each | each dni  = aCustomer dni]
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> entityOfClass: anEntityClass atID: aNumber ifAbsent: aBlock [

	^(self yavuSystem readOneOf: anEntityClass where: [:each | each id  = aNumber]) ifNil: [aBlock value]
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> financialSituationsOf: aPerson [	
	
	^(self yavuSystem readManyOf: FinancialSituation where: [:each | each customer = aPerson]) asOrderedCollection
	
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> instanceCurrentAt: aDate entity: aCustomer class: aClass [ 

	#needRefactoring.
	^aClass  instanceCurrentAt: aDate entity: aCustomer
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> lostChecksOf: aPerson [

	^self yavuSystem readManyOf:  LostCheck where:  [ :each | each customer = aPerson ]
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> reportEmissionsOf: aPerson [

	^self yavuSystem readManyOf:  ReportEmission where:  [ :each | each customer = aPerson ]
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> searchCustomerByCUIT: aCuitLiteral [
	"Devuelve una instancia del receptor desde la BD cuyo cuit es igual a aCUITLiteral."

	^self yavuSystem readOneOf: self where: [:each | each cuit = aCuitLiteral]
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> store: anObject [

	anObject store
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> users [

	^self yavuSystem readManyOf: SicUser 
]

{ #category : #'as yet unclassified' }
YavuPersistentSubsystem >> yavuSystem [

	^self dbConnection yavuSystem
]
