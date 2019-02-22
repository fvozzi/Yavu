Class {
	#name : #SecurityFunction,
	#superclass : #Entity,
	#instVars : [
		'yavuObjectClass'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
SecurityFunction class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Función de Seguridad'
]

{ #category : #'sin categoria' }
SecurityFunction >> yavuObjectClass [
	^ yavuObjectClass
]

{ #category : #'sin categoria' }
SecurityFunction >> yavuObjectClass: anObject [
	yavuObjectClass := anObject
]

{ #category : #'sin categoria' }
SecurityFunction >> yavuObjectClassLiteral [
	"Answer the presenterClass instance variable contents in a BD compatible format."
	
	^self yavuObjectClass asSQLLiteral
]

{ #category : #'sin categoria' }
SecurityFunction >> yavuObjectClassLiteral: aLiteral [
	"Set the presenterClass instance variable from aLiteral."
	
	^self yavuObjectClass: (Smalltalk at: aLiteral asSymbol ifAbsent: [])
]
