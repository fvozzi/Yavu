"
Just model the minium necesary values in order to present VAT Sales report. Needs refactoring.
"
Class {
	#name : #YavuPurchaseInvoice,
	#superclass : #YavuInvoice,
	#instVars : [
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

{ #category : #accessing }
YavuPurchaseInvoice class >> subsystemClass [
	^ Smalltalk at: #YavuPurchaseSubsystem
]

{ #category : #events }
YavuPurchaseInvoice >> addPurchaseTransaction: aYavuPurchaseTransaction [ 
	
	purchaseTransactions add: aYavuPurchaseTransaction.
	self onPurchaseTransactionsAdded
]

{ #category : #adding }
YavuPurchaseInvoice >> addToSystem [

	super addToSystem.
	self purchaseTransactions do: [ :each | 
		each invoice: self.
		self yavuSystem storedSubsystem save: each ]
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> availablePurchaseTransactions [

	^ self subsystem availablePurchaseTransactionsFor: self entity
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionContainer [

	^ super descriptionContainer
		addCondition: [ :obj | 
			(obj readUsing: self descriptionInvoiceType) discriminateVat
				ifTrue: [ (obj readUsing: self descriptionVat105) = 0
						ifTrue: [ ((obj readUsing: self descriptionVat210) = 0) not ]
						ifFalse: [ true ] ]
				ifFalse: [ true ] ]
			labelled: 'El IVA total de la factura debe ser mayor a 0.';
		yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionIibbPerception [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #iibbPerception;
        	label: 'Percepción IIBB';
        	priority: 155;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> descriptionPurchaseTransactions [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #purchaseTransactions;
		default: nil;
		label: 'Remitos';
		priority: 120;
		componentClass: MAListCompositonComponent;
		options: self availablePurchaseTransactions;
		yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionVatPerception [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #vatPerception;
        	label: 'Percepción IVA';
        	priority: 150;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
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
	vatPerception := iibbPerception  := 0.
	purchaseTransactions := OrderedCollection new
]

{ #category : #descriptions }
YavuPurchaseInvoice >> mementoClass [

	^ MAStraightMemento
]

{ #category : #events }
YavuPurchaseInvoice >> onPurchaseTransactionsAdded [
	
	netPrice := vat105 := vat210 := 0.
	self purchaseTransactionItems do: [ :each | 
		netPrice := self subtotalPriceOf: each.
		vat105 := self vat105ValueOf: each.
		vat210 := self vat210ValueOf: each ]
]

{ #category : #accessing }
YavuPurchaseInvoice >> purchaseTransactionItems [
	
	^ self purchaseTransactions inject: OrderedCollection new into: [ :accum :each |
		accum addAll: each purchaseTransactionItems  ]
]

{ #category : #accessing }
YavuPurchaseInvoice >> purchaseTransactions [
	^ purchaseTransactions
]

{ #category : #accessing }
YavuPurchaseInvoice >> purchaseTransactions: aCollection [

	purchaseTransactions := aCollection.
	self onPurchaseTransactionsAdded
]

{ #category : #environment }
YavuPurchaseInvoice >> subsystem [
	^ self yavuSystem purchaseSubsystem
]

{ #category : #calculated }
YavuPurchaseInvoice >> subtotalPriceOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType subtotalPriceOf: aPurchaseTransactionItem
]

{ #category : #accessing }
YavuPurchaseInvoice >> total [

	^ self netPrice + self vat105 + self vat210 + self vatPerception + self iibbPerception 
]

{ #category : #calculated }
YavuPurchaseInvoice >> totalPriceOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType totalPriceOf: aPurchaseTransactionItem 
]

{ #category : #calculated }
YavuPurchaseInvoice >> vat105ValueOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType vatValueOf: aPurchaseTransactionItem vatPercentaje: 10.5
]

{ #category : #calculated }
YavuPurchaseInvoice >> vat210ValueOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType vatValueOf: aPurchaseTransactionItem vatPercentaje: 21.0
]

{ #category : #accessing }
YavuPurchaseInvoice >> vatPerception [
	^ vatPerception
]

{ #category : #accessing }
YavuPurchaseInvoice >> vatPerception: anObject [
	vatPerception := anObject
]
