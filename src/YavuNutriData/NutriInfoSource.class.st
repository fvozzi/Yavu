Class {
	#name : #NutriInfoSource,
	#superclass : #NutritionalSource,
	#category : #'YavuNutriData-Model'
}

{ #category : #'as yet unclassified' }
NutriInfoSource >> searchFoodCompositionStartingWith: aString [ 
	
	^self reader searchFoodCompositionStartingWith: aString
]

{ #category : #'as yet unclassified' }
NutriInfoSource >> xmlFilePath [
	^ '/home/user/dev/websic/data/nutridata/' , 'nutriInfo.xml'
]
