Class {
	#name : #YavuProductPresentationUnit,
	#superclass : #YavuEntity,
	#instVars : [
		'kilograms'
	],
	#category : #'YavuPurchase-Model'
}

{ #category : #testing }
YavuProductPresentationUnit class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuProductPresentationUnit class >> label [ 

	 ^ 'Unidad de presentación'
]

{ #category : #accessing }
YavuProductPresentationUnit class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #'as yet unclassified' }
YavuProductPresentationUnit >> descriptionKilograms [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MANumberDescription new 
		accessor: #kilograms ;
		label: 'Kilos';
		priority: 110;
		beRequired;
		bePositive;
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #'sin categoria' }
YavuProductPresentationUnit >> initialize [ 

	kilograms := 1
]

{ #category : #accessing }
YavuProductPresentationUnit >> kilograms [

	^ kilograms
]

{ #category : #accessing }
YavuProductPresentationUnit >> kilograms: aNumber [

	kilograms := aNumber
]
