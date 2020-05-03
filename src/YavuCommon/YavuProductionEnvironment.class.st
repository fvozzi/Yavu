Class {
	#name : #YavuProductionEnvironment,
	#superclass : #YavuEnvironment,
	#category : #'YavuCommon-Environment'
}

{ #category : #'as yet unclassified' }
YavuProductionEnvironment >> jqLibrary [
	
	^ JQDeploymentLibrary
]

{ #category : #'as yet unclassified' }
YavuProductionEnvironment >> seasideApplicationName [
	
	^ self class currentSystem companyName
]

{ #category : #'as yet unclassified' }
YavuProductionEnvironment >> tbsLibrary [
	
	^ TBSDeploymentLibrary
]
