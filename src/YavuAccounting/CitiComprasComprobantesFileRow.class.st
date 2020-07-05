Class {
	#name : #CitiComprasComprobantesFileRow,
	#superclass : #CitiFileRow,
	#category : #'YavuAccounting-AFIPUtilities'
}

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> cantidadAlicuotasIVA [
	
	^ self invoice amountOfVatAlicuot asString
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> codigoDeOperacion [
	
	^ '0'
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> codigoDocumentoVendedor [
	
	^ '80'
]

{ #category : #accessing }
CitiComprasComprobantesFileRow >> columns [
	"Answer the columns of the receiver output file."

	^ #(fecha tipoComprobante puntoDeVenta numeroComprobante despachoImportacion codigoDocumentoVendedor numeroDocumentoVendedor denominacionVendedor total noGravado percepcionANoCategorizados importeExentos importeDePercepcionesNacionales percepcionIIBB	 percepcionesImpuestosMunicipales impuestosInternos tipoMoneda tipoCambio cantidadAlicuotasIVA codigoDeOperacion creditoFiscalComputable #otrosTributos cuitEmisorCorredor denominacionDelEmisor ivaComision)
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> creditoFiscalComputable [

	^ self formatNumber: self invoice vat210 + self invoice vat105 withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> cuitEmisorCorredor [
	
	^ self yavuSystem completeString: '0' withZeros: 11
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> denominacionDelEmisor [
	
	^ '                              '
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> denominacionVendedor [
	
	^ (self invoice entity name, '                              ' ) copyFrom: 1 to: 30
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> despachoImportacion [
	^ '                ' 
]

{ #category : #acccessing }
CitiComprasComprobantesFileRow >> fecha [
	
	^ self invoice date yyyymmdd copyReplaceAll: '-' with: ''
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> importeDePercepcionesNacionales [
	
	^ self formatNumber: self invoice vatPerception withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> importeExentos [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> impuestosInternos [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> ivaComision [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> noGravado [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> numeroComprobante [

	^ self yavuSystem completeString: self invoice invoiceNumber asString withZeros: 20
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> numeroDocumentoVendedor [
	
	^ self yavuSystem completeString: self invoice entity cuitNumber  withZeros: 20 
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> otrosTributos [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> percepcionANoCategorizados [
			
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> percepcionIIBB [
	
	^ self formatNumber: self invoice iibbPerception withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> percepcionesImpuestosMunicipales [
	
	^ self yavuSystem completeString: '0' withZeros: 15
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> puntoDeVenta [
	
	^ self invoice formattedPrefix 
]

{ #category : #'As yet unclassified' }
CitiComprasComprobantesFileRow >> tipoCambio [
	
	^ '0001000000'
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> tipoComprobante [

	^ self invoice invoiceType afipTipoComprobante
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> tipoMoneda [
	
	^ 'PES'
]

{ #category : #'as yet unclassified' }
CitiComprasComprobantesFileRow >> total [
	
	^ self formatNumber: self invoice total withZeros: 15
]
