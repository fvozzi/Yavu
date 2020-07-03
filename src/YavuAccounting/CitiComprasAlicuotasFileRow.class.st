Class {
	#name : #CitiComprasAlicuotasFileRow,
	#superclass : #CitiFileRow,
	#instVars : [
		'alicuota'
	],
	#category : #'YavuAccounting-AFIPUtilities'
}

{ #category : #'as yet unclassified' }
CitiComprasAlicuotasFileRow class >> on: aYavuPurchaseInvoice alicuota: aAlicuota [
	
	^ (super on: aYavuPurchaseInvoice) initializeAlicuota: aAlicuota 
]

{ #category : #'as yet unclassified' }
CitiComprasAlicuotasFileRow >> alicuotaIVA [
	
	| alicuotaIVA |
	
	alicuotaIVA := alicuota = 21 
							ifTrue: [ '5' ]
							ifFalse: [ '4' ].
	^ self yavuSystem completeString: alicuotaIVA withZeros: 4
]

{ #category : #'as yet unclassified' }
CitiComprasAlicuotasFileRow >> codigoDocumentoVendedor [
	
	^ '80'
]

{ #category : #accessing }
CitiComprasAlicuotasFileRow >> columns [
	"Answer the columns of the receiver output file."

	^ #(tipoComprobante puntoDeVenta numeroComprobante codigoDocumentoVendedor numeroDocumentoVendedor netoGravado alicuotaIVA impuestoLiquidado)
]

{ #category : #'as yet unclassified' }
CitiComprasAlicuotasFileRow >> impuestoLiquidado [
	
	| impuesto |
	
	impuesto := alicuota = 21 
							ifTrue: [ self invoice vat210]
							ifFalse: [ self invoice vat105].
	^ self formatNumber: impuesto withZeros: 15
]

{ #category : #initialization }
CitiComprasAlicuotasFileRow >> initializeAlicuota: aAlicuota [ 

	alicuota := aAlicuota 
]

{ #category : #'as yet unclassified' }
CitiComprasAlicuotasFileRow >> netoGravado [
	
	| netoGravado |
	
	netoGravado := alicuota = 21 
							ifTrue: [ self invoice netPrice210 ]
							ifFalse: [ self invoice netPrice105 ].
	^ self formatNumber: netoGravado withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasAlicuotasFileRow >> numeroComprobante [

	^ self yavuSystem completeString: self invoice invoiceNumber asString withZeros: 20
]

{ #category : #'as yet unclassified' }
CitiComprasAlicuotasFileRow >> numeroDocumentoVendedor [
	
	^ self yavuSystem completeString: self invoice entity cuitNumber  withZeros: 20 
]

{ #category : #'as yet unclassified' }
CitiComprasAlicuotasFileRow >> puntoDeVenta [
	
	^ self invoice formattedPrefix 
]

{ #category : #'as yet unclassified' }
CitiComprasAlicuotasFileRow >> tipoComprobante [

	^ self invoice invoiceType afipTipoComprobante
]
