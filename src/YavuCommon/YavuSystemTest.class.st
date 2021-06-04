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

	YavuTestEnvironment beCurrent.
   YavuEnvironment current systemClass: YavuRestaurantSystem.
   ^ YavuEnvironment current newSystem
]

{ #category : #initialization }
YavuSystemTest >> setUp [

	system := self newSystem.

]

{ #category : #tests }
YavuSystemTest >> testHuevoConversion [

	self assert: 30 unity equals: 1 maple.
	self assert: 1 cajonDe11Maple equals: 11 maple.
	self assert: 1 cajonDe11Maple equals: 330 unity.
	self assert: 1 cajonDe12Maple equals: 12 maple.
	self assert: 1 cajonDe12Maple equals: 360 unity
]

{ #category : #tests }
YavuSystemTest >> testKilogramoToGramoConversion [

	self assert: 1 kilogram = 1000 gram
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
