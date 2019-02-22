"
A MonthlyDebt es una situación que vale por el mes en curso. Es decir, si alguien que fue informado en el mes de Enero continua debiendo en febrero deberá volver a informarse en ese mes porque sino saldrá de la deuda automaticamente. Es decir, con este tipo de situación financiera no se requiere la baja o desafectación de la deuda.
"
Class {
	#name : #MonthlyDebt,
	#superclass : #FinancialSituationType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
MonthlyDebt class >> financialSituationDescriptionCSSLabelFor: aFinancialSituation [ 
	"Devuelve la descripcion. En este tipo de situación solo debe verse en el informe el mes en el que fue informado y no en otro.
	
	NOTA: la condición montoAdeudado = 0 es un hack para que no muestre nada como vigente. Es para que funcione la ultima parte del codigo de este metodo: #paraSituaciones:desdeFecha:"
	
	^(aFinancialSituation esNula or: [aFinancialSituation montoAdeudado = 0 ]) ifTrue: [ 'desafectado' ] ifFalse: [ 'debe' ]
]

{ #category : #'as yet unclassified' }
MonthlyDebt class >> financialSituationDescriptionFor: aFinancialSituation [ 
	"Devuelve la descripcion. En este tipo de situación solo debe verse en el informe el mes en el que fue informado y no en otro.
	
	NOTA: la condición montoAdeudado = 0 es un hack para que no muestre nada como vigente. Es para que funcione la ultima parte del codigo de este metodo: #paraSituaciones:desdeFecha:"
	
	^(aFinancialSituation esNula or: [aFinancialSituation montoAdeudado = 0 ]) ifTrue: [ '-' ] ifFalse: [ 'Debe' ]
]

{ #category : #accessing }
MonthlyDebt class >> financialSituationNula [
	
	^FinancialSituation nula type: self; yourself
]

{ #category : #accessing }
MonthlyDebt class >> labelForButton [
	
	^'DEBE'
]

{ #category : #'as yet unclassified' }
MonthlyDebt class >> onlyMonthlyDebt [
	^true
]
