Class {
	#name : #ResumenSituacionComercial,
	#superclass : #YavuTransaction,
	#instVars : [
		'elementos'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
ResumenSituacionComercial class >> on: aFinancialReport using: aTransientSystem [ 

	^self new on: aFinancialReport using: aTransientSystem 
]

{ #category : #'sin categoria' }
ResumenSituacionComercial >> elementos [

	^elementos
]

{ #category : #'as yet unclassified' }
ResumenSituacionComercial >> hasAnyDefault [

	^self elementos notEmpty


]

{ #category : #'as yet unclassified' }
ResumenSituacionComercial >> inicializarElementos: aFinancialSituations [

	| situacionesPorComercio |
	
	situacionesPorComercio := aFinancialSituations groupedBy: [:each | each customer cuit] andBy: [:each | each entity id printString, each operationType code, each operationCharacter code].
	elementos := OrderedCollection new.
	situacionesPorComercio do: [:situacionesPorTipo |
		elementos addAll: (situacionesPorTipo asOrderedCollection collect: [:situaciones | ElementoDeResumenSituacionComercial paraSituaciones: situaciones desdeFecha: self date])]
]

{ #category : #'sin categoria' }
ResumenSituacionComercial >> labelMesesAnteriores [

	| labels |  
	
	labels := OrderedCollection new.
	1 to: 12 do: [:i | labels add: (self date addMonths: i negated) endOfMonth monthAbbreviation].
	^labels
]

{ #category : #'as yet unclassified' }
ResumenSituacionComercial >> montoTotal [

	| total |
	
	total := (self elementos reject: [:each | each montoAdeudado isNil]) inject: 0 into: [:accum :each | accum + each montoAdeudado].
	^(total = 0 and: [(self elementos detect: [:each | each type inputAmountOfDebt not] ifNone: [  ]) notNil ])
		ifTrue: [-1]
		ifFalse: [total]
]

{ #category : #accessing }
ResumenSituacionComercial >> on: aFinancialReport using: aYavuSystem [ 
	
	self entity: aFinancialReport customer.
	self date: aFinancialReport date.
	self inicializarElementos: (aYavuSystem financialSituationsOf: self entity)
]
