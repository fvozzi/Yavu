Class {
	#name : #YavuPurchaseTransaction,
	#superclass : #YavuTransaction,
	#instVars : [
		'purchaseTransactionItems',
		'total',
		'voucherNumber',
		'invoice',
		'paymentType'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #'sin categoria' }
YavuPurchaseTransaction class >> entityClass [
	
	^ YavuSupplier 
]

{ #category : #testing }
YavuPurchaseTransaction class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuPurchaseTransaction class >> label [ 

	^ 'Remito de Compra'
]

{ #category : #accessing }
YavuPurchaseTransaction class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #configuration }
YavuPurchaseTransaction >> addPurchaseTransactionItem: anInvoiceItem [ 
	
	purchaseTransactionItems add: anInvoiceItem.
	self onInvoiceItemsChange
]

{ #category : #configuration }
YavuPurchaseTransaction >> available [
	^ self invoice isNil
]

{ #category : #descriptions }
YavuPurchaseTransaction >> descriptionPaymentType [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #paymentType;
		default: self subsystem cashPaymentType;
		options: self subsystem paymentTypes;
		label: 'Tipo de Pago';
		priority: 150;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuPurchaseTransaction >> descriptionPurchaseTransactionItems [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAToManyRelationDescription new
		accessor: #purchaseTransactionItems;
		classes: (OrderedCollection with: YavuPurchaseTransactionItem);
		default: nil;
		label: 'Items';
		priority: 120;
		beRequired;
		componentClass: TBSMagritteOneToManyComponent;
		canExport: false;
		yourself
]

{ #category : #descriptions }
YavuPurchaseTransaction >> descriptionTotal [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #total;
			beReadonly;
        	label: 'Total';
        	priority: 160;
        	yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseTransaction >> discriminateVat [
	
	^ self entity vatCondition discriminateVat 
]

{ #category : #initialization }
YavuPurchaseTransaction >> initialize [ 

	super initialize.
	purchaseTransactionItems := OrderedCollection new 
]

{ #category : #acccessing }
YavuPurchaseTransaction >> invoice [
	
	^ invoice
]

{ #category : #acccessing }
YavuPurchaseTransaction >> invoice: aClass [ 
	
	invoice := aClass
]

{ #category : #descriptions }
YavuPurchaseTransaction >> mementoClass [

	^ MAStraightMemento
]

{ #category : #acccessing }
YavuPurchaseTransaction >> onInvoiceItemsChange [
	
	| totalNumber |

	totalNumber := self purchaseTransactionItems inject: 0 into: [ :accum :each | accum + each subtotalAfterTaxs].
	total := totalNumber asFloat round: self subsystem decimalAccuracy
]

{ #category : #acccessing }
YavuPurchaseTransaction >> paymentType [
	^ paymentType
]

{ #category : #acccessing }
YavuPurchaseTransaction >> paymentType: aPaymentType [
	paymentType := aPaymentType 
]

{ #category : #printing }
YavuPurchaseTransaction >> printOn: aStream [

	aStream 
		nextPutAll: self date ddmmyyyy; 
		nextPutAll: ' - ';
		nextPutAll: self total asString
]

{ #category : #acccessing }
YavuPurchaseTransaction >> purchaseTransactionItems [

	^purchaseTransactionItems
]

{ #category : #acccessing }
YavuPurchaseTransaction >> purchaseTransactionItems: aCollection [ 

	purchaseTransactionItems := aCollection.
	self onInvoiceItemsChange
]

{ #category : #environment }
YavuPurchaseTransaction >> subsystem [
	^ self yavuSystem purchaseSubsystem
]

{ #category : #acccessing }
YavuPurchaseTransaction >> total [

	^ total
]

{ #category : #acccessing }
YavuPurchaseTransaction >> voucherNumber [
	^ voucherNumber
]

{ #category : #acccessing }
YavuPurchaseTransaction >> voucherNumber: anInteger [ 
	
	voucherNumber := anInteger 
]
