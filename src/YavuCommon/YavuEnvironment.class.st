Class {
	#name : #YavuEnvironment,
	#superclass : #Object,
	#classVars : [
		'Current',
		'CurrentSystem',
		'CurrentSystemClass'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #adding }
YavuEnvironment class >> beCurrent [

	Current := self
]

{ #category : #actions }
YavuEnvironment class >> bePersistent [

	self systemClass: YavuPersistentSubsystem 
]

{ #category : #'as yet unclassified' }
YavuEnvironment class >> beTransient [

	self systemClass: YavuTransientSubsystem
]

{ #category : #adding }
YavuEnvironment class >> current [

	Current ifNil: [ Current := self ].
	^Current
	
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
YavuEnvironment class >> mongoDatabaseName [

 ^ CurrentSystemClass mongoDatabaseName
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

{ #category : #'as yet unclassified' }
YavuEnvironment >> jqLibrary [
	
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
YavuEnvironment >> seasideApplicationName [
	
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
YavuEnvironment >> tbsLibrary [
	
	^ self subclassResponsibility 
]
