Class {
	#name : #YavuSystemTestResource,
	#superclass : #TestResource,
	#instVars : [
		'system'
	],
	#category : #'YavuCommon-Test'
}

{ #category : #resources }
YavuSystemTestResource >> barraDamboLaPaulinaProduct [
	
	^ YavuProduct new 
		brand: self laPaulinaBrand;
		productType: self damboProductType;
		vatPercentage: 21;
		yourself
]

{ #category : #resources }
YavuSystemTestResource >> damboProductType [
	
	^ (YavuProductType name: 'Dambo')
			category: self quesoCategory;
			yourself 
]

{ #category : #resources }
YavuSystemTestResource >> itemOnBarraDamboLaPaulina [
	
	^ YavuPurchaseTransactionItem new 
		product: self barraDamboLaPaulinaProduct;
		quantity: 1;
		unitPrice: 10;
		yourself
]

{ #category : #resources }
YavuSystemTestResource >> laPaulinaBrand [
	
	^ YavuBrand name: 'La Paulina'
]

{ #category : #'instance creation' }
YavuSystemTestResource >> newQuesosDelAbastoSupplier [

	^ (YavuSupplier name: 'Bulacio Cesar Oscar')
			businessName: 'Quesos del Abasto';
			vatCondition: YavuResponsableInscripto;
			cuitNumber: '20144310579';
			yourself
]

{ #category : #'instance creation' }
YavuSystemTestResource >> newSubsystem [

	YavuTestEnvironment beCurrent.
	YavuTestEnvironment 
		systemClass: (YavuRestaurantSystem
			enabledSubsystemsClasses: (Array with: YavuTransientSubsystem with: YavuPurchaseSubsystem )).
	^ YavuTestEnvironment currentSystem
]

{ #category : #resources }
YavuSystemTestResource >> panaderiaGalliPurchaseInvoice [
	
	^ YavuPurchaseInvoice new
		entity: self panaderiaGalliSupplier;
		date: '04/11/2020' asDate;
		yourself
]

{ #category : #resources }
YavuSystemTestResource >> panaderiaGalliSupplier [

	^ (YavuSupplier name: 'Panaderia Galli')
			businessName: 'Carlitos Pan';
			vatCondition: YavuMonotributo;
			yourself
]

{ #category : #'as yet unclassified' }
YavuSystemTestResource >> purchaseTransaction1 [
	
	^ YavuPurchaseTransaction  new
		entity: self quesosDelAbastoSupplier;
		date: '04/11/2020' asDate;
		addPurchaseTransactionItem: self purchaseTransactionItem1;
		yourself
]

{ #category : #'as yet unclassified' }
YavuSystemTestResource >> purchaseTransactionItem1 [
	
	^ YavuPurchaseTransactionItem new
		product: self barraDamboLaPaulinaProduct;
		quantity: 1;
		unitPrice: 10;
		yourself
]

{ #category : #resources }
YavuSystemTestResource >> quesoCategory [

	^ YavuCategory name: 'Quesos'
]

{ #category : #resources }
YavuSystemTestResource >> quesosDelAbastoPurchaseInvoice [
	
	^ YavuPurchaseInvoice new
		entity: self quesosDelAbastoSupplier;
		date: '04/11/2020' asDate;
		yourself
]

{ #category : #resources }
YavuSystemTestResource >> quesosDelAbastoPurchaseTransaction [
	
	^ YavuPurchaseTransaction  new
		entity: self quesosDelAbastoSupplier;
		date: '04/11/2020' asDate;
		yourself
]

{ #category : #resources }
YavuSystemTestResource >> quesosDelAbastoSupplier [

	^system purchaseSubsystem suppliers detect: [ :each | each businessName = 'Quesos del Abasto' ]
]

{ #category : #running }
YavuSystemTestResource >> setUp [ 

	super setUp.
	system := self newSubsystem.
]

{ #category : #accessing }
YavuSystemTestResource >> system [ 

	^ system
]
