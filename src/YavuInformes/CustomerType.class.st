Class {
	#name : #CustomerType,
	#superclass : #Entity,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
CustomerType class >> all [
	"Devuelve todas las intancias del receptor en el sistema."
	
	^self tiposDeClientes
]

{ #category : #accessing }
CustomerType class >> allDeclaredTypes [

	^self subclasses reject: [ :each | each isNotDeclared  ]
]

{ #category : #accessing }
CustomerType class >> allNaturalPersonsTypes [

	^self subclasses reject: [ :each | each isOrganization ]
]

{ #category : #accessing }
CustomerType class >> atCodigo: unCodigo [
	"Devuelve una subclase del receptor con codigo = unCodigo o nil."
	
	^self subclasses detect: [:each | each code = unCodigo] ifNone: []
]

{ #category : #accessing }
CustomerType class >> code [
	"Devuelve el codigo de clase del receptor."

	^self subclassResponsibility
]

{ #category : #testing }
CustomerType class >> correspondeA: xy [
	"Devuelve true si xy es un posible xy de la clase del receptor."
	
	self subclassResponsibility
]

{ #category : #accessing }
CustomerType class >> cuitNumberOf: unNumeroDeDocumento [
	"Devuelve el numero de cuit correspondiente a unNumeroDeDocumento y a la clase del receptor."
	
	^(CUIT dni: unNumeroDeDocumento tipo: self ) cuit
]

{ #category : #accessing }
CustomerType class >> documentoSegunCUIT: unNumeroDeCuitOCuil [
	"Devuelve el numero de documento del tipo del receptor según unNumeroDeCuitOCuil."
	
	^(unNumeroDeCuitOCuil copyFrom: 3 to: 10) trimLeft: [:each | each = $0]
]

{ #category : #testing }
CustomerType class >> isNotDeclared [

	^false
]

{ #category : #testing }
CustomerType class >> isOrganization [

	^false
]

{ #category : #'instance creation' }
CustomerType class >> newCustomerOfNumber: unNumeroDeDocumento [
	"Devuelve un nuevo cliente según el tipo del receptor."
	
	^self newCustomerOfNumber: unNumeroDeDocumento name: ''
]

{ #category : #'instance creation' }
CustomerType class >> newCustomerOfNumber: unNumeroDeDocumento name: unNombre [
	"Devuelve un nuevo cliente según el tipo del receptor."
	
	^NaturalPerson nombre: unNombre dni: unNumeroDeDocumento sexo: self code
]

{ #category : #accessing }
CustomerType class >> tipoSegunCUIT: unNumeroDeCUIT [
	"Devuelve el tipo de cliente según el número de CUIT o CUIL. Si comienza con 27 es femenino, si comienza con 30 o mayor es Organizacion y sino es Masculino."
	
	| xy |
	xy := unNumeroDeCUIT  copyFrom: 1 to: 2.
	^self subclasses detect: [:one | one correspondeA: xy]
]

{ #category : #accessing }
CustomerType class >> tiposDeClientes [
	"Devuelve una coleccion con las subclasses del receptor."
	
	^self subclasses
]

{ #category : #accessing }
CustomerType class >> xy [
	"Devuelve el valor de xy usado en el calculo del numero de cuit."
	
	^self subclassResponsibility
]

{ #category : #'sin categoria' }
CustomerType >> code [
	"Devuelve el codigo de clase del receptor."

	^self class code
]
