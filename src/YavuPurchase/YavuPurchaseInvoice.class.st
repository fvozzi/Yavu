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

{ #category : #'sin categoria' }
YavuPurchaseInvoice class >> entityClass [
	
	^ YavuSupplier 
]

{ #category : #testing }
YavuPurchaseInvoice class >> isVoyageRoot [ 

	^ true
]

{ #category : #accessing }
YavuPurchaseInvoice class >> label [ 

	^ 'Factura de Compra'
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

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> iibbPerceptionDescription [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #iibbPerception;
        	label: 'Percepción IIBB';
        	priority: 155;
        	yourself
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

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceNumberDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #invoiceNumber;
        	label: 'Número';
        	priority: 115;
			min: 1;
			max: 99999999;
			beRequired;
        	yourself
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

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> invoiceTypeAndNumberDescription [

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #invoiceTypeAndNumber;
        	label: 'Tipo y Número';
        	priority: 120;
			beReadonly;
        	yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> invoiceTypeDescription [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #invoiceType;
		default: nil;
		optionsAndLabels: (self subsystem invoiceTypes collect: [:each | each -> each formattedInvoiceType]);
		label: 'Tipo';
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

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> netPriceDescription [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #netPrice;
        	label: 'Precio Neto';
        	priority: 130;
        	yourself
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
YavuPurchaseInvoice >> prefixDescription [

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #prefix;
        	label: 'Prefijo';
        	priority: 110;
			min: 1;
			max: 9999;
			beRequired;
        	yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> purchaseTransactionItems [
	
	^ self purchaseTransactions inject: OrderedCollection new into: [ :accum :each |
		accum addAll: each purchaseTransactionItems  ]
]

{ #category : #environment }
YavuPurchaseInvoice >> subsystem [
	^ self yavuSystem purchaseSubsystem
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

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> vatPerceptionDescription [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vatPerception;
        	label: 'Percepción IVA';
        	priority: 150;
        	yourself
]
