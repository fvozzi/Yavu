"
An AmountOfDebt is un tipo de situación donde el comercio informa el monto de la deuda a la fecha de la novedad. Es decir, en este tipo no se requiere baja explicita sino simplemete ir actualizando la deuda mensualmente o cada vez que el cliente pague. Cuando el comercio informe que la deuda es cero, se considerara saldada la deuda.
"
Class {
	#name : #AmountOfDebt,
	#superclass : #FinancialSituationType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
AmountOfDebt class >> financialSituationDescriptionCSSLabel [
	
	^'deuda'
]

{ #category : #'as yet unclassified' }
AmountOfDebt class >> financialSituationDescriptionCSSLabelFor: aFinancialSituation [
	
	^(aFinancialSituation montoAdeudado ifNil: [0]) > 0 ifTrue: ['deuda'] ifFalse: [ 'desafectado' ]
]

{ #category : #'as yet unclassified' }
AmountOfDebt class >> financialSituationDescriptionFor: aFinancialSituation [ 
	
	^aFinancialSituation montoAdeudado ifNil: [ '-' ]
]

{ #category : #'as yet unclassified' }
AmountOfDebt class >> financialSituationNula [
	
	^FinancialSituation nula amountOfDebt: nil; type: self; yourself
]

{ #category : #accessing }
AmountOfDebt class >> labelForButton [
	
	^'Agregar DEUDA'
]
