Class {
	#name : #MenuElement,
	#superclass : #Entity,
	#instVars : [
		'presenterClass'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
MenuElement class >> label: aMenuLabel presenterClass: aWAPresenterClass [
	"Answer a new receiver instance initialized with aMenuLabel and aWAPresenterClass."
	
	^(self name: aMenuLabel) initializePresenterClass: aWAPresenterClass
]

{ #category : #'sin categoria' }
MenuElement class >> selectableMenuElements [
	"Answer all the receiver instances that could be used to asign to a role."

	^CompositeMenuElement all, (SimpleMenuElement all select: [:each | each parent getValue isNil])
]

{ #category : #'sin categoria' }
MenuElement >> initializePresenterClass: aWAPresenterClass [
	"Initialize the receiver's instances variables label and presenterClass with aMenuLabel and aWAPresenterClass."
 
	presenterClass := aWAPresenterClass
]

{ #category : #accessing }
MenuElement >> isHomeMenu [
	
	^self name = 'Inicio'
]

{ #category : #'as yet unclassified' }
MenuElement >> isRoot [
	"Responde true si el receptor no tiene parent."

	^false
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

{ #category : #'sin categoria' }
MenuElement >> printOn: aStream [ 
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	
	aStream nextPutAll: self label

]

{ #category : #'sin categoria' }
MenuElement >> renderContentOn: html on: aWASICMenu [
	"Render the receiver on aWASICMenu."
	
	self subclassResponsibility
]
