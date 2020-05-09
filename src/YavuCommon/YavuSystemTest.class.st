Class {
	#name : #YavuSystemTest,
	#superclass : #TestCase,
	#instVars : [
		'system'
	],
	#category : #'YavuCommon-Test'
}

{ #category : #'as yet unclassified' }
YavuSystemTest >> fvPerson [
	
	^YavuNaturalPerson nombre: 'Pedro Vozzi' dni: '28824324' sexo: 'M'
]

{ #category : #'as yet unclassified' }
YavuSystemTest >> fvozziUser [
	
	^YavuUser new
		name: 'fvozzi';
		password: '123456';
		roles: system roles;
		yourself
]

{ #category : #initialization }
YavuSystemTest >> newSystem [

   YavuEnvironment current systemClass: (YavuSystem enabledSubsystemsClasses: (Array with: YavuTransientSubsystem with: YavuSecuritySubsystem )).
   ^ YavuEnvironment current newSystem
]

{ #category : #initialization }
YavuSystemTest >> setUp [

	system := self newSystem.

]

{ #category : #tests }
YavuSystemTest >> testCustomersOfNameBeginsWith [

	"| clientes |
	clientes := system customersOfNameBeginsWith: 'Pedro Vozzi'.
	self assert: clientes size = 1.
	self assert: clientes asOrderedCollection first name asUppercase trimBoth = 'PEDRO VOZZI'"
]

{ #category : #tests }
YavuSystemTest >> testLoginUserNameAndPassword [

	system addUser: self fvozziUser.
	self assert: (system loginUserName: 'fvozzi' password: '123456').
	self should: [system loginUserName: 'fvozzi' password: '123'] raise: Error.
	self should: [system loginUserName: 'fvozzi1' password: '123456'] raise: Error
]

{ #category : #tests }
YavuSystemTest >> testSystemUserSecurityFunctions [
	
	self assert: self fvozziUser roles size equals: system roles size
]
