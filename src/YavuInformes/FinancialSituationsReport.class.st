Class {
	#name : #FinancialSituationsReport,
	#superclass : #ReportData,
	#instVars : [
		'amountOfFinancialSituations',
		'higherDebt',
		'lowerDebt',
		'lastUpdate',
		'oldUpdate',
		'minDebtDate',
		'maxDebtDate',
		'totalDebt'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
FinancialSituationsReport class >> defaultObjectQueryStrategy [

	^NullQueryStrategy forClass: self
]

{ #category : #'sin categoria' }
FinancialSituationsReport class >> entityClass [
	
	^Commerce
]

{ #category : #'sin categoria' }
FinancialSituationsReport class >> entityLabel [

	^'Comercio'
]

{ #category : #'sin categoria' }
FinancialSituationsReport class >> instancesFor: anEntity [

	^(anEntity financialSituationsReport) asArray asOrderedCollection
]

{ #category : #'sin categoria' }
FinancialSituationsReport class >> instancesFrom: startDate to: endDate for: anEntity [

	^self instancesFor: anEntity
]

{ #category : #'sin categoria' }
FinancialSituationsReport class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Actualizaciones de Situaciones Financieras'
]

{ #category : #'sin categoria' }
FinancialSituationsReport class >> waTableReportColumns2 [

	^OrderedCollection new
			add: (WAReportColumn	selector: #entity title: self entityLabel);	
			add: (WAReportColumn	new 
					selector: #amountOfFinancialSituations;
					title: 'Cantidad';
					hasTotal: true;
					cssClass: 'numericColumn';
					yourself);
			add: (WAReportColumn	new
					selector: #higherDebt;
					title: 'Deuda mayor';
					hasTotal: true;
					cssClass: 'numericColumn';
					yourself);	
			add: (WAReportColumn	new
					selector: #lowerDebt;
					title: 'Deuda menor';
					hasTotal: true;
					cssClass: 'numericColumn';
					yourself);	
			add: (WAReportColumn	new
					selector: #lastUpdate;
					title: 'Última actualización';
					hasTotal: true;
					cssClass: 'dateColumn';
					yourself);	
			add: (WAReportColumn	new
					selector: #oldUpdate;
					title: 'Actualización más antigua';
					hasTotal: true;
					cssClass: 'dateColumn';
					yourself);			
			add: (WAReportColumn	new
					selector: #maxDebtDate;
					title: 'Deuda más reciente';
					hasTotal: true;
					cssClass: 'dateColumn';
					yourself);	
			add: (WAReportColumn	new
					selector: #minDebtDate;
					title: 'Deuda menos reciente';
					hasTotal: true;
					cssClass: 'dateColumn';
					yourself);
			yourself
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> amountOfFinancialSituations [
	
	^ amountOfFinancialSituations
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> amountOfFinancialSituationsDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteContainer>
	^MANumberDescription new 
        	accessor: #amountOfFinancialSituations;
        	label: 'Deudores';
        	priority: 140;
		beRequired;
        	yourself
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> dateDescription [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteContainer>
	^MADateDescription new 
		componentClass: MAMonthYearSelectorComponent;
        	accessor: #date;
        	label: 'Fecha';
        	priority: 110;
		visible: false;  
        	yourself
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> higherDebt [
	^ higherDebt
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> higherDebtDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteContainer>
	^MANumberDescription new 
        	accessor: #higherDebt;
        	label: 'Deuda mayor';
        	priority: 150;
		beRequired;
		beInteger;
        	yourself
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> lastUpdate [

	^ lastUpdate ddmmyyyy
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> lastUpdateDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteContainer>
	^MADateDescription new 
        	accessor: #lastUpdate;
        	label: 'Última actualización';
        	priority: 170;
		beRequired;
        	yourself
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> lowerDebt [

	^ lowerDebt
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> lowerDebtDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteContainer>
	^MANumberDescription new 
        	accessor: #lowerDebt;
        	label: 'Deuda menor';
        	priority: 160;
		beRequired;
        	yourself
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> maxDebtDate [

	^ maxDebtDate ddmmyyyy
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> maxDebtDateDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteContainer>
	^MADateDescription new 
        	accessor: #maxDebtDate;
        	label: 'Deuda más reciente';
        	priority: 200;
		beRequired;
        	yourself
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> minDebtDate [

	^ minDebtDate ddmmyyyy
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> minDebtDateDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteContainer>
	^MADateDescription new 
        	accessor: #minDebtDate;
        	label: 'Deuda más antigua';
        	priority: 190;
		beRequired;
        	yourself
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> oldUpdate [

	^ oldUpdate ddmmyyyy
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> oldUpdateDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteContainer>
	^MADateDescription new 
        	accessor: #oldUpdate;
        	label: 'Imputación más antigua';
        	priority: 180;
		beRequired;
        	yourself
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> totalDebt [

	^totalDebt asInteger 
]

{ #category : #'sin categoria' }
FinancialSituationsReport >> totalDebtDescription [
	"Devuelve un objeto que describe la representación de la variable clase del receptor."

	<magritteContainer>
	^MANumberDescription new 
        	accessor: #totalDebt;
        	label: 'Deuda total';
        	priority: 145;
		beRequired;
		beInteger;
        	yourself
]
