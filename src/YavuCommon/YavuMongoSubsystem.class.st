Class {
	#name : #YavuMongoSubsystem,
	#superclass : #YavuStoredSubsystem,
	#instVars : [
		'repository'
	],
	#classInstVars : [
		'repository'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #accessing }
YavuMongoSubsystem class >> repository [ 

	repository ifNil: [ 
		repository := VOMongoRepository host: '127.0.0.1' database: YavuEnvironment current mongoDatabaseName.		
	   repository enableSingleton.
		 ].
	^ repository

	
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> existsInstancesOf: aClass dependentOf: aYavuObject referencesMethod: aSymbol [ 
	
	^ (repository selectMany: aClass where: [ :each | 
		(each at: aSymbol asString, '.__id') = (repository idOf: aYavuObject )
		]) notEmpty
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> existsInstancesOf: dependentClass	dependentOfSubcollectionElement: aYavuObject referencesMethod: aSymbol collectionMethod: otherSymbol [
	
	| mongoQuery |

	mongoQuery :=  
   { otherSymbol asString -> { '$elemMatch' -> { aSymbol asString, '.__id' -> (repository idOf: aYavuObject)  } asDictionary } asDictionary}.

	^ (self repository selectMany: dependentClass where: mongoQuery) notEmpty

]

{ #category : #initialization }
YavuMongoSubsystem >> initialize [ 

	super initialize.
	SCRAMSHA1AuthMechanism beDefault.
	repository := VOMongoRepository 
							host: '127.0.0.1' 
							database: YavuEnvironment current mongoDatabaseName
							username: 'fvozzi'
							password: 'Yavusoft2020'
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOf: aClass [ 
	
	^self repository selectAll: aClass
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOfClass: aClass from: startDate to: anotherDate [
	
	^self instancesOfClass: aClass from: startDate to: anotherDate dateSelector: #date
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOfClass: aClass from: startDate to: anotherDate dateSelector: aSymbol [
	
	^ repository selectMany: aClass where: [ :each | 
		((each perform: aSymbol) >= startDate) &  ((each perform: aSymbol) <= anotherDate )
		]
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOfClass: aClass from: startDate to: anotherDate entities: aCollection [ 
	
	^ repository selectMany: aClass where: [ :each | 
		((each at: 'entity.__id') = (repository idOf: aCollection first )) & (each date >= startDate) &  (each date <= anotherDate )
		]
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> instancesOfClass: aClass withEntity: aYavuSupplier [ 
	
	^ repository selectMany: aClass where: [ :each | 
		(each at: 'entity.__id') = (repository idOf: aYavuSupplier )
		]
]

{ #category : #accessing }
YavuMongoSubsystem >> name [ 

	 ^ 'Mongo DB'
]

{ #category : #'As yet unclassified' }
YavuMongoSubsystem >> remove: aYavuObject [ 
	
	self repository remove: aYavuObject.
	aYavuObject onStoreRemoved
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> repository [

	"self class repository".
	
	^ repository 
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> save: aYavuObject [ 
	
	self repository save: aYavuObject
]

{ #category : #'as yet unclassified' }
YavuMongoSubsystem >> update: aYavuObject [ 
	
	self repository save: aYavuObject 
]
