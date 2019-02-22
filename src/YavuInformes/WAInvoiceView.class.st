Class {
	#name : #WAInvoiceView,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'invoice',
		'entitySelector'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAInvoiceView >> generate [
]

{ #category : #'as yet unclassified' }
WAInvoiceView >> invoice [

	invoice isNil ifTrue: [invoice := Invoice new].
	^invoice
]

{ #category : #'as yet unclassified' }
WAInvoiceView >> renderContentOn: html [
	"Render the menu elements."
	
	html form with: [
		html submitButton text: 'Generar Factura'; callback: [self generate].
		html render: (self invoice asComponent 
					addValidatedForm;
					yourself)]

]
