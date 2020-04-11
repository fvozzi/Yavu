Class {
	#name : #Organization,
	#superclass : #CustomerType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
Organization class >> code [
	"Devuelve el codigo de clase del receptor."

	^'O'
]

{ #category : #testing }
Organization class >> correspondeA: xy [
	"Devuelve true si xy es un posible xy de la clase del receptor."
	
	^xy asNumber >= 30
]

{ #category : #accessing }
Organization class >> cuitNumberOf: unNumeroDeDocumento [
	"Devuelve el numero de cuit correspondiente a unNumeroDeDocumento y a la clase del receptor."
	
	^(YvCUIT cuit: unNumeroDeDocumento) cuit
]

{ #category : #accessing }
Organization class >> documentoSegunCUIT: unNumeroDeCuitOCuil [
	"Devuelve el numero de documento del tipo del receptor según unNumeroDeCuitOCuil."
	
	^unNumeroDeCuitOCuil
]

{ #category : #testing }
Organization class >> isOrganization [

	^true
]

{ #category : #accessing }
Organization class >> label [

	^'Organización'
]

{ #category : #'instance creation' }
Organization class >> newCustomerOfNumber: unNumeroDeDocumento name: unNombre [
	"Devuelve un nuevo cliente según el tipo del receptor."
	
	^YavuLegalPerson nombre: unNombre cuit: unNumeroDeDocumento
]

{ #category : #accessing }
Organization class >> xy [
	"Devuelve el valor de xy usado en el calculo del numero de cuit."
	
	^'30'
]
