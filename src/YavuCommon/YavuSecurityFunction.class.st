"
Not used at the moment.
The idea is that when the system needs a more complex security we introduce the security function in order to allow the developer configure the users secutiry with more flexibility.
"
Class {
	#name : #YavuSecurityFunction,
	#superclass : #YavuEntity,
	#instVars : [
		'yavuObjectClass'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'sin categoria' }
YavuSecurityFunction class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Función de Seguridad'
]

{ #category : #accessing }
YavuSecurityFunction >> yavuObjectClass [
	^ yavuObjectClass
]

{ #category : #accessing }
YavuSecurityFunction >> yavuObjectClass: anObject [
	yavuObjectClass := anObject
]
