Class {
	#name : #MonthlyPayment,
	#superclass : #YavuTransaction,
	#instVars : [
		'packageOfReports'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
MonthlyPayment class >> all [
	"Devuelve todas las intancias del receptor en el sistema."

	^self empresaActual commerces 
		inject: OrderedCollection new
		into: [:accum :each | accum addAll: each monthlyPayments; yourself]
]

{ #category : #'sin categoria' }
MonthlyPayment class >> allForCompany: aCompany [
	"Devuelve todas las intancias del receptor en el sistema."
	

	^self all
]

{ #category : #'as yet unclassified' }
MonthlyPayment class >> allForCompany: aCompany searchSelector: aSearchSelector searchValue: aSearchValue [
	"Devuelve todas las intancias del receptor en el sistema."

	aSearchValue isEmpty ifTrue: [ ^self allForCompany: aCompany].
	^self yavuSystem readManyOf: self 
		where: [:each | each entity company  = aCompany AND: [(each perform: aSearchSelector) name asUppercase like: aSearchValue, '%']]
]

{ #category : #'sin categoria' }
MonthlyPayment class >> defaultPackageOfReports [

	^PackageOfReports default
]

{ #category : #'sin categoria' }
MonthlyPayment class >> entityClass [

	^Commerce
]

{ #category : #nil }
MonthlyPayment class >> entityLabel [

	^'Comercio'
]

{ #category : #'sin categoria' }
MonthlyPayment class >> instancesFrom: startDate to: endDate for: anEntity [

	^anEntity abonosMensualesFrom: startDate to: endDate
]

{ #category : #'sin categoria' }
MonthlyPayment class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Abono mensual'
]

{ #category : #'sin categoria' }
MonthlyPayment class >> waTableReportColumns [

	^super waTableReportColumns
			add: (WAReportColumn	new 
					selector: #packageOfReports;
					title: 'Paquete mensual';
					yourself);
			yourself		
]

{ #category : #'sin categoria' }
MonthlyPayment >> date: unaFecha [	
	
	super date: unaFecha beginOfMonth
]

{ #category : #'as yet unclassified' }
MonthlyPayment >> defaultPackageOfReports [

	^self class defaultPackageOfReports
]

{ #category : #'as yet unclassified' }
MonthlyPayment >> eliminar [
	"Elimina la instancia del receptor a la colección de elementos del owner."
	
	self yavuSystem requireUnitOfWork.
	self yavuSystem delete: self.
	self yavuSystem commitUnitOfWork 
	
]

{ #category : #'as yet unclassified' }
MonthlyPayment >> packageOfReports [

	packageOfReports isNil ifTrue: [packageOfReports := self defaultPackageOfReports].
	^packageOfReports
]

{ #category : #'sin categoria' }
MonthlyPayment >> packageOfReports: unPaquete [

	packageOfReports:= unPaquete
]

{ #category : #'as yet unclassified' }
MonthlyPayment >> packageOfReportsDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #packageOfReports;
		default: self defaultPackageOfReports;
		options: PackageOfReports all asOrderedCollection;
		label: 'Paquete de emisión';
		priority: 150;
		beRequired;
		yourself
]
