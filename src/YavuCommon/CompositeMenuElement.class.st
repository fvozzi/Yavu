Class {
	#name : #CompositeMenuElement,
	#superclass : #MenuElement,
	#instVars : [
		'subMenues'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'sin categoria' }
CompositeMenuElement >> addSubMenu: aMenuElement [
	"Add aMenuElement to the receiver subMenues elements."
	
	^self subMenues add: (aMenuElement parent: self)
]

{ #category : #'as yet unclassified' }
CompositeMenuElement >> initializeSubmenues [
	
	subMenues := (SimpleMenuElement all select: [:each | each parent = self]) asSortedCollection  
]

{ #category : #'as yet unclassified' }
CompositeMenuElement >> isRoot [
	"Responde true si el receptor no tiene parent."

	^true
]

{ #category : #'sin categoria' }
CompositeMenuElement >> renderContentOn: html on: aWASICMenu [
	"Render the receiver on aWASICMenu."
	
	aWASICMenu renderCompositeMenuElement: self on: html
]

{ #category : #'sin categoria' }
CompositeMenuElement >> store [
	"Persiste la instancia del receptor en la BD."
	
	super store.
	self subMenues do: [:each | each store]
]

{ #category : #'sin categoria' }
CompositeMenuElement >> subMenues [
	"Answer the receiver subMenues instance variable content."
	
	subMenues ifNil: [self initializeSubmenues].
	^subMenues
]
