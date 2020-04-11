Class {
	#name : #BCRAData,
	#superclass : #YavuTransaction,
	#instVars : [
		'bcraDebts',
		'bcraPersonalChecks',
		'bcraSocietyChecks'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
BCRAData class >> entityClass [
	
	^YavuPerson
]

{ #category : #'as yet unclassified' }
BCRAData class >> entityLabel [

	^'Descripcion'
]

{ #category : #'as yet unclassified' }
BCRAData >> addDebt: aBCRADebtElement [ 

	bcraDebts add: aBCRADebtElement 
]

{ #category : #'as yet unclassified' }
BCRAData >> addPersonalCheck: aBCRAPersonalCheck [ 

	bcraPersonalChecks add: aBCRAPersonalCheck 
]

{ #category : #'as yet unclassified' }
BCRAData >> addSocietyCheck: aBCRASocietyCheck [ 

	bcraSocietyChecks add: aBCRASocietyCheck 
]

{ #category : #'as yet unclassified' }
BCRAData >> bcraDebts [

	^bcraDebts
]

{ #category : #'as yet unclassified' }
BCRAData >> bcraPersonalChecks [

	^bcraPersonalChecks 
]

{ #category : #'as yet unclassified' }
BCRAData >> bcraSocietyChecks [

	^bcraSocietyChecks 
]

{ #category : #'as yet unclassified' }
BCRAData >> debtElementsCount [

	^bcraDebts size
]

{ #category : #'as yet unclassified' }
BCRAData >> existsDebtFor: aDescription [

	^bcraDebts detect: [ :one | one denomination = aDescription ] ifNone: [  ]
]

{ #category : #'as yet unclassified' }
BCRAData >> hasAnyData [

	^self bcraDebts notEmpty or: [ self bcraPersonalChecks notEmpty or: [ self bcraSocietyChecks notEmpty ] ]
]

{ #category : #'as yet unclassified' }
BCRAData >> hasCategoryGreaterThanTwo [
	"Devuelve true si el receptor solo tiene deudas con categorias 3, 4 o 5."
	
	| maxCategory |
	
	maxCategory := 0.
	self bcraDebts do: [ :each |
		maxCategory := maxCategory max: ([(each at: 'Situacion') asNumber] on: Error do: [ :ex | 0 ] )].
	^maxCategory > 2
]

{ #category : #'as yet unclassified' }
BCRAData >> hasCategoryOneOrTwo [
	"Devuelve true si el receptor solo tiene deudas con categorias 1 y 2."
	
	| maxCategory |
	
	maxCategory := 0.
	self bcraDebts do: [ :each |
		maxCategory := maxCategory max: ([each situation asNumber] on: Error do: [ :ex | 0 ] )].
	^(maxCategory = 1) or: [maxCategory = 2]
]

{ #category : #'as yet unclassified' }
BCRAData >> hasChecksBounced [

	^self bcraPersonalChecks notEmpty | self bcraSocietyChecks notEmpty
]

{ #category : #'as yet unclassified' }
BCRAData >> hasDebtElements [

	^bcraDebts notEmpty 
]

{ #category : #'as yet unclassified' }
BCRAData >> hasNotInformation [
	"Devuelve true si el receptor no tiene deudas informadas."
	
	^self bcraDebts isEmpty
]

{ #category : #'as yet unclassified' }
BCRAData >> initialize [ 
	
	super initialize.
	bcraDebts := OrderedCollection new.
	bcraPersonalChecks := OrderedCollection new.
	bcraSocietyChecks := OrderedCollection new
]
