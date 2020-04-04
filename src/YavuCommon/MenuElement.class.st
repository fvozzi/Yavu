Class {
	#name : #MenuElement,
	#superclass : #Entity,
	#instVars : [
		'presenterClass',
		'subsystem'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'sin categoria' }
MenuElement class >> label: aMenuLabel presenterClass: aWAPresenterClass subsystem: aYavuSubsystem [
	"Answer a new receiver instance initialized with aMenuLabel and aWAPresenterClass."
	
	^(self name: aMenuLabel) initializePresenterClass: aWAPresenterClass subsystem: aYavuSubsystem 
]

{ #category : #'sin categoria' }
MenuElement class >> selectableMenuElements [
	"Answer all the receiver instances that could be used to asign to a role."

	^CompositeMenuElement all, (SimpleMenuElement all select: [:each | each parent getValue isNil])
]

{ #category : #'sin categoria' }
MenuElement >> initializePresenterClass: aWAPresenterClass subsystem: aYavuSubsystem [ 
	"Initialize the receiver's instances variables label and presenterClass with aMenuLabel and aWAPresenterClass."
 
	presenterClass := aWAPresenterClass.
	subsystem  := aYavuSubsystem
]

{ #category : #accessing }
MenuElement >> isHomeMenu [
	
	^self name = 'Inicio'
]

{ #category : #'sin categoria' }
MenuElement >> label [
	"Answer the receiver instance variable contents."
	
	^self name
]

{ #category : #'sin categoria' }
MenuElement >> presenterClass [
	"Answer the receiver presenterClass instance variable contents." 

	^presenterClass
]

{ #category : #'sin categoria' }
MenuElement >> presenterClass: aClass [
	"Set the receiver presenterClass instance variable contents with aClass." 

	presenterClass:= aClass 
]

{ #category : #'sin categoria' }
MenuElement >> presenterClassLiteral [
	"Answer the presenterClass instance variable contents in a BD compatible format."
	
	^self presenterClass asSQLLiteral
]

{ #category : #'sin categoria' }
MenuElement >> presenterClassLiteral: aLiteral [
	"Set the presenterClass instance variable from aLiteral."
	
	^self presenterClass: (Smalltalk at: aLiteral asSymbol ifAbsent: [])
]

{ #category : #'as yet unclassified' }
MenuElement >> presenterView [

	 ^ presenterClass on: subsystem 
]

{ #category : #'sin categoria' }
MenuElement >> printOn: aStream [ 
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	
	aStream nextPutAll: self label

]

{ #category : #'as yet unclassified' }
MenuElement >> subsystem [
	^ subsystem
]
