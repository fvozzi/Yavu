Class {
	#name : #Commerce,
	#superclass : #Entity,
	#instVars : [
		'cuit',
		'address',
		'company',
		'inputStrategy'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
Commerce class >> allForCompany: aCompany [
	"Devuelve todas las intancias del receptor en el sistema."

	^self yavuSystem readManyOf: self where: [:each | each company  = aCompany]
]

{ #category : #'as yet unclassified' }
Commerce class >> allForCompany: aCompany searchSelector: aSearchSelector searchValue: aSearchValue [
	"Devuelve todas las intancias del receptor en el sistema."

	aSearchValue isEmpty ifTrue: [ ^self allForCompany: aCompany].
	^self yavuSystem readManyOf: self 
		where: [:each | each company  = aCompany AND: [(each perform: aSearchSelector) asUppercase like: aSearchValue, '%']]
]

{ #category : #'as yet unclassified' }
Commerce class >> atName: aName company: aCompany [

	^(self yavuSystem readOneOf: self where: [:each | each name  = aName AND: [each company = aCompany]])
]

{ #category : #'sin categoria' }
Commerce class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Comercio'
]

{ #category : #quering }
Commerce >> abonoMensualVigenteAl: unaFecha [

	^self monthlyPayments asSortedCollection asOrderedCollection reverse
		detect: [:one | one date <= unaFecha] ifNone: []
]

{ #category : #quering }
Commerce >> abonosMensualesFrom: startDate to: endDate [


	| startTimestamp endTimestamp |
	startTimestamp := TimeStamp date: startDate time: '0' asTime.
	endTimestamp :=  TimeStamp date: endDate time: '23:59' asTime.
	^self monthlyPayments select: [:each | each date between: startTimestamp and: endTimestamp]
]

{ #category : #accessing }
Commerce >> address [
	^ address
]

{ #category : #accessing }
Commerce >> address: anObject [
	address := anObject
]

{ #category : #quering }
Commerce >> amountOfFinancialSituations [
	
	^(FinancialSituationsReport instancesFor: self) inject: 0 into: [:accum :each | accum + each amountOfFinancialSituations]
]

{ #category : #quering }
Commerce >> bouncedChecks [

	^self yavuSystem readManyOf: BouncedCheck  where: [:each | each entity = self] 
]

{ #category : #quering }
Commerce >> bouncedChecksWithoutPayment [

	^self yavuSystem readManyOf: BouncedCheck  where: [:each | each entity = self AND: [each paymentDate = nil OR: [each finePaymentDate = nil]]]
]

{ #category : #accessing }
Commerce >> company [
	^ company
]

{ #category : #accessing }
Commerce >> company: anObject [
	company := anObject
]

{ #category : #printing }
Commerce >> companyDescription [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #company;
		label: 'Empresa';
		priority: 120;
		options: Company all;
		beSorted;
		beRequired;
		yourself
]

{ #category : #accessing }
Commerce >> createFileOfFinancialSituations [

	| file separator |
	
	file := StandardFileStream forceNewFileNamed: self nameOfFileOfFinancialSituations.
	separator := ';'.
	file nextPutAll: 'Cliente; Fecha; Fecha Deuda; Deuda; Tipo Operacion; Caracter Operacion'.
	self financialSituations do: [ :each |
		file 
			cr;
			nextPutAll: each customer name; nextPutAll: separator;
			nextPutAll: each date ddmmyyyy; nextPutAll: separator;
			nextPutAll: each fechaUltimoPago ddmmyyyy; nextPutAll: separator;			
			nextPutAll: each montoAdeudado printString ; nextPutAll: separator;									
			nextPutAll: each operationType name ; nextPutAll: separator;		
			nextPutAll: each operationCharacter name ; nextPutAll: separator	
		 ].
	file close
]

{ #category : #accessing }
Commerce >> cuit [
	^ cuit
]

{ #category : #accessing }
Commerce >> cuit: anObject [
	cuit := anObject
]

{ #category : #quering }
Commerce >> emisionesDeInformesDesde: startDate hasta: endDate [

	| startTimestamp endTimestamp |
	
	startTimestamp := TimeStamp date: startDate time: '0' asTime.
	endTimestamp :=  TimeStamp date: endDate time: '23:59' asTime.
	^self yavuSystem readManyOf: ReportEmission where: [:each | each entity = self AND: [each date between: startTimestamp and: endTimestamp]]
]

{ #category : #accessing }
Commerce >> financialSituationCurrentAt: aDate customer: aPerson [

	^FinancialSituation instanceCurrentAt: aDate entity: self customer: aPerson
 
	
	
]

{ #category : #quering }
Commerce >> financialSituations [

	^self yavuSystem readManyOf: FinancialSituation where: [:each | each entity = self]
]

{ #category : #quering }
Commerce >> financialSituationsReport [

	^self yavuSystem readManyOf: FinancialSituationsReport where: [:each | each entity = self]
]

{ #category : #accessing }
Commerce >> inputAmountOfDebt [

	^self inputStrategy inputAmountOfDebt 
]

{ #category : #accessing }
Commerce >> inputStrategy [
	
	^ inputStrategy
]

{ #category : #accessing }
Commerce >> inputStrategy: anObject [
	
	inputStrategy := anObject
]

{ #category : #printing }
Commerce >> inputStrategyDescription [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #inputStrategy;
		label: 'Estrategía de ingreso';
		priority: 140;
		options: FinancialSituationInputStrategy allSubclasses;
		beSorted;
		beRequired;
		yourself
]

{ #category : #quering }
Commerce >> invoiceForMonth: aMonth [

	^Invoice entity: self date: aMonth beginOfMonth
]

{ #category : #quering }
Commerce >> invoicesFrom: startDate to: endDate [
	
	| fromDate invoices |
	fromDate := startDate.
	invoices:= OrderedCollection new.
	[fromDate <= endDate] whileTrue: [
		invoices add: (self invoiceForMonth: fromDate).
		fromDate:= fromDate addMonths: 1].
	^invoices
]

{ #category : #quering }
Commerce >> monthlyPayments [

	^self yavuSystem readManyOf: MonthlyPayment where: [:each | each entity id = self id]
]

{ #category : #accessing }
Commerce >> nameOfFileOfFinancialSituations [

	^('/informes/', self name, '.csv') asFileReference
]
