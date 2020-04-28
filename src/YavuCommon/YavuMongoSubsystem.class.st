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
	repository := VOMongoRepository host: 'localhost' database: YavuEnvironment current mongoDatabaseName.
	repository enableSingleton
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOf: aClass [ 
	
	^repository selectAll: aClass
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOfClass: aClass from: startDate to: anotherDate entities: aCollection [ 
	
	^ (repository selectAll: aClass) 
		select: [:each | 
			(aCollection includes: each entity)
				and: [each date between: startDate and: anotherDate ] ]
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOfClass: aClass withEntity: aYavuSupplier [ 
	
	^ (repository 
		selectAll: aClass) select: [ :each | each entity = aYavuSupplier ]
]

{ #category : #'As yet unclassified' }
YavuMongoSubsystem >> remove: aYavuObject [ 
	
	aYavuObject remove
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> save: aYavuObject [ 
	
	aYavuObject save
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> update: aYavuObject [ 
	
	aYavuObject save
]
