Class {
	#name : #BouncedCheck,
	#superclass : #CheckOperation,
	#instVars : [
		'bouncedDate',
		'cause',
		'finePaymentDate',
		'paymentDate'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #testing }
BouncedCheck >> = otherBouncedCheck [
	"Devuelve true si otraSituacionComercial es igual al receptor."
	
	^((super = otherBouncedCheck and: [
		self checkNumber = otherBouncedCheck checkNumber]) and: [
			self bouncedDate = otherBouncedCheck bouncedDate]) 
]

{ #category : #accessing }
BouncedCheck >> bouncedDate [
	
	^ bouncedDate
]

{ #category : #accessing }
BouncedCheck >> bouncedDate: anObject [
	
	bouncedDate := anObject
]

{ #category : #printing }
BouncedCheck >> bouncedDateDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteDescription>
	^MADateReef new 
        	accessor: #bouncedDate;
        	label: 'Fecha Rechazo';
        	priority: 140;
		beRequired;
        	yourself
]

{ #category : #accessing }
BouncedCheck >> cause [
	
	^ cause
]

{ #category : #accessing }
BouncedCheck >> cause: anObject [
	
	cause := anObject
]

{ #category : #printing }
BouncedCheck >> causeDescription [
	"Devuelve un objeto que describe la representación de la variable cliente del receptor."

	<magritteDescription>
	^MAStringDescription new
		accessor: #cause;
		label: 'Causa Rechazo';
		priority: 160;
		beRequired;
		yourself
]

{ #category : #accessing }
BouncedCheck >> finePaymentDate [
	
	^ finePaymentDate
]

{ #category : #accessing }
BouncedCheck >> finePaymentDate: anObject [

	finePaymentDate := anObject
]

{ #category : #printing }
BouncedCheck >> finePaymentDateDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteDescription>
	^MADateReef new 
        	accessor: #finePaymentDate;
        	label: 'Fecha Pago Multa';
        	priority: 170;
        	yourself
]

{ #category : #accessing }
BouncedCheck >> paymentDate [
	
	^ paymentDate
]

{ #category : #accessing }
BouncedCheck >> paymentDate: anObject [
	
	paymentDate := anObject
]

{ #category : #printing }
BouncedCheck >> paymentDateDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteDescription>
	^MADateReef new 
        	accessor: #paymentDate;
        	label: 'Fecha Pago';
        	priority: 180;
        	yourself
]
