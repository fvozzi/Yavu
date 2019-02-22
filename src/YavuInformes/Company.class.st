Class {
	#name : #Company,
	#superclass : #Entity,
	#instVars : [
		'commerces',
		'packagesOfReports'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
Company class >> default [ 
	"Devuelve la camara de Junín para el lanzamiento. Esto va a ser reemplazado por el login sin usuarios."
	
	^self atID: 2
]

{ #category : #'sin categoria' }
Company class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Compania'
]

{ #category : #'as yet unclassified' }
Company >> addUser: aSicUser [ 

	users add: aSicUser
]

{ #category : #'sin categoria' }
Company >> commerces [
	^Commerce all select: [:each | each company = self]
]

{ #category : #'sin categoria' }
Company >> eliminarComercio: unComercio [

	self commerces remove: unComercio
]

{ #category : #'sin categoria' }
Company >> eliminarUsuario: unUsuario [

	self users remove: unUsuario
]

{ #category : #'as yet unclassified' }
Company >> existsUser: aSicUser [
	^ (users detect: [ :one | one name = aSicUser name and: [ one password = aSicUser password ] ] ifNone: [  ]) notNil
]

{ #category : #accessing }
Company >> importerClass [

	"Por ahora lo refactorizamos pero esto tiene que poder configurase en la compania."
	
	self id = 2 ifTrue: [ ^FixedWidthFileImporter ].
	^ImportadorDeInformes
]

{ #category : #'as yet unclassified' }
Company >> initialize [

	super initialize.
	commerces := OrderedCollection new.
	packagesOfReports := OrderedCollection new.
	users := OrderedCollection new
	"self crearUsuarioAdministrador"
]

{ #category : #'sin categoria' }
Company >> packagesOfReports [

	^packagesOfReports
]

{ #category : #'sin categoria' }
Company >> packagesOfReports: unaColeccion [

	packagesOfReports:= unaColeccion
]

{ #category : #'sin categoria' }
Company >> userOfName: aName password: aPassword [

	^self users detect: [:one | one name asUppercase = aName asUppercase and: [one password = aPassword]] ifNone: []
]

{ #category : #'sin categoria' }
Company >> users [

	^(self yavuSystem readManyOf: SicUser where: [:each | each company  = self]) asOrderedCollection
]
