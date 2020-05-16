Class {
	#name : #YavuMenuElement,
	#superclass : #YavuEntity,
	#instVars : [
		'presenterClass',
		'subsystem'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'sin categoria' }
YavuMenuElement class >> label: aMenuLabel presenterClass: aWAPresenterClass subsystem: aYavuSubsystem [
	"Answer a new receiver instance initialized with aMenuLabel and aWAPresenterClass."
	
	^(self name: aMenuLabel) initializePresenterClass: aWAPresenterClass subsystem: aYavuSubsystem 
]

{ #category : #'sin categoria' }
YavuMenuElement class >> selectableMenuElements [
	"Answer all the receiver instances that could be used to asign to a role."

	^YavuCompositeMenuElement all, (YavuSimpleMenuElement all select: [:each | each parent getValue isNil])
]

{ #category : #'sin categoria' }
YavuMenuElement >> initializePresenterClass: aWAPresenterClass subsystem: aYavuSubsystem [ 
	"Initialize the receiver's instances variables label and presenterClass with aMenuLabel and aWAPresenterClass."
 
	presenterClass := aWAPresenterClass.
	subsystem  := aYavuSubsystem
]

{ #category : #accessing }
YavuMenuElement >> isHomeMenu [
	
	^self name = 'Inicio'
]

{ #category : #'sin categoria' }
YavuMenuElement >> label [
	"Answer the receiver instance variable contents."
	
	^self name
]

{ #category : #'sin categoria' }
YavuMenuElement >> presenterClass [
	"Answer the receiver presenterClass instance variable contents." 

	^presenterClass
]

{ #category : #'sin categoria' }
YavuMenuElement >> presenterClass: aClass [
	"Set the receiver presenterClass instance variable contents with aClass." 

	presenterClass:= aClass 
]

{ #category : #'sin categoria' }
YavuMenuElement >> presenterClassLiteral [
	"Answer the presenterClass instance variable contents in a BD compatible format."
	
	^self presenterClass asSQLLiteral
]

{ #category : #'sin categoria' }
YavuMenuElement >> presenterClassLiteral: aLiteral [
	"Set the presenterClass instance variable from aLiteral."
	
	^self presenterClass: (Smalltalk at: aLiteral asSymbol ifAbsent: [])
]

{ #category : #'as yet unclassified' }
YavuMenuElement >> presenterView [

	 ^ presenterClass on: subsystem 
]

{ #category : #'sin categoria' }
YavuMenuElement >> printOn: aStream [ 
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	
	aStream 
		nextPutAll: self subsystem subsystemName;
		nextPutAll: ' | ';
		nextPutAll: self label
]

{ #category : #'as yet unclassified' }
YavuMenuElement >> subsystem [
	^ subsystem
]
