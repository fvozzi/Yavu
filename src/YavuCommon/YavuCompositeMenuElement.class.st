Class {
	#name : #YavuCompositeMenuElement,
	#superclass : #YavuMenuElement,
	#instVars : [
		'subMenues'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'sin categoria' }
YavuCompositeMenuElement >> addSubMenu: aMenuElement [
	"Add aMenuElement to the receiver subMenues elements."
	
	^self subMenues add: (aMenuElement parent: self)
]

{ #category : #'as yet unclassified' }
YavuCompositeMenuElement >> initializeSubmenues [
	
	subMenues := OrderedCollection new 
]

{ #category : #'as yet unclassified' }
YavuCompositeMenuElement >> isRoot [
	"Responde true si el receptor no tiene parent."

	^true
]

{ #category : #'sin categoria' }
YavuCompositeMenuElement >> renderContentOn: html on: aWASICMenu [
	"Render the receiver on aWASICMenu."

	aWASICMenu renderCompositeMenuElement: self on: html
]

{ #category : #'sin categoria' }
YavuCompositeMenuElement >> store [
	"Persiste la instancia del receptor en la BD."
	
	super store.
	self subMenues do: [:each | each store]
]

{ #category : #'sin categoria' }
YavuCompositeMenuElement >> subMenues [
	"Answer the receiver subMenues instance variable content."
	
	subMenues ifNil: [self initializeSubmenues].
	^subMenues
]

{ #category : #'As yet unclassified' }
YavuCompositeMenuElement >> subsystem [
	
	 ^'Yavu Prueba'
]
