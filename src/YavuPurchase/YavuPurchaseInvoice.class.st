Class {
	#name : #YavuPurchaseInvoice,
	#superclass : #YavuTransaction,
	#instVars : [
		'invoiceType',
		'total',
		'netPrice',
		'prefix',
		'invoiceNumber',
		'vatPerception',
		'iibbPerception',
		'purchaseTransactions'
	],
	#category : #'YavuPurchase-DomainObjects'
}

{ #category : #accessing }
YavuPurchaseInvoice class >> label [ 

	^ 'Remito de Compra'
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> addPurchaseTransaction: aYavuPurchaseTransaction [ 
	
	purchaseTransactions add: aYavuPurchaseTransaction.
	self onPurchaseTransactionsAdded
]

{ #category : #configuration }
YavuPurchaseInvoice >> completeString: aString withZeros: anInteger [ 
	
	| formattedString |
	
	formattedString := aString.
	anInteger - aString size timesRepeat: [ 
		formattedString := '0', formattedString 
		 ].
	^ formattedString 
]

{ #category : #'sin categoria' }
YavuPurchaseInvoice >> entity: aSupplier [

	super entity: aSupplier.
	self onEntityChanded
]

{ #category : #configuration }
YavuPurchaseInvoice >> formattedInvoiceNumber [
	
	^ self completeString: self invoiceNumber asString withZeros: 8
]

{ #category : #configuration }
YavuPurchaseInvoice >> formattedPrefix [
	
	^ self completeString: self prefix asString withZeros: 4
]

{ #category : #accessing }
YavuPurchaseInvoice >> iibbPerception [
	^ iibbPerception
]

{ #category : #accessing }
YavuPurchaseInvoice >> iibbPerception: anObject [
	iibbPerception := anObject
]

{ #category : #'sin categoria' }
YavuPurchaseInvoice >> initialize [ 

	super initialize.
	purchaseTransactions := OrderedCollection new
]

{ #category : #accessing }
YavuPurchaseInvoice >> invoiceNumber [
	^ invoiceNumber
]

{ #category : #accessing }
YavuPurchaseInvoice >> invoiceNumber: anObject [
	invoiceNumber := anObject
]

{ #category : #accessing }
YavuPurchaseInvoice >> invoiceType [
	^ invoiceType
]

{ #category : #accessing }
YavuPurchaseInvoice >> invoiceType: anObject [
	invoiceType := anObject
]

{ #category : #configuration }
YavuPurchaseInvoice >> invoiceTypeAndNumber [

	^ self invoiceType 
		ifNil: [ '' ]
		ifNotNil: [ self invoiceType formattedInvoiceType, ' ', self formattedPrefix, ' ', self formattedInvoiceNumber ]
]

{ #category : #descriptions }
YavuPurchaseInvoice >> invoiceTypeDescription [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #invoiceType;
		default: nil;
		optionsAndLabels: (self subsystem invoiceTypes collect: [:each | each -> each formattedInvoiceType]);
		label: self class entityLabel;
		priority: 100;
		beRequired;
		yourself
]

{ #category : #accessing }
YavuPurchaseInvoice >> netPrice [
	^ netPrice
]

{ #category : #accessing }
YavuPurchaseInvoice >> netPrice: anObject [
	netPrice := anObject
]

{ #category : #'sin categoria' }
YavuPurchaseInvoice >> onEntityChanded [

	self invoiceType: self entity invoiceType
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> onPurchaseTransactionsAdded [
	
	netPrice := self purchaseTransactionItems sum: [ :each | self subtotalPriceOf: each ].
	total := self purchaseTransactionItems sum: [ :each | self totalPriceOf: each ]
]

{ #category : #accessing }
YavuPurchaseInvoice >> prefix [
	^ prefix
]

{ #category : #accessing }
YavuPurchaseInvoice >> prefix: anObject [
	prefix := anObject
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> purchaseTransactionItems [
	
	^ self purchaseTransactions inject: OrderedCollection new into: [ :accum :each |
		accum addAll: each purchaseTransactionItems  ]
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> subtotalPriceOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType subtotalPriceOf: aPurchaseTransactionItem
]

{ #category : #accessing }
YavuPurchaseInvoice >> total [
	^ total
]

{ #category : #accessing }
YavuPurchaseInvoice >> total: anObject [
	total := anObject
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> totalPriceOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType totalPriceOf: aPurchaseTransactionItem 
]

{ #category : #accessing }
YavuPurchaseInvoice >> vatPerception [
	^ vatPerception
]

{ #category : #accessing }
YavuPurchaseInvoice >> vatPerception: anObject [
	vatPerception := anObject
]
