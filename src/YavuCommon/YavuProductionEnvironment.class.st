Class {
	#name : #YavuProductionEnvironment,
	#superclass : #YavuEnvironment,
	#category : #'YavuCommon-Environment'
}

{ #category : #seaside }
YavuProductionEnvironment class >> configureWAAdmin [

	super configureWAAdmin.
	WAAdmin disableDevelopmentTools.
	self setAuthenticationToConfigurationTool
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
YavuProductionEnvironment class >> setAuthenticationToConfigurationTool [

| application |
application := WADispatcher default handlerAt: 'config'.
application configuration 
    addParent: WAAuthConfiguration instance.
application
    preferenceAt: #login put: 'admin';
    preferenceAt: #passwordHash put: #[107 102 188 57 115 70 72 203 153 208 109 84 135 166 246 213 203 239 71 231].
application
    addFilter: WAAuthenticationFilter new.
]

{ #category : #seaside }
YavuProductionEnvironment class >> tbsLibrary [
	
	^ SBSDeploymentLibrary
]
