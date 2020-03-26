Class {
	#name : #SimpleMenuElement,
	#superclass : #MenuElement,
	#instVars : [
		'parent'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'sin categoria' }
SimpleMenuElement >> parent [
	^ parent
]

{ #category : #'sin categoria' }
SimpleMenuElement >> parent: anObject [
	parent := anObject
]

{ #category : #'sin categoria' }
SimpleMenuElement >> renderContentOn: html on: aWASICMenu [
	"Render the receiver on aWASICMenu."
	
	aWASICMenu renderSimpleMenuElement: self on: html
]
