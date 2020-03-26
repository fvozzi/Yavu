Class {
	#name : #LegalPerson,
	#superclass : #Person,
	#category : #'YavuCommon-Entities'
}

{ #category : #'sin categoria' }
LegalPerson class >> cuitNumberOf: unNumeroDeDocumento [
	"Devuelve el numero de cuit correspondiente a unNumeroDeDocumento y a la clase del receptor."
	
	^unNumeroDeDocumento
]

{ #category : #'sin categoria' }
LegalPerson class >> descripcionNombre [
	
	^'Descripción'
]

{ #category : #'sin categoria' }
LegalPerson class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Persona Jurídica'
]

{ #category : #'sin categoria' }
LegalPerson class >> nombre: unNombre cuit: unNumeroCUIT [
	"Devuelve una nueva instancia del receptor."
	
	^(self named: unNombre) inicializarCUIT: unNumeroCUIT
]

{ #category : #'as yet unclassified' }
LegalPerson class >> possibleSearchSelectors [

	^super possibleSearchSelectors 
		at: 'CUIT' put: #cuit;
		yourself
]

{ #category : #'as yet unclassified' }
LegalPerson >> cuitDescription [
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
LegalPerson >> customerType [

	^'O'
]

{ #category : #'as yet unclassified' }
LegalPerson >> dni [
	
^''
]

{ #category : #'sin categoria' }
LegalPerson >> documentNumber [
	"Devuelve el numero de documento del receptor."
	
	^self cuit
]

{ #category : #'as yet unclassified' }
LegalPerson >> inicializarCUIT [
]

{ #category : #'sin categoria' }
LegalPerson >> inicializarCUIT: unNumeroDeCUIT [

	cuit:= unNumeroDeCUIT 
]

{ #category : #'sin categoria' }
LegalPerson >> sex [

	^self customerType
]

{ #category : #'sin categoria' }
LegalPerson >> tipoDocumento [

	^'CUIT'
]
