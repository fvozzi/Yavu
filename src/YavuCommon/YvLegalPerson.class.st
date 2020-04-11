Class {
	#name : #YvLegalPerson,
	#superclass : #YvPerson,
	#category : #'YavuCommon-Entities'
}

{ #category : #'sin categoria' }
YvLegalPerson class >> cuitNumberOf: unNumeroDeDocumento [
	"Devuelve el numero de cuit correspondiente a unNumeroDeDocumento y a la clase del receptor."
	
	^unNumeroDeDocumento
]

{ #category : #'sin categoria' }
YvLegalPerson class >> descripcionNombre [
	
	^'Descripción'
]

{ #category : #'sin categoria' }
YvLegalPerson class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Persona Jurídica'
]

{ #category : #'sin categoria' }
YvLegalPerson class >> nombre: unNombre cuit: unNumeroCUIT [
	"Devuelve una nueva instancia del receptor."
	
	^(self named: unNombre) inicializarCUIT: unNumeroCUIT
]

{ #category : #'as yet unclassified' }
YvLegalPerson class >> possibleSearchSelectors [

	^super possibleSearchSelectors 
		at: 'CUIT' put: #cuit;
		yourself
]

{ #category : #'as yet unclassified' }
YvLegalPerson >> cuitDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #cuit;
		label: 'N° CUIT';
		priority: 120;
		required: true;
		yourself
]

{ #category : #'sin categoria' }
YvLegalPerson >> customerType [

	^'O'
]

{ #category : #'as yet unclassified' }
YvLegalPerson >> dni [
	
^''
]

{ #category : #'sin categoria' }
YvLegalPerson >> documentNumber [
	"Devuelve el numero de documento del receptor."
	
	^self cuit
]

{ #category : #'as yet unclassified' }
YvLegalPerson >> inicializarCUIT [
]

{ #category : #'sin categoria' }
YvLegalPerson >> inicializarCUIT: unNumeroDeCUIT [

	cuit:= unNumeroDeCUIT 
]

{ #category : #'sin categoria' }
YvLegalPerson >> sex [

	^self customerType
]

{ #category : #'sin categoria' }
YvLegalPerson >> tipoDocumento [

	^'CUIT'
]
