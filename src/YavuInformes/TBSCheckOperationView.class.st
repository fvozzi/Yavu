Class {
	#name : #TBSCheckOperationView,
	#superclass : #TBSTransactionView,
	#instVars : [
		'checkNumber',
		'amountOfCheck',
		'bank'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #accessing }
TBSCheckOperationView >> amountOfCheck [
	
	^ amountOfCheck
]

{ #category : #accessing }
TBSCheckOperationView >> amountOfCheck: anObject [
	
	amountOfCheck := anObject
]

{ #category : #accessing }
TBSCheckOperationView >> bank [
	
	^ bank
]

{ #category : #accessing }
TBSCheckOperationView >> bank: anObject [
	
	bank := anObject
]

{ #category : #accessing }
TBSCheckOperationView >> checkNumber [
	
	^ checkNumber
]

{ #category : #accessing }
TBSCheckOperationView >> checkNumber: anObject [
	
	checkNumber := anObject
]

{ #category : #initialization }
TBSCheckOperationView >> initializeTransactionData [
	"Resetea los datos ingresdos por el usuario para ingresar una nueva situación."

	super initializeTransactionData.
	amountOfCheck := checkNumber := '' 
]

{ #category : #creation }
TBSCheckOperationView >> newTransaction [
	"Devuelve una nueva situacion comercial según los datos ingresados por el usuario."
	
	^(self transactionClass 
		entity:  self commerce date: self date)
		customer: self clienteActualONuevo;
		bank: self bank;
		amountOfCheck: (self amountOfCheck isEmpty ifTrue: [nil] ifFalse: [self amountOfCheck asNumber]);
		checkNumber: self checkNumber;
		ts: TimeStamp now;
		yourself
]

{ #category : #accessing }
TBSCheckOperationView >> transactionClass [

	^self subclassResponsibility 
]

{ #category : #rendering }
TBSCheckOperationView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet resourceUrl: 'css/bouncedChecks.css'
]

{ #category : #testing }
TBSCheckOperationView >> verifyTransactionData [
	"Devuelve true si el monto no es nil."
	
	(self checkNumber notEmpty) ifTrue: [^true].
	self descriptionError: 'Debe ingresar un número de cheque o chequera según corresponda.'.
	^false
]
