Class {
	#name : #ElementoDeResumenSituacionComercial,
	#superclass : #YavuObject,
	#instVars : [
		'situacionComercial',
		'situacionesAnteriores'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial class >> paraSituaciones: unasSituaciones desdeFecha: unaFecha [
	| situacionesOrdenadas situacionVigente situacionesPorMes |
	situacionesPorMes := Dictionary new.
	situacionesOrdenadas := (unasSituaciones asSortedCollection: [ :a :b | a fechaUltimoPago < b fechaUltimoPago ])
		asOrderedCollection reverse.
	situacionVigente := situacionesOrdenadas first.
	1 to: 12 do: [ :each | 
		| eachMonth situacion |
		eachMonth := unaFecha addMonths: each negated.
		situacion := situacionesOrdenadas detect: [ :one | one fechaUltimoPago beginOfMonth = eachMonth beginOfMonth ] ifNone: [  ].
		situacion ifNil: [ situacion := self searchCurrentDebt: situacionesOrdenadas from: eachMonth ].
		situacionesPorMes at: eachMonth endOfMonth put: situacion ].
	"Hay que refactorizar.
	Hay situaciones que no tienen deuda informada, entonces el vigente solo tiene sentido si es para la fecha del reporte."
	(situacionVigente onlyMonthlyDebt and: [ situacionVigente fechaUltimoPago ~= unaFecha beginOfMonth]) ifTrue: [ 
		situacionVigente := situacionVigente copy amountOfDebt: 0 ].
	^ self situacion: situacionVigente situacionesAnteriores: situacionesPorMes
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial class >> searchCurrentDebt: situacionesOrdenadas from: eachMonth [

	| type |
	
	type:= situacionesOrdenadas ifNotEmpty: [ :each | each first type].
	^ situacionesOrdenadas
		detect: [ :one | one fechaUltimoPago < eachMonth endOfMonth and: [ one onlyMonthlyDebt not ] ]
		ifNone: [ type financialSituationNula ]
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial class >> situacion: unaSituacionComercial situacionesAnteriores: unaColeccion [
	
	^self new inicializarSituacion: unaSituacionComercial situacionesAnteriores: unaColeccion
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial >> comercio [

	^self situacionComercial comercio
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial >> fechaUltimoPago [

	^self situacionComercial fechaUltimoPago
]

{ #category : #accessing }
ElementoDeResumenSituacionComercial >> financialSituationDescription [
	
	^self situacionComercial financialSituationDescription
]

{ #category : #accessing }
ElementoDeResumenSituacionComercial >> financialSituationDescriptionCSSLabel [
	
	^self situacionComercial financialSituationDescriptionCSSLabel 
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial >> inicializarSituacion: unaSituacionComercial situacionesAnteriores: unaColeccion [

	situacionComercial:= unaSituacionComercial.
	situacionesAnteriores:= unaColeccion
]

{ #category : #accessing }
ElementoDeResumenSituacionComercial >> inputAmountOfDebt [
	
	^self situacionComercial type inputAmountOfDebt 
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial >> montoAdeudado [

	^self situacionComercial montoAdeudado
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial >> operationCharacter [

	^self situacionComercial operationCharacter
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial >> operationType [

	^self situacionComercial operationType
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial >> situacionComercial [
	
	^situacionComercial
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial >> situacionDeMes: unaFecha [

	^self situacionesAnteriores at: unaFecha endOfMonth
]

{ #category : #'sin categoria' }
ElementoDeResumenSituacionComercial >> situacionesAnteriores [

	^situacionesAnteriores
]

{ #category : #'sin categoria' }
ElementoDeResumenSituacionComercial >> situacionesAnterioresOrdenadas [

	^(self situacionesAnteriores keys asSortedCollection: [:a :b | a > b])
		inject: OrderedCollection new 
		into: [:accum :each | accum add: (self situacionesAnteriores at: each); yourself]
]

{ #category : #'as yet unclassified' }
ElementoDeResumenSituacionComercial >> type [

	^self situacionComercial type
]
