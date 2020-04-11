Class {
	#name : #YavuSimpleMenuElement,
	#superclass : #YavuMenuElement,
	#instVars : [
		'parent'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'sin categoria' }
YavuSimpleMenuElement >> parent [
	^ parent
]

{ #category : #'sin categoria' }
YavuSimpleMenuElement >> parent: anObject [
	parent := anObject
]

{ #category : #'sin categoria' }
YavuSimpleMenuElement >> renderContentOn: html [
	"Render the receiver on aWASICMenu."
	
	self halt
]

{ #category : #'sin categoria' }
YavuSimpleMenuElement >> renderContentOn: html on: aWASICMenu [
	"Render the receiver on aWASICMenu."
	
	self halt.
	aWASICMenu renderSimpleMenuElement: self on: html
]
