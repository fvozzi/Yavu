Class {
	#name : #YavuProductionEnvironment,
	#superclass : #YavuEnvironment,
	#category : #'YavuCommon-Environment'
}

{ #category : #seaside }
YavuProductionEnvironment class >> configureWAAdmin [

	super configureWAAdmin.
	WAAdmin disableDevelopmentTools
]

{ #category : #'as yet unclassified' }
YavuProductionEnvironment class >> deploymentMode [

	^ true
]

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
	^ 'https://www.laesquinadelantigourmet.com.ar'
]

{ #category : #seaside }
YavuProductionEnvironment class >> restaurantApplicationMenu [

	^ 'antimenu' 
]

{ #category : #seaside }
YavuProductionEnvironment class >> seasideApplicationName [
	
	^ CurrentSystemClass seasideApplicationName
]

{ #category : #'as yet unclassified' }
YavuProductionEnvironment class >> serverPath [

	^ 'app' 
]

{ #category : #seaside }
YavuProductionEnvironment class >> tbsLibrary [
	
	^ SBSDeploymentLibrary
]
