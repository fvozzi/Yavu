"
Esta clase modela la abstracción para agrupar cada fuente nutricional que agreguemos al sistema. Es una clase abstracta y deberian existir tantas subclases como fuentes de datos existan en el sistema.

"
Class {
	#name : #NutritionalSource,
	#superclass : #YvObject,
	#instVars : [
		'reader'
	],
	#category : #'YavuNutriData-Model'
}

{ #category : #initialization }
NutritionalSource >> initializeReader [

	^reader := ExternalNutritionalXMLReader on: self xmlStream
]

{ #category : #accessing }
NutritionalSource >> reader [

	reader ifNil:  [ self initializeReader ].
	^reader
]

{ #category : #'as yet unclassified' }
NutritionalSource >> searchFoodCompositionByID: anInteger [ 

	 ^self reader foodAtCode: anInteger
]

{ #category : #'as yet unclassified' }
NutritionalSource >> xmlStream [
	| xmlFile |
	xmlFile := MultiByteFileStream fileNamed: self xmlFilePath asFileReference.
	xmlFile converter: UTF8TextConverter new.
	^xmlFile
]
