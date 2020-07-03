Class {
	#name : #YavuSaleSubsystem,
	#superclass : #YavuSubsystem,
	#category : #'YavuSale-Environment'
}

{ #category : #accessing }
YavuSaleSubsystem class >> label [ 

	^ 'Subsistema Ventas'
]

{ #category : #configuration }
YavuSaleSubsystem class >> menuElements [

	^ OrderedCollection new 
		add: ((YavuSimpleMenuElement label: 'Administración' presenterClass: TBSEntitiesBrowserView subsystem: self) id: 1);
		add: ((YavuSimpleMenuElement label: 'Ventas' presenterClass: TBSTransactionsBrowserView subsystem: self) id: 2);
		yourself
]

{ #category : #configuration }
YavuSaleSubsystem class >> subsystemName [

	^ 'Ventas'
]

{ #category : #configuration }
YavuSaleSubsystem class >> subsystemTag [

	 ^'saleSubsystem'
]

{ #category : #'api/queries' }
YavuSaleSubsystem >> decimalAccuracy [

	^ 2
]

{ #category : #'as yet unclassified' }
YavuSaleSubsystem >> invoiceTypes [
	
		^ YavuInvoiceType allSubclasses select: [ :each | each availableForSales ]
]

{ #category : #accessing }
YavuSaleSubsystem >> lastZNumber [

	 ^ 0
]

{ #category : #'as yet unclassified' }
YavuSaleSubsystem >> salesOfEntity: aYavuBusinessName month: aDate [ 
	
	^ (self system storedSubsystem 
		instancesOfClass: YavuSaleInvoice 
		from: aDate beginOfMonth to: aDate endOfMonth ),
		(self system storedSubsystem 
		instancesOfClass: YavuZLock  
		from: aDate beginOfMonth to: aDate endOfMonth )
]
