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

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem class >> entitiesClasses [
	
	^ OrderedCollection with: YavuUser with: YavuRole with: YavuSecurityFunction 
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		yourself
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem class >> subsystemName [

	^ 'Seguridad'
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem class >> subsystemTag [

	 ^'loginSubsystem'
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem >> addUser: aSicUser [ 
	
	self users add: aSicUser.
	self system storedSubsystem save: aSicUser
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem >> allowedEntitiesClasses [
	
	^loggedUser allowedEntitiesClasses
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem >> loginUserName: aName password: aPassword [ 
	
	[self loggedUser: (self searchUserName: aName password: aPassword)]
		on: Error do: [ :ex | self error: ex description. ^false ].
	^true
]

{ #category : #accessing }
YavuSecuritySubsystem >> name [ 

	 ^ 'Seguridad'
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem >> roleClass [
	^YavuRole 
]

{ #category : #accessing }
YavuSecuritySubsystem >> roles [
	^ roles ifNil: [ self system storedSubsystem instancesOf: self roleClass ]
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem >> searchUserName: aName password: aPassword [

	^self users 
		detect: [ :one | one name asUppercase = aName asUppercase and: [ one password = aPassword ] ] 
		ifNone: [ Error signal: 'Usuario o contraseña incorrecta.' ]
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem >> userClass [
	^YavuUser 
]

{ #category : #'as yet unclassified' }
YavuSecuritySubsystem >> users [
	 users ifNil: [ users:= self system storedSubsystem instancesOf: self userClass ].
	^ users 
]
