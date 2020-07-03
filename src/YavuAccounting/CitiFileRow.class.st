Class {
	#name : #CitiFileRow,
	#superclass : #YavuObject,
	#instVars : [
		'invoice',
		'outputWriteStream'
	],
	#category : #'YavuAccounting-AFIPUtilities'
}

{ #category : #'as yet unclassified' }
CitiFileRow class >> on: aYavuPurchaseInvoice [ 
	
	^ self new initializeInvoice: aYavuPurchaseInvoice 
]

{ #category : #formatting }
CitiFileRow >> formatNumber: aNumber withZeros: amountOfZeros [
	
	| numberString |
	
	numberString := aNumber printShowingDecimalPlaces: 2.
	numberString := numberString copyReplaceAll: '.' with: ''.
	^ self yavuSystem completeString: numberString withZeros: amountOfZeros

]

{ #category : #'as yet unclassified' }
CitiFileRow >> initializeInvoice: aYavuPurchaseInvoice [ 

	invoice := aYavuPurchaseInvoice 
]

{ #category : #'as yet unclassified' }
CitiFileRow >> invoice [
	^ invoice
]

{ #category : #'as yet unclassified' }
CitiFileRow >> output [
	
	outputWriteStream := WriteStream on: String new.
	self columns do: [ :each | 
		outputWriteStream nextPutAll: (self perform: each) ].
	^ outputWriteStream contents
	
]
