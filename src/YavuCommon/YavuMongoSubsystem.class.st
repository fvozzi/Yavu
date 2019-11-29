Class {
	#name : #YavuMongoSubsystem,
	#superclass : #YavuStoredSubsystem,
	#instVars : [
		'repository'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #initialization }
YavuMongoSubsystem >> initialize [ 

	super initialize.
	repository := VOMongoRepository host: 'localhost' 	database: 'yavuSystem'.
	repository enableSingleton
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOf: aClass [ 
	
	^repository selectAll: aClass
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> store: aSicUser [ 
	
	
	aSicUser save
]
