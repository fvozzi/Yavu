Class {
	#name : #ReportEmission,
	#superclass : #YavuTransaction,
	#instVars : [
		'customer',
		'user',
		'reportKind'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
ReportEmission class >> customer: unComercio date: unaFecha user: unUsuario customer: unCliente [
	"Devuelve una nueva instancia del receptor inicializada con unComercio, unaFecha y unUsuario."
	
	^(super entity: unComercio date: unaFecha) initializeUser: unUsuario customer: unCliente
]

{ #category : #'sin categoria' }
ReportEmission class >> descripcion [
	"Answer the receiver description string."
	
	^'Emisión de Informe'
]

{ #category : #'sin categoria' }
ReportEmission class >> entityClass [

	^Commerce
]

{ #category : #'sin categoria' }
ReportEmission class >> instancesFrom: startDate to: endDate for: anEntity [

	^(anEntity emisionesDeInformesDesde: startDate hasta: endDate) asArray asOrderedCollection
]

{ #category : #'sin categoria' }
ReportEmission class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Emisión de Reporte'
]

{ #category : #'as yet unclassified' }
ReportEmission class >> waTableReportColumns [

	^super waTableReportColumns
			add: (WAReportColumn	new selector: #customer; title: 'Informe emitido para'; yourself);
			add: (WAReportColumn	new selector: #user; title: 'Informe emitido por'; yourself);		
			yourself		
]

{ #category : #accessing }
ReportEmission >> customer [

	^customer
]

{ #category : #'as yet unclassified' }
ReportEmission >> customerDescription [
	"Devuelve un objeto que describe la representación de la variable cliente del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #customer;
		default: nil;
		options: OrderedCollection new;
		label: 'Informe emitido para';
		priority: 120;
		beRequired;
		yourself

]

{ #category : #'sin categoria' }
ReportEmission >> initializeUser: unUsuario customer: unCliente [
	"Inicializa las variables usuario y cliente del receptor con unUsuario y unCliente."
	
	user := unUsuario.
	customer := unCliente
]

{ #category : #accessing }
ReportEmission >> reportKind [
	
	^ reportKind
]

{ #category : #accessing }
ReportEmission >> reportKind: anObject [
	
	reportKind := anObject
]

{ #category : #'as yet unclassified' }
ReportEmission >> reportKindDescription [
	"Devuelve un objeto que describe la representación de la variable cliente del receptor."

	<magritteDescription>
	^MAStringDescription new
		accessor: #reportKind;
		default: nil;
		label: 'Tipo de Reporte';
		priority: 140;
		beRequired;
		yourself

]

{ #category : #accessing }
ReportEmission >> user [

	^user
]

{ #category : #'as yet unclassified' }
ReportEmission >> userDescription [
	"Devuelve un objeto que describe la representación de la variable usuario del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #user;
		default: nil;
		options: OrderedCollection new;
		label: 'Informe emitido por';
		priority: 140;
		beRequired;
		yourself
]
