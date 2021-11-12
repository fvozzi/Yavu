Class {
	#name : #YavuMigration6,
	#superclass : #YavuSystemMigration,
	#category : #'YavuCommon-Migrations'
}

{ #category : #accessing }
YavuMigration6 class >> description [ 

	^ 'Asigná la lista de precio común a YavuPriceOfSaleProduct.'
]

{ #category : #accessing }
YavuMigration6 class >> migrationIdentifier [

	 ^ 6
]

{ #category : #running }
YavuMigration6 class >> runMigration [

	| priceList |

	priceList := self yavuSystem storedSubsystem entityOfClass: (Smalltalk at: #YavuPriceList) withName: 'Común'.
	self yavuSystem currentPriceOfSaleProducts   do: [ :each | 
		each priceList: priceList.
		[self yavuSystem storedSubsystem save: each] on: VOError do: [ :ex | ]
		 ]

]
