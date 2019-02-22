Class {
	#name : #NullQueryStrategy,
	#superclass : #ObjectQueryStrategy,
	#category : #'YavuCommon-BaseModel'
}

{ #category : #'as yet unclassified' }
NullQueryStrategy >> descriptionDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new
		componentClass: MADateSelectorComponent;
        	accessor: #date;
        	label: self dateLabel;
        	priority: 200;
		visible: false;
        	yourself
]

{ #category : #'sin categoria' }
NullQueryStrategy >> transactionsForEntities: anEntities [

	^anEntities
		inject: OrderedCollection new 
		into: [:accum :each | 
			accum 
				addAll: (self objectQueriedClass instancesFor: each); 
				yourself
		] 
]
