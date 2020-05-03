Class {
	#name : #YavuDevelopmentEnvironment,
	#superclass : #YavuEnvironment,
	#category : #'YavuCommon-Environment'
}

{ #category : #'as yet unclassified' }
YavuDevelopmentEnvironment >> jqLibrary [
	
	^ JQDevelopmentLibrary
]

{ #category : #'as yet unclassified' }
YavuDevelopmentEnvironment >> seasideApplicationName [
	
	^ 'yavu'
]

{ #category : #'as yet unclassified' }
YavuDevelopmentEnvironment >> tbsLibrary [
	
	^ TBSDevelopmentLibrary
]
