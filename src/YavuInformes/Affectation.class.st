"
Una Affectation es tipo de situación financiera que se modela el momento en que un comercio declara deudor a un cliente. Está afectación continua vigente hasta que venga una desafectación.

Constraints

No puede agregarse una afectación si el cliente una para el mismo comercio, salvo que luego de la afectación haya habido una desafectación de parte del mismo comercio y al mismo cliente. Es decir, debe permitirse ingresar una afectación solamente si el cliente nunca fue informado por el comercio o si la ultima novedad es una desafectación.
"
Class {
	#name : #Affectation,
	#superclass : #FinancialSituationType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
Affectation class >> financialSituationDescription [
	
	^'Afec'
]

{ #category : #'as yet unclassified' }
Affectation class >> financialSituationDescriptionCSSLabel [
	
	^'debe'
]

{ #category : #accessing }
Affectation class >> inputAmountOfDebt [
	
	^true
]

{ #category : #accessing }
Affectation class >> labelForButton [
	
	^'AFECTAR'
]

{ #category : #'as yet unclassified' }
Affectation class >> possibleType [

	^Disaffectation 
]
