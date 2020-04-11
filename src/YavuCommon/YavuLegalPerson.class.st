Class {
	#name : #YavuLegalPerson,
	#superclass : #YavuPerson,
	#category : #'YavuCommon-Entities'
}

{ #category : #'sin categoria' }
YavuLegalPerson class >> cuitNumberOf: unNumeroDeDocumento [
	"Devuelve el numero de cuit correspondiente a unNumeroDeDocumento y a la clase del receptor."
	
	^unNumeroDeDocumento
]

{ #category : #'sin categoria' }
YavuLegalPerson class >> descripcionNombre [
	
	^'Descripción'
]

{ #category : #'sin categoria' }
YavuLegalPerson class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Persona Jurídica'
]

{ #category : #'sin categoria' }
YavuLegalPerson class >> nombre: unNombre cuit: unNumeroCUIT [
	"Devuelve una nueva instancia del receptor."
	
	^(self named: unNombre) inicializarCUIT: unNumeroCUIT
]

{ #category : #'as yet unclassified' }
YavuLegalPerson class >> possibleSearchSelectors [

	^super possibleSearchSelectors 
		at: 'CUIT' put: #cuit;
		yourself
]

{ #category : #'as yet unclassified' }
YavuLegalPerson >> cuitDescription [
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
YavuLegalPerson >> customerType [

	^'O'
]

{ #category : #'as yet unclassified' }
YavuLegalPerson >> dni [
	
^''
]

{ #category : #'sin categoria' }
YavuLegalPerson >> documentNumber [
	"Devuelve el numero de documento del receptor."
	
	^self cuit
]

{ #category : #'as yet unclassified' }
YavuLegalPerson >> inicializarCUIT [
]

{ #category : #'sin categoria' }
YavuLegalPerson >> inicializarCUIT: unNumeroDeCUIT [

	cuit:= unNumeroDeCUIT 
]

{ #category : #'sin categoria' }
YavuLegalPerson >> sex [

	^self customerType
]

{ #category : #'sin categoria' }
YavuLegalPerson >> tipoDocumento [

	^'CUIT'
]
