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

	self halt.
	super initialize.
	repository := VOMongoRepository host: 'localhost' 	database: 'yavuSystem'.
	repository enableSingleton
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOf: aClass [ 
	
	^repository selectAll: aClass
]

{ #category : #'As yet unclassified' }
YavuMongoSubsystem >> remove: aYavuObject [ 
	
	aYavuObject remove
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> save: aYavuObject [ 
	
	aYavuObject save
]
