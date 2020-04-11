Class {
	#name : #YavuSecurityFunction,
	#superclass : #YvEntity,
	#instVars : [
		'yavuObjectClass'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
YavuSecurityFunction class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Función de Seguridad'
]

{ #category : #'sin categoria' }
YavuSecurityFunction >> yavuObjectClass [
	^ yavuObjectClass
]

{ #category : #'sin categoria' }
YavuSecurityFunction >> yavuObjectClass: anObject [
	yavuObjectClass := anObject
]

{ #category : #'sin categoria' }
YavuSecurityFunction >> yavuObjectClassLiteral [
	"Answer the presenterClass instance variable contents in a BD compatible format."
	
	^self yavuObjectClass asSQLLiteral
]

{ #category : #'sin categoria' }
YavuSecurityFunction >> yavuObjectClassLiteral: aLiteral [
	"Set the presenterClass instance variable from aLiteral."
	
	^self yavuObjectClass: (Smalltalk at: aLiteral asSymbol ifAbsent: [])
]
