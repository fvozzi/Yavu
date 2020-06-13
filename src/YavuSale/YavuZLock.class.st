Class {
	#name : #YavuZLock,
	#superclass : #YavuTransaction,
	#instVars : [
		'zNumber',
		'netPrice',
		'vat210',
		'lastTicketNumber'
	],
	#category : #'YavuSale-DomainObjects'
}

{ #category : #'sin categoria' }
YavuZLock class >> entityClass [
	
	^ YavuCashRegister  
]

{ #category : #testing }
YavuZLock class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuZLock class >> label [ 

	^ 'Cierre Z'
]

{ #category : #accessing }
YavuZLock class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]

{ #category : #descriptions }
YavuZLock >> descriptionLastTicketNumber [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #lastTicketNumber;
        	label: 'Número último ticket';
        	priority: 120;
			min: 1;
			max: 999999;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuZLock >> descriptionNetPrice [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #netPrice;
        	label: 'Importe Neto Gravado';
        	priority: 125;
			min: 0.1;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuZLock >> descriptionTotal [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #total;
        	label: 'Total';
        	priority: 160;
			beReadonly;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #descriptions }
YavuZLock >> descriptionVat210 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vat210;
        	label: 'IVA 21%';
        	priority: 130;
			componentClass: TBSMagritteTextInputComponent;
			beReadonly;
        	yourself
]

{ #category : #descriptions }
YavuZLock >> descriptionZNumber [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #zNumber;
        	label: 'Número Cierre';
        	priority: 115;
			min: 1;
			max: 99999;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #configuration }
YavuZLock >> formattedInvoiceNumber [
	
	^ self yavuSystem completeString: self invoiceNumber asString withZeros: 8
]

{ #category : #configuration }
YavuZLock >> formattedPrefix [
	
	^ self yavuSystem completeString: self entity salePointNumber asString withZeros: 4
]

{ #category : #configuration }
YavuZLock >> formattedType [

	^ 'CIERRE Z'
]

{ #category : #accessing }
YavuZLock >> initialize [ 

	netPrice := vat210 := 0.
	zNumber := self subsystem lastZNumber + 1
]

{ #category : #configuration }
YavuZLock >> invoiceTypeAndNumber [

	^ self formattedType, ' ', self formattedPrefix, ' ', self formattedInvoiceNumber
]

{ #category : #accessing }
YavuZLock >> lastTicketNumber [
	^ lastTicketNumber
]

{ #category : #accessing }
YavuZLock >> lastTicketNumber: anObject [
	lastTicketNumber := anObject
]

{ #category : #accessing }
YavuZLock >> netPrice [
	^ netPrice
]

{ #category : #accessing }
YavuZLock >> netPrice: anObject [
	netPrice := anObject.
	self onNetPriceChanged
]

{ #category : #accessing }
YavuZLock >> onNetPriceChanged [

	vat210 := netPrice * 0.21 round: self subsystem decimalAccuracy
]

{ #category : #accessing }
YavuZLock >> total [

	^ (self netPrice + self vat210)  round: self subsystem decimalAccuracy

]

{ #category : #accessing }
YavuZLock >> vat210 [
	^ vat210
]

{ #category : #accessing }
YavuZLock >> vat210: anObject [
	vat210 := anObject
]

{ #category : #accessing }
YavuZLock >> zNumber [
	^ zNumber
]

{ #category : #accessing }
YavuZLock >> zNumber: anObject [
	zNumber := anObject
]
