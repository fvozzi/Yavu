"
Just model the minium necesary values in order to present VAT Sales report. Needs refactoring.
"
Class {
	#name : #YavuPurchaseInvoice,
	#superclass : #YavuInvoice,
	#instVars : [
		'vatPerception',
		'iibbPerception',
		'purchaseTransactions',
		'netPrice210',
		'netPrice105'
	],
	#category : #'YavuPurchase-Model'
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

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> accountingAccount [

	^ self entity accountingAccount 
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
YavuPurchaseInvoice >> amountOfVatAlicuot [
	
	^ self vatAlicuots size
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> availablePurchaseTransactions [

	^ self subsystem availablePurchaseTransactionsFor: self entity
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> cuitNumber [

	^ self entity cuitNumber 
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> descriptionAccountingAccount [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #accountingAccount;
		label: 'Cuenta contable';
		priority: 10;
		beReadonly;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> descriptionCUITNumber [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #cuitNumber;
      label: 'CUIT';
      	priority: 140;
	  	visible: false;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
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

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionInvoiceType [

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #invoiceType;
		default: nil;
		beReadonly;
		optionsAndLabels: (self subsystem invoiceTypes collect: [:each | each -> each formattedInvoiceType]);
		label: 'Tipo';
		priority: 100;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuPurchaseInvoice >> descriptionNetPrice [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #netPrice;
        	label: 'Neto Gravado';
        	priority: 125;
			min: 0.1;
			beRequired;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> descriptionNetPrice105 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #netPrice105;
        	label: 'Neto 10.5% Iva';
        	priority: 126;
			componentClass: TBSMagritteTextInputComponent;
        	yourself
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> descriptionNetPrice210 [

	<magritteDescription>
	^ MANumberDescription new 
        	accessor: #netPrice210;
        	label: 'Neto 21% Iva';
        	priority: 125;
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
		componentClass: TBSListCompositionComponent;
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

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> hiddenDescriptions [

	^ self invoiceType hiddenDescriptionsOn: self
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> hiddenDescriptionsOnTypeA [

	^#(netPrice)
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> hiddenDescriptionsOnTypeC [

	^#(netPrice105 netPrice210 vat105 vat210 iibbPerception vatPerception)
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
	netPrice105 := netPrice210 := vatPerception := iibbPerception  := 0.
	purchaseTransactions := OrderedCollection new
]

{ #category : #accessing }
YavuPurchaseInvoice >> magritteDescription [ 
	
	| setOfDescriptionsToHidde |
	
	self invoiceType ifNil: [ ^super magritteDescription ].
	setOfDescriptionsToHidde := self hiddenDescriptions asSet.
	^ super magritteDescription reject: [:each | setOfDescriptionsToHidde includes: each accessor readSelector]
]

{ #category : #descriptions }
YavuPurchaseInvoice >> mementoClass [

	^ MAStraightMemento
]

{ #category : #accessing }
YavuPurchaseInvoice >> netPrice [

	^ self invoiceType discriminateVat 
		ifTrue: [ self netPrice105 + self netPrice210 ]
		ifFalse: [ super netPrice ]
]

{ #category : #accessing }
YavuPurchaseInvoice >> netPrice105 [
	^ netPrice105
]

{ #category : #accessing }
YavuPurchaseInvoice >> netPrice105: anObject [
	netPrice105 := anObject ifNil: [ 0 ].
	vat105 := (self invoiceType vatValueOf: netPrice105 vatPercentaje: 0.105) round: self subsystem decimalFiscalAccuracy
]

{ #category : #calculated }
YavuPurchaseInvoice >> netPrice105ValueOf: aPurchaseTransactionItem [ 
	
	^ (self invoiceType netPriceValueOf: aPurchaseTransactionItem vatPercentaje: 10.5) round: self subsystem decimalAccuracy 
]

{ #category : #accessing }
YavuPurchaseInvoice >> netPrice210 [
	^ netPrice210
]

{ #category : #accessing }
YavuPurchaseInvoice >> netPrice210: anObject [
	netPrice210 := anObject.
	vat210 := (self invoiceType vatValueOf: anObject vatPercentaje: 0.21) round: self subsystem decimalFiscalAccuracy.
]

{ #category : #calculated }
YavuPurchaseInvoice >> netPrice210ValueOf: aPurchaseTransactionItem [ 
	
	^ (self invoiceType netPriceValueOf: aPurchaseTransactionItem vatPercentaje: 21.0) round: self subsystem decimalAccuracy 
]

{ #category : #events }
YavuPurchaseInvoice >> onPurchaseTransactionsAdded [
	
	netPrice210 := netPrice105 := 0.
	self purchaseTransactionItems do: [ :each | 
		netPrice105  := netPrice105 + (self netPrice105ValueOf: each).
		netPrice210  := netPrice210 + (self netPrice210ValueOf: each)].
	self netPrice105: (netPrice105 round: self subsystem decimalFiscalAccuracy).
	self netPrice210: (netPrice210 round: self subsystem decimalFiscalAccuracy).
	self netPrice: (netPrice105 + netPrice210 round: self subsystem decimalFiscalAccuracy)
]

{ #category : #adding }
YavuPurchaseInvoice >> onStoreRemoved [
	"Self removed from the store, now we need to remove the references."
	
	self purchaseTransactions do: [ :each |
		each invoice: nil; addToSystem  ]
]

{ #category : #accessing }
YavuPurchaseInvoice >> purchaseTransactionItems [
	
	^ self purchaseTransactions inject: OrderedCollection new into: [ :accum :each |
		accum addAll: each purchaseTransactionItems; yourself  ]
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
	
	^ (self invoiceType subtotalPriceOf: aPurchaseTransactionItem) round: self subsystem decimalAccuracy 
]

{ #category : #accessing }
YavuPurchaseInvoice >> total [

	^ (self netPrice + self vat105 + self vat210 + self vatPerception + self iibbPerception) round: self subsystem decimalFiscalAccuracy 
]

{ #category : #calculated }
YavuPurchaseInvoice >> totalPriceOf: aPurchaseTransactionItem [ 
	
	^ self invoiceType totalPriceOf: aPurchaseTransactionItem 
]

{ #category : #calculated }
YavuPurchaseInvoice >> vat105ValueOf: aPurchaseTransactionItem [ 
	
	^ (self invoiceType vatValueOf: aPurchaseTransactionItem vatPercentaje: 10.5) round: self subsystem decimalAccuracy 
]

{ #category : #calculated }
YavuPurchaseInvoice >> vat210ValueOf: aPurchaseTransactionItem [ 
	
	^ (self invoiceType vatValueOf: aPurchaseTransactionItem vatPercentaje: 21.0) round: self subsystem decimalAccuracy 
]

{ #category : #'as yet unclassified' }
YavuPurchaseInvoice >> vatAlicuots [
	
	| result |
	
	result := OrderedCollection new.
	self vat210 > 0 ifTrue: [ result add: 21. ].
	self vat105 > 0 ifTrue: [ result add: 10.5 ].
	^ result
]

{ #category : #accessing }
YavuPurchaseInvoice >> vatPerception [
	^ vatPerception
]

{ #category : #accessing }
YavuPurchaseInvoice >> vatPerception: anObject [
	vatPerception := anObject
]
