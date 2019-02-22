Class {
	#name : #Invoice,
	#superclass : #Transaction,
	#instVars : [
		'elements'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
Invoice class >> defaultObjectQueryStrategy [

	^FromToQueryMontlyStrategy forClass: self
	
]

{ #category : #'sin categoria' }
Invoice class >> entityClass [
	
	^Commerce
]

{ #category : #'sin categoria' }
Invoice class >> instancesFrom: startDate to: endDate for: anEntity [

	^anEntity invoicesFrom: startDate to: endDate
]

{ #category : #'sin categoria' }
Invoice class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Consumo mensual'
]

{ #category : #'sin categoria' }
Invoice class >> waTableReportColumns [

	^super waTableReportColumns
			add: (WAReportColumn	new 
					selector: #cantidadDeEmisiones;
					title: 'Cantidad';
					hasTotal: true;
					cssClass: 'numericColumn';
					yourself);
			add: (WAReportColumn	new
					selector: #montoTotal;
					title: 'Monto';
					hasTotal: true;
					cssClass: 'numericColumn';
					yourself);		
			yourself		
]

{ #category : #'sin categoria' }
Invoice >> cantidadDeEmisiones [

	^self elements size
]

{ #category : #'sin categoria' }
Invoice >> comercio [

	^self entity
]

{ #category : #'as yet unclassified' }
Invoice >> descriptionCantidadDeInformes [
	"Devuelve un objeto que describe la representación de la variable cliente del receptor."

	<magritteDescription>
	^MANumberDescription new
		accessor: #cantidadDeEmisiones;
		label: 'Cantidad';
		priority: 120;
		beRequired;
		yourself
]

{ #category : #'as yet unclassified' }
Invoice >> descriptionMontoTotal [
	"Devuelve un objeto que describe la representación de la variable cliente del receptor."

	<magritteDescription>
	^MANumberDescription new
		accessor: #montoTotal;
		label: 'Monto total';
		priority: 140;
		beReadonly;
		beRequired;
		yourself
]

{ #category : #'sin categoria' }
Invoice >> elements [

	elements isNil ifTrue: [self initializeElements].
	^elements
]

{ #category : #'sin categoria' }
Invoice >> endDate [

	^self date endOfMonth
]

{ #category : #'sin categoria' }
Invoice >> initializeElements [

	self entity isNil ifTrue: [^OrderedCollection new].
	elements:= self entity emisionesDeInformesDesde: self startDate hasta: self endDate
]

{ #category : #'sin categoria' }
Invoice >> montoTotal [

	| abonoMensualVigente |
	
	abonoMensualVigente := self comercio abonoMensualVigenteAl: self startDate.
	^(abonoMensualVigente ifNil: [MonthlyPayment new ]) packageOfReports    amountOnEmissions: self cantidadDeEmisiones
]

{ #category : #'sin categoria' }
Invoice >> startDate [

	^self date beginOfMonth
]
