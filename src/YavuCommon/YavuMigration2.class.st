Class {
	#name : #YavuMigration2,
	#superclass : #YavuSystemMigration,
	#category : #'YavuCommon-Migrations'
}

{ #category : #accessing }
YavuMigration2 class >> description [ 

	^ 'Actualiza el precio neto que habia quedado duplicado por un error en la migración 1.'
]

{ #category : #accessing }
YavuMigration2 class >> migrationIdentifier [

	 ^ 2
]

{ #category : #'as yet unclassified' }
YavuMigration2 class >> runMigration [

	| purchaseInvoices |
	
	purchaseInvoices := self yavuSystem storedSubsystem instancesOf: (Smalltalk at: #YavuPurchaseInvoice).
	purchaseInvoices do: [ :each |
	(each netPrice105 > 0 or: [ each netPrice210 > 0 ]) ifTrue: [ 
			each netPrice: each netPrice105 + each netPrice210.
			self yavuSystem storedSubsystem save: each]
		]
]
