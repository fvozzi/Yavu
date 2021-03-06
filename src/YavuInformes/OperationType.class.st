Class {
	#name : #OperationType,
	#superclass : #YavuEntity,
	#instVars : [
		'code'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
OperationType class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Tipo de Operación'
]

{ #category : #'sin categoria' }
OperationType class >> name: aName code: aCode [
	"Devuelve una nueva instancia del receptor inicializada con nombre igual a aName y codigo igual a aCode."
	
	^(self name: aName) initializeCode: aCode
]

{ #category : #'sin categoria' }
OperationType >> = otraEntidad [
	"Answer whether the receiver is equal to the argument."
	
	^super = otraEntidad and: [self code = otraEntidad code]
]

{ #category : #'sin categoria' }
OperationType >> code [

	^code
]

{ #category : #'sin categoria' }
OperationType >> code: unCodigo [
	"Setea la variable de instancia codigo del receptor con unCodigo. 
	NOTA: preferentemente usar el constructor de clase nombre:codigo: este setear es para magritte."

	code:= unCodigo
]

{ #category : #'sin categoria' }
OperationType >> descriptionCode [
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
OperationType >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity."
	
	^super hash bitXor: self code hash

]

{ #category : #'sin categoria' }
OperationType >> initializeCode: unCodigo [

	code:= unCodigo
]
