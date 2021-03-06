Class {
	#name : #YavuNutriDataSystem,
	#superclass : #YavuSystem,
	#category : #'YavuNutriData-Environment'
}

{ #category : #initialization }
YavuNutriDataSystem class >> initializeSubsystemsForTesting [

	self enabledSubsystemsClasses: (Array 
											with: YavuTransientSubsystem 
											with: YavuNutritionalSourcesSubsystem)
]

{ #category : #'as yet unclassified' }
YavuNutriDataSystem class >> systemName [
	
	^ 'YavuNutriData'
]

{ #category : #'as yet unclassified' }
YavuNutriDataSystem >> searchFoodCompositionByID: anInteger in: aNutriInfoSource [ 

	^aNutriInfoSource searchFoodCompositionByID: anInteger 
]

{ #category : #'as yet unclassified' }
YavuNutriDataSystem >> searchFoodCompositionStartingWith: aString in: aNutriInfoSource [ 
	
	^aNutriInfoSource searchFoodCompositionStartingWith: aString
]
