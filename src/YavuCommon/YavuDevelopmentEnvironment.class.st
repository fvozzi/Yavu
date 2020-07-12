Class {
	#name : #YavuDevelopmentEnvironment,
	#superclass : #YavuEnvironment,
	#category : #'YavuCommon-Environment'
}

{ #category : #seaside }
YavuDevelopmentEnvironment class >> fontAwesomeLibrary [
	
	^ FAWDevelopmentLibrary
]

{ #category : #seaside }
YavuDevelopmentEnvironment class >> jqLibrary [
	
	^ JQDevelopmentLibrary
]

{ #category : #mongo }
YavuDevelopmentEnvironment class >> mongoDatabaseName [

 ^ 'yavuSystem'
]

{ #category : #seaside }
YavuDevelopmentEnvironment class >> tbsLibrary [
	
	^ SBSDevelopmentLibrary
]
