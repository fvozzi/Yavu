Class {
	#name : #CitiVentasComprobantesFileRow,
	#superclass : #CitiFileRow,
	#category : #'YavuAccounting-AFIPUtilities'
}

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> cantidadAlicuotasIVA [
	
	^ '1'
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> codigoDeOperacion [
	
	^ '0'
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> codigoDocumentoComprador [
	
	^ self invoice entity afipCodigoDocumentoComprador
]

{ #category : #accessing }
CitiVentasComprobantesFileRow >> columns [
	"Answer the columns of the receiver output file."

	^ #(fecha tipoComprobante puntoDeVenta numeroComprobante numeroHastaComprobante codigoDocumentoComprador numeroDocumentoComprador denominacionComprador total noGravado percepcionANoCategorizados importeExentos importeDePercepcionesNacionales percepcionIIBB	 percepcionesImpuestosMunicipales impuestosInternos tipoMoneda tipoCambio cantidadAlicuotasIVA codigoDeOperacion otrosTributos fechoVencimientoPago)
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> denominacionComprador [
	
	^ (self invoice entity legalName, '                              ' ) copyFrom: 1 to: 30
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> fecha [
	
	^ self invoice date yyyymmdd copyReplaceAll: '-' with: ''
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> fechoVencimientoPago [
	
	^ self yavuSystem completeString: '0' withZeros: 8
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> importeDePercepcionesNacionales [
	
	^ self formatNumber: 0 withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> importeExentos [
	
		^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> impuestosInternos [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> noGravado [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> numeroComprobante [

	^ self yavuSystem completeString: self invoice invoiceNumber asString withZeros: 20
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> numeroDocumentoComprador [
	
	^ self yavuSystem completeString: self invoice entity cuitNumber withZeros: 20 
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> numeroHastaComprobante [
	
	^ self numeroComprobante 
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> otrosTributos [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> percepcionANoCategorizados [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> percepcionIIBB [
	
	^ self formatNumber: 0 withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> percepcionesImpuestosMunicipales [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> puntoDeVenta [
	
	^ self invoice formattedPrefix 
]

{ #category : #acccessing }
CitiVentasComprobantesFileRow >> tipoCambio [
	
	^ '0001000000'
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> tipoComprobante [

	^ self invoice afipTipoComprobante
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> tipoMoneda [
	
	^ 'PES'
]

{ #category : #'as yet unclassified' }
CitiVentasComprobantesFileRow >> total [
	
	^ self formatNumber: self invoice total withZeros: 15
]
