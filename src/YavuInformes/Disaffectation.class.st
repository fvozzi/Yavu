"
A Disaffectation es cuando un comercio indica que un cliente que estaba previamente afectado pagó.

Contraints

Solo puede ingresarse una desafectación si antes fue afectado por el comercio en cuestión.

"
Class {
	#name : #Disaffectation,
	#superclass : #FinancialSituationType,
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
Disaffectation class >> financialSituationDescription [
	
	^'Desafec'
]

{ #category : #accessing }
Disaffectation class >> financialSituationDescriptionCSSLabel [
	
	^'desafectado'
]

{ #category : #accessing }
Disaffectation class >> labelForButton [
	
	^'DESAFECTAR'
]

{ #category : #'as yet unclassified' }
Disaffectation class >> possibleType [

	^Affectation 
]
