Class {
	#name : #YavuMigration3,
	#superclass : #YavuSystemMigration,
	#category : #'YavuCommon-Migrations'
}

{ #category : #accessing }
YavuMigration3 class >> description [ 

	^ 'Actualiza el precio con IVA de los remitos de Forest que quedaron con iva del 21 algunos.'
]

{ #category : #accessing }
YavuMigration3 class >> migrationIdentifier [

	 ^ 3
]

{ #category : #'as yet unclassified' }
YavuMigration3 class >> runMigration [

	| purchaseTransactions forest |
	
	forest :=  self yavuSystem storedSubsystem entityOfClass: (Smalltalk at: #YavuSupplier) withName: 'Frigorifico Forest'. 
	purchaseTransactions := self yavuSystem storedSubsystem instancesOfClass: (Smalltalk at: #YavuPurchaseTransaction) withEntity: forest.
	purchaseTransactions do: [ :each |
		each purchaseTransactionItems do: [ :eachItem | eachItem unitPriceAfterTaxs: eachItem unitPriceAfterTaxs ].
		self yavuSystem storedSubsystem save: each
	]

]
