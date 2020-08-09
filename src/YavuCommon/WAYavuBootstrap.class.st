Class {
	#name : #WAYavuBootstrap,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
WAYavuBootstrap class >> onParent: aWAComponent [

	^ self new initializeParent: aWAComponent 
]

{ #category : #initialization }
WAYavuBootstrap >> initializeParent: aWAComponent [ 

	parent := aWAComponent 
]

{ #category : #rendering }
WAYavuBootstrap >> rendererClass [
	
	^ SBSHtmlCanvas 
]

{ #category : #'sin categoria' }
WAYavuBootstrap >> yavuSystem [ 

	^ self session yavuSystem 
]
