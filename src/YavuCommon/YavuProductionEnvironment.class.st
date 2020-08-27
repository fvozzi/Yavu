Class {
	#name : #YavuProductionEnvironment,
	#superclass : #YavuEnvironment,
	#category : #'YavuCommon-Environment'
}

{ #category : #seaside }
YavuProductionEnvironment class >> fontAwesomeLibrary [
	
	^ FAWDeploymentLibrary
]

{ #category : #seaside }
YavuProductionEnvironment class >> jqLibrary [
	
	^ JQDeploymentLibrary
]

{ #category : #mongo }
YavuProductionEnvironment class >> mongoDatabaseName [

 ^ CurrentSystemClass mongoDatabaseName
]

{ #category : #seaside }
YavuProductionEnvironment class >> resourceBaseUrl [
	^ 'http://lagoonbeer.com.ar:8081'
]

{ #category : #seaside }
YavuProductionEnvironment class >> restaurantApplicationMenu [

	^ 'antimenu' 
]

{ #category : #seaside }
YavuProductionEnvironment class >> seasideApplicationName [
	
	^ CurrentSystemClass seasideApplicationName
]

{ #category : #seaside }
YavuProductionEnvironment class >> tbsLibrary [
	
	^ SBSDeploymentLibrary
]
