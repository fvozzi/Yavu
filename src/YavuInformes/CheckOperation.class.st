Class {
	#name : #CheckOperation,
	#superclass : #Transaction,
	#instVars : [
		'customer',
		'checkNumber',
		'bank',
		'amountOfCheck'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
CheckOperation class >> entityClass [
	
	^Commerce
]

{ #category : #'as yet unclassified' }
CheckOperation class >> entityLabel [

	^'Comercio'
]

{ #category : #testing }
CheckOperation >> = otherBouncedCheck [
	"Devuelve true si otraSituacionComercial es igual al receptor."
	
	^((super = otherBouncedCheck and: [
		self customer = otherBouncedCheck customer]) 
			and: [self bank = otherBouncedCheck bank])
]

{ #category : #accessing }
CheckOperation >> amountOfCheck [
	
	^ amountOfCheck
]

{ #category : #accessing }
CheckOperation >> amountOfCheck: anObject [
	
	amountOfCheck := anObject
]

{ #category : #printing }
CheckOperation >> amountOfCheckDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteDescription>
	^MANumberReef new 
        	accessor: #amountOfCheck;
        	label: 'Monto';
        	priority: 150;
		beRequired;
        	yourself
]

{ #category : #accessing }
CheckOperation >> bank [
	
	^ bank
]

{ #category : #accessing }
CheckOperation >> bank: anObject [
	
	bank := anObject
]

{ #category : #accessing }
CheckOperation >> checkNumber [

	^checkNumber
]

{ #category : #accessing }
CheckOperation >> checkNumber: anObject [
	
	checkNumber := anObject
]

{ #category : #printing }
CheckOperation >> checkNumberDescription [
	"Devuelve un objeto que describe la representación de la variable cliente del receptor."

	<magritteDescription>
	^MATextReef new
		accessor: #checkNumber;
		label: 'Nro. Cheque';
		priority: 130;
		beRequired;
		yourself
]

{ #category : #accessing }
CheckOperation >> customer [
	
	^ customer
]

{ #category : #accessing }
CheckOperation >> customer: anObject [
	
	customer := anObject
]

{ #category : #printing }
CheckOperation >> customerDescription [
	"Devuelve un objeto que describe la representación de la variable numero de documento del receptor."

	<magritteDescription>
	^MAComboBoxReef new
		accessor: #customer;
		default: nil;
		options: OrderedCollection new;
		label: 'Cliente';
		priority: 120;
		beRequired;
		yourself
]

{ #category : #printing }
CheckOperation >> maDescriptionForReport [
	"Devuelve un magritte description para ver en una tabla."

	^self magritteDescription select: [:each | each isRequired]
]
