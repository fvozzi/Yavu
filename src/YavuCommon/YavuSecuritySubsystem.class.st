Class {
	#name : #YavuSecuritySubsystem,
	#superclass : #YavuSubsystem,
	#instVars : [
		'loggedUser',
		'users',
		'roles'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #configuration }
YavuSecuritySubsystem class >> entitiesClasses [
	
	^ OrderedCollection with: YavuUser with: YavuRole
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem class >> fontAwesomeClass [
	
	^ 'fa-group'
]

{ #category : #configuration }
YavuSecuritySubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		yourself
]

{ #category : #configuration }
YavuSecuritySubsystem class >> subsystemName [

	^ 'Seguridad'
]

{ #category : #configuration }
YavuSecuritySubsystem class >> subsystemTag [

	 ^'loginSubsystem'
]

{ #category : #configuration }
YavuSecuritySubsystem class >> transactionsClasses [
	
	^ OrderedCollection new
]

{ #category : #crud }
YavuSecuritySubsystem >> addRole: aRole [ 
	
	self roles add: aRole.
	self system storedSubsystem save: aRole
]

{ #category : #crud }
YavuSecuritySubsystem >> addUser: aYavuUser [ 
	
	"self users add: aYavuUser."
	self system storedSubsystem save: aYavuUser
]

{ #category : #accessing }
YavuSecuritySubsystem >> administratorUser [

	^ self system administratorUser
]

{ #category : #accessing }
YavuSecuritySubsystem >> allowedEntitiesClasses [
	
	^loggedUser allowedEntitiesClasses
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem >> allowedEntitiesClassesOn: aClass [ 
	
	^ aClass entitiesClasses intersection: self loggedUser allowedEntitiesClasses 
]

{ #category : #accessing }
YavuSecuritySubsystem >> allowedRootMenuActions [
	
	^loggedUser menuElements
]

{ #category : #accessing }
YavuSecuritySubsystem >> loggedUser [

	^loggedUser
]

{ #category : #accessing }
YavuSecuritySubsystem >> loggedUser: aSicUser [

	loggedUser := aSicUser
]

{ #category : #'api/queries' }
YavuSecuritySubsystem >> loginUserName: aName password: aPassword [ 
	
	[self loggedUser: (self searchUserName: aName password: aPassword)]
		on: Error do: [ :ex | self error: ex description. ^false ].
	^true
]

{ #category : #accessing }
YavuSecuritySubsystem >> name [ 

	 ^ 'Seguridad'
]

{ #category : #crud }
YavuSecuritySubsystem >> removeRole: aRole [ 
	
	self roles remove: aRole.
	self system storedSubsystem remove: aRole
]

{ #category : #crud }
YavuSecuritySubsystem >> removeUser: aYavuUser [ 
	
	self users remove: aYavuUser.
	self system storedSubsystem remove: aYavuUser
]

{ #category : #configuration }
YavuSecuritySubsystem >> roleClass [
	^YavuRole 
]

{ #category : #accessing }
YavuSecuritySubsystem >> roles [
	^ roles ifNil: [ self system storedSubsystem instancesOf: self roleClass ]
]

{ #category : #'api/queries' }
YavuSecuritySubsystem >> searchUserName: aName password: aPassword [

	^self users 
		detect: [ :one | one name asUppercase = aName asUppercase and: [ one password = aPassword ] ] 
		ifNone: [ Error signal: 'Usuario o contraseña incorrecta.' ]
]

{ #category : #initialization }
YavuSecuritySubsystem >> setGuestUser [

	self loggedUser: YavuGuestUser current
]

{ #category : #configuration }
YavuSecuritySubsystem >> userClass [
	^YavuUser 
]

{ #category : #accessing }
YavuSecuritySubsystem >> users [
	 users ifNil: [ users:= self system storedSubsystem instancesOf: self userClass ].
	 users add: self administratorUser.
	^ users 
]
