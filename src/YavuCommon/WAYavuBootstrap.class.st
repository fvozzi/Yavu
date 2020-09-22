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

{ #category : #updating }
WAYavuBootstrap >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
	anHtmlRoot meta
        name: 'viewport';
        content: 'width=device-width, initial-scale=1.0'
]

{ #category : #'sin categoria' }
WAYavuBootstrap >> yavuSystem [ 

	^ self session yavuSystem 
]
