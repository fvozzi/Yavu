Class {
	#name : #YavuEnvironment,
	#superclass : #Object,
	#classVars : [
		'CurrentSystem',
		'CurrentSystemClass'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #actions }
YavuEnvironment class >> bePersistent [

	self systemClass: YavuPersistentSubsystem 
]

{ #category : #'as yet unclassified' }
YavuEnvironment class >> beTransient [

	self systemClass: YavuTransientSubsystem
]

{ #category : #adding }
YavuEnvironment class >> currentSystem [

	CurrentSystem ifNil: [ CurrentSystem := self newSystem ].
	^CurrentSystem
	
]

{ #category : #'as yet unclassified' }
YavuEnvironment class >> initialize [
	super initialize.
	self beTransient 
]

{ #category : #'as yet unclassified' }
YavuEnvironment class >> newSystem [

	^CurrentSystemClass new
]

{ #category : #'as yet unclassified' }
YavuEnvironment class >> systemClass: aYavuSystem [

	CurrentSystem := nil.
	^CurrentSystemClass := aYavuSystem
	
]
