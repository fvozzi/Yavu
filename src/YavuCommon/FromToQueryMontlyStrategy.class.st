Class {
	#name : #FromToQueryMontlyStrategy,
	#superclass : #FromToQueryStrategy,
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'as yet unclassified' }
FromToQueryMontlyStrategy >> descriptionDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new 
		componentClass: MAMonthYearSelectorComponent;
        	accessor: #date;
        	label: 'Fecha desde';
        	priority: 200;
        	yourself
]

{ #category : #'as yet unclassified' }
FromToQueryMontlyStrategy >> descriptionToDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new 
		componentClass: MAMonthYearSelectorComponent;
        	accessor: #toDate;
        	label: 'Fecha hasta';
        	priority: 200;
        	yourself
]
