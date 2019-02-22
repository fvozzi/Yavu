Class {
	#name : #PackageOfReports,
	#superclass : #Entity,
	#instVars : [
		'numberOfReports',
		'packagePrice',
		'surplusReportPrice'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
PackageOfReports class >> default [
	"Devuelve el paquete de informes básicos, sin ningún informe incluído."
	
	^self atName: 'Básico' ifAbsent: [super default]
]

{ #category : #'sin categoria' }
PackageOfReports class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Paquete de Reportes'
]

{ #category : #'sin categoria' }
PackageOfReports >> amountOnEmissions: montlhyReports [

	| susplusReports |
	
	susplusReports := (montlhyReports - self numberOfReports) max: 0.
	^self packagePrice + (susplusReports * self surplusReportPrice) 
]

{ #category : #'sin categoria' }
PackageOfReports >> initialize [ 

	super initialize.
	numberOfReports := packagePrice := surplusReportPrice := 0
]

{ #category : #'sin categoria' }
PackageOfReports >> numberOfReports [

	^numberOfReports
]

{ #category : #'sin categoria' }
PackageOfReports >> numberOfReports: unNumero [

	numberOfReports:= unNumero
]

{ #category : #'sin categoria' }
PackageOfReports >> numberOfReportsDescription [
	"Devuelve un objeto que describe la representación de la variable cantidad de informes del receptor."

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #numberOfReports;
        	label: 'Cantidad de informes incluídos';
        	priority: 120;
		required: true;
        	yourself
]

{ #category : #'sin categoria' }
PackageOfReports >> packagePrice [
	
	^packagePrice
]

{ #category : #'sin categoria' }
PackageOfReports >> packagePrice: unNumero [
	
	packagePrice:= unNumero
]

{ #category : #'sin categoria' }
PackageOfReports >> packagePriceDescription [
	"Devuelve un objeto que describe la representación de la variable precio basico del receptor."

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #packagePrice;
        	label: 'Precio del paquete básico';
        	priority: 130;
		required: true;
        	yourself
]

{ #category : #'sin categoria' }
PackageOfReports >> surplusReportPrice [
	
	^surplusReportPrice
]

{ #category : #'sin categoria' }
PackageOfReports >> surplusReportPrice: unNumero [
	
	surplusReportPrice:= unNumero
]

{ #category : #'sin categoria' }
PackageOfReports >> surplusReportPriceDescription [
	"Devuelve un objeto que describe la representación de la variable precio basico del receptor."

	<magritteDescription>
	^MANumberDescription new 
        	accessor: #surplusReportPrice;
        	label: 'Precio del informe excedente';
        	priority: 140;
		required: true;
        	yourself
]
