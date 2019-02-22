Class {
	#name : #ObjectQueryStrategy,
	#superclass : #YavuObject,
	#instVars : [
		'objectQueriedClass',
		'date'
	],
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'sin categoria' }
ObjectQueryStrategy class >> forClass: aTransactionClass [
	
	^self new objectQueriedClass: aTransactionClass
]

{ #category : #'sin categoria' }
ObjectQueryStrategy >> date [

	^date
]

{ #category : #'sin categoria' }
ObjectQueryStrategy >> date: aDate [

	date:= aDate
]

{ #category : #'as yet unclassified' }
ObjectQueryStrategy >> dateLabel [

	^'Fecha'
]

{ #category : #'sin categoria' }
ObjectQueryStrategy >> defaultDate: aDate [

	date:= aDate
]

{ #category : #'as yet unclassified' }
ObjectQueryStrategy >> descriptionDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new
		componentClass: MADateSelectorComponent;
        	accessor: #date;
        	label: self dateLabel;
        	priority: 200;
        	yourself
]

{ #category : #'sin categoria' }
ObjectQueryStrategy >> objectQueriedClass [

	^objectQueriedClass
]

{ #category : #'sin categoria' }
ObjectQueryStrategy >> objectQueriedClass: aClass [

	objectQueriedClass:= aClass
]
