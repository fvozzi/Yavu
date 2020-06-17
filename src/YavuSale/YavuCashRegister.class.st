Class {
	#name : #YavuCashRegister,
	#superclass : #YavuEntity,
	#instVars : [
		'salePointNumber'
	],
	#category : #'YavuSale-Entities'
}

{ #category : #testing }
YavuCashRegister class >> isVoyageRoot [ 

	^ true
]

{ #category : #'sin categoria' }
YavuCashRegister class >> label [ 

	 ^ 'Caja Registradora'
]

{ #category : #accessing }
YavuCashRegister class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]

{ #category : #descriptions }
YavuCashRegister >> descriptionPrefix [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #salePointNumber;
        	label: 'Punto de Venta';
        	priority: 110;
			min: 1;
			max: 99;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #accessing }
YavuCashRegister >> salePointNumber [
	^ salePointNumber
]

{ #category : #accessing }
YavuCashRegister >> salePointNumber: anObject [
	salePointNumber := anObject
]