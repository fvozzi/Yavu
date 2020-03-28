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
SimpleMenuElement >> renderContentOn: html [
	"Render the receiver on aWASICMenu."
	
	self halt
]

{ #category : #'sin categoria' }
SimpleMenuElement >> renderContentOn: html on: aWASICMenu [
	"Render the receiver on aWASICMenu."
	
	self halt.
	aWASICMenu renderSimpleMenuElement: self on: html
]
