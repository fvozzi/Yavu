Class {
	#name : #YavuSimpleMenuElement,
	#superclass : #YavuMenuElement,
	#instVars : [
		'parent'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #comparing }
YavuSimpleMenuElement >> = anotherMenu [

	self class = anotherMenu class	ifFalse: [ ^ false ].
	^ self name = anotherMenu name & (self subsystem = anotherMenu subsystem)

	
]

{ #category : #comparing }
YavuSimpleMenuElement >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self name hash bitXor: self subsystem hash

	
]

{ #category : #'sin categoria' }
YavuSimpleMenuElement >> parent [
	^ parent
]

{ #category : #'sin categoria' }
YavuSimpleMenuElement >> parent: anObject [
	parent := anObject
]
