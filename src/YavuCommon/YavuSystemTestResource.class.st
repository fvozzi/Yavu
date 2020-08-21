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

{ #category : #'instance creation' }
YavuSystemTestResource >> cajaRegistradora1 [

	^ (YavuCashRegister name: 'Caja Registradora 1')
			salePointNumber: 1;
			yourself
]

{ #category : #resources }
YavuSystemTestResource >> damboProductType [
	
	^ (YavuProductType name: 'Dambo')
			category: self quesoCategory;
			yourself 
]

{ #category : #resources }
YavuSystemTestResource >> fontinaLaPaulinaProduct [
	
	^ YavuProduct new 
		brand: self laPaulinaBrand;
		productType: self fontinaProductType;
		vatPercentage: 21;
		yourself
]

{ #category : #resources }
YavuSystemTestResource >> fontinaProductType [
	
	^ (YavuProductType name: 'Fontina')
			category: self quesoCategory;
			yourself 
]

{ #category : #resources }
YavuSystemTestResource >> itemOnBarraDamboLaPaulina [
	
	^ (YavuPurchaseTransactionItem owner: self quesosDelAbastoPurchaseTransaction )
		product: self barraDamboLaPaulinaProduct;
		quantity: 1;
		unitPrice: 10;
		yourself
]

{ #category : #resources }
YavuSystemTestResource >> laChispaFilmCustomer [

	^ (YavuCustomer name: 'LA CHISPA FIMLS SRL')
		vatCondition: YavuResponsableInscripto;
		cuitNumber: '30715478214';
		yourself
		
]

{ #category : #resources }
YavuSystemTestResource >> laChispaFilmSaleInvoice29 [
	
	^ (YavuSaleInvoice 	entity: self laChispaFilmCustomer	date: '01//17/2020' asDate)
		prefix: 3;
		invoiceNumber: 29;
		netPrice: 11570.25;
		vat210: 2429.75;
		yourself
]

{ #category : #resources }
YavuSystemTestResource >> laPaulinaBrand [
	
	^ YavuBrand name: 'La Paulina'
]

{ #category : #'as yet unclassified' }
YavuSystemTestResource >> luisLatancioPurchaseInvoiceNumber44 [
	
	^(YavuPurchaseInvoice entity: self luisLatancioSupplier date: '05/01/2020' asDate)
		prefix: 3;
		invoiceNumber: 44;
		netPrice: 40000;
		yourself
]

{ #category : #'instance creation' }
YavuSystemTestResource >> luisLatancioSupplier [

	^ (YavuSupplier name: 'Luis A Lattanzio')
			businessName: 'Luis A Lattanzio';
			vatCondition: YavuMonotributo;
			cuitNumber: '20172859209';
			yourself
]

{ #category : #resources }
YavuSystemTestResource >> maxiconsumoPurchaseInvoiceNumber54895 [
	
	^ (YavuPurchaseInvoice entity: self maxiconsumoSupplier	date: '05/12/2020' asDate)
		prefix: 3193;
		invoiceNumber: 54895;
		netPrice210: 7854.43;
		netPrice105: 1354.80;
		iibbPerception: 276.29;
		vatPerception: 255.95;
		yourself
]

{ #category : #'instance creation' }
YavuSystemTestResource >> maxiconsumoSupplier [

	^ (YavuSupplier name: 'Maxiconsumo SA')
			businessName: 'Maxiconsumo SA';
			vatCondition: YavuResponsableInscripto;
			cuitNumber: '30663005843';
			yourself
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
			enabledSubsystemsClasses: (Array with: YavuTransientSubsystem with: YavuPurchaseSubsystem with: YavuSaleSubsystem with: YavuAccountingSubsystem )).
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
	
	| purchase |
	
	purchase := YavuPurchaseTransaction  new.
	purchase
		entity: self quesosDelAbastoSupplier;
		date: '06/01/2020' asDate.
	^ purchase
		addPurchaseTransactionItem: (self purchaseTransactionItem1On: purchase);
		addPurchaseTransactionItem: (self purchaseTransactionItem2On: purchase);
		yourself
]

{ #category : #'as yet unclassified' }
YavuSystemTestResource >> purchaseTransactionItem1On: purchase [
	
	^ (YavuPurchaseTransactionItem owner: purchase)
		product: self barraDamboLaPaulinaProduct;
		quantity: 3.9;
		unitPrice: 388.98;
		yourself
]

{ #category : #'as yet unclassified' }
YavuSystemTestResource >> purchaseTransactionItem2On: purchase [
	
	^ (YavuPurchaseTransactionItem owner: purchase)
		product: self fontinaLaPaulinaProduct;
		quantity: 4;
		unitPrice: 601.41;
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
YavuSystemTestResource >> quesosDelAbastoPurchaseInvoiceNumber34089 [
	
	^ (YavuPurchaseInvoice entity: self quesosDelAbastoSupplier	date: '05/20/2020' asDate)
		prefix: 2;
		invoiceNumber: 34089;
		netPrice210: 10122.46;
		vat210: 2125.72;
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

{ #category : #resources }
YavuSystemTestResource >> zLockNumber545 [
	
	^ YavuZLock new
		entity: self cajaRegistradora1;
		date: '05/01/2020' asDate;
		zNumber: 545;
		netPrice: 15248.89;
		vat210: 3202.27;
		yourself
]
