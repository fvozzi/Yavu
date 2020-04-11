Class {
	#name : #OperationCharacter,
	#superclass : #YvEntity,
	#instVars : [
		'code'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
OperationCharacter class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Caracter en la operación'
]

{ #category : #'sin categoria' }
OperationCharacter class >> name: aName code: aCode [
	"Devuelve una nueva instancia del receptor inicializada con nombre igual a unNombre y codigo igual a unCodigo."
	
	^(self name: aName) initializeCode: aCode
]

{ #category : #'sin categoria' }
OperationCharacter >> = otraEntidad [
	"Answer whether the receiver is equal to the argument."
	
	^super = otraEntidad and: [self code = otraEntidad code]
]

{ #category : #'sin categoria' }
OperationCharacter >> code [ 

	^code
]

{ #category : #'sin categoria' }
OperationCharacter >> code: unCodigo [
	"Setea la variable de instancia codigo del receptor con unCodigo. 
	NOTA: preferentemente usar el constructor de clase nombre:codigo: este setear es para magritte."

	code:= unCodigo
]

{ #category : #'sin categoria' }
OperationCharacter >> descriptionCode [
	"Devuelve un objeto que describe la representación de la variable codigo del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #code;
        	label: 'Código';
        	priority: 110;
		required: true;
        	yourself
]

{ #category : #'sin categoria' }
OperationCharacter >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity."
	
	^super hash bitXor: self code hash

]

{ #category : #'sin categoria' }
OperationCharacter >> initializeCode: aCode [

	code:= aCode
]
