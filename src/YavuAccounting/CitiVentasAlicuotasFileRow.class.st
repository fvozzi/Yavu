Class {
	#name : #CitiVentasAlicuotasFileRow,
	#superclass : #CitiFileRow,
	#category : #'YavuAccounting-AFIPUtilities'
}

{ #category : #'as yet unclassified' }
CitiVentasAlicuotasFileRow >> alicuotaIVA [
	
	^ '0005'
]

{ #category : #accessing }
CitiVentasAlicuotasFileRow >> columns [
	"Answer the columns of the receiver output file."

	^ #(tipoComprobante puntoDeVenta numeroComprobante netoGravado alicuotaIVA impuestoLiquidado)
]

{ #category : #'as yet unclassified' }
CitiVentasAlicuotasFileRow >> impuestoLiquidado [

	^ self formatNumber:  self invoice vat210 withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasAlicuotasFileRow >> netoGravado [

	^ self formatNumber: self invoice netPrice withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasAlicuotasFileRow >> numeroComprobante [
	
	^ self yavuSystem completeString: self invoice invoiceNumber asString withZeros: 20
]

{ #category : #'as yet unclassified' }
CitiVentasAlicuotasFileRow >> puntoDeVenta [
	
	^ self invoice formattedPrefix 
]

{ #category : #'as yet unclassified' }
CitiVentasAlicuotasFileRow >> tipoComprobante [
	
	^ self invoice afipTipoComprobante
]
