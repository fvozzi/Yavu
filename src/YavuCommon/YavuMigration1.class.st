"
I represent a system migration.

I migrate object on the production system in order to support refactoring and continuos deploy. 

I do scripting on system objects.

Public API and Key Messages

- run   

It's class based so you write your script and send run to the class.
"
Class {
	#name : #YavuMigration1,
	#superclass : #YavuSystemMigration,
	#category : #'YavuCommon-Migrations'
}

{ #category : #accessing }
YavuMigration1 class >> description [ 

	^ 'Actualizo todas las facturas de compras seteando el precio neto 21 o el precio neto 10.5 según el iva que tenga ingresado. Es decir, si tiene iva 21 entonces seteo en precio neto 21 el valor que se encuentra ingresado en precio neto. Lo mismo para iva 10.5'
]

{ #category : #accessing }
YavuMigration1 class >> migrationIdentifier [

	 ^ 1
]

{ #category : #'as yet unclassified' }
YavuMigration1 class >> runMigration [

	| purchaseInvoices |
	
	purchaseInvoices := self yavuSystem storedSubsystem instancesOf: (Smalltalk at: #YavuPurchaseInvoice).
	purchaseInvoices do: [ :each |
		each vat105 > 0 ifTrue: [ 
			each netPrice105: each netPrice.
			each netPrice210: 0 ].
		each vat210 > 0 ifTrue:[
			each netPrice210: each netPrice.
			each netPrice105: 0 ]. 
			self yavuSystem storedSubsystem save: each]
]
