Class {
	#name : #FromToQueryStrategy,
	#superclass : #ObjectQueryStrategy,
	#instVars : [
		'otherDate'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'as yet unclassified' }
FromToQueryStrategy >> dateLabel [

	^'Fecha desde'
]

{ #category : #'as yet unclassified' }
FromToQueryStrategy >> descriptionToDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new 
		componentClass: MADateSelectorComponent;
        	accessor: #toDate;
        	label: 'Fecha hasta';
        	priority: 200;
        	yourself
]

{ #category : #'sin categoria' }
FromToQueryStrategy >> fromDate [

	^date
]

{ #category : #'sin categoria' }
FromToQueryStrategy >> toDate [

	^otherDate
]

{ #category : #'sin categoria' }
FromToQueryStrategy >> toDate: aDate [

	otherDate:= aDate
]

{ #category : #'sin categoria' }
FromToQueryStrategy >> transactionsForEntities: anEntities [

	^anEntities
		inject: OrderedCollection new 
		into: [:accum :each | 
			accum 
				addAll: (self objectQueriedClass instancesFrom: self fromDate to: self toDate for: each); 
				yourself
		] 
]
