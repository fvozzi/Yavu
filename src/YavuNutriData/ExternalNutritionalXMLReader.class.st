"
Esta clase abstrae el acceso a bases nutricionales externas accesibles desde un XML. Dentro de nutridata se puede usar para acceder al XML de SARA o al XML de NutriInfo.

Deberiamos usar una instancia de esta clase para cada acceso y ese acceso al ser de solo lectura deberia ser global a todos los usuarios de este image.
"
Class {
	#name : #ExternalNutritionalXMLReader,
	#superclass : #YvObject,
	#instVars : [
		'xmlDocument'
	],
	#category : #'YavuNutriData-Model'
}

{ #category : #'as yet unclassified' }
ExternalNutritionalXMLReader class >> on: aString [ 
	
	 ^self new initializeXMLDocument: aString
]

{ #category : #'api/queries' }
ExternalNutritionalXMLReader >> foodAtCode: aString [ 
	
	| element |
	
	element := (xmlDocument allElementsNamed: 'AlimentoyComposicion')
					detect: [ :one | (one contentStringAt: 'Codigo') = aString ] ifNone: [ ^FoodComposition new ].
	^FoodComposition fromExternalXMLElement: element
]

{ #category : #initialization }
ExternalNutritionalXMLReader >> initializeXMLDocument: aString [ 

	xmlDocument := XMLDOMParser parse: aString
]

{ #category : #'as yet unclassified' }
ExternalNutritionalXMLReader >> searchFoodCompositionStartingWith: aString [ 
	
	| elements |
	
	elements := (xmlDocument allElementsNamed: 'AlimentoyComposicion')
					select: [ :one | (one contentStringAt: 'Alimento') beginsWith: aString ].
	^elements collect: [:element | FoodComposition fromExternalXMLElement: element]
]
