Class {
	#name : #YavuSystemMigration,
	#superclass : #YavuObject,
	#category : #'YavuCommon-Migrations'
}

{ #category : #accessing }
YavuSystemMigration class >> description [ 

	^ self subclassResponsibility 
]

{ #category : #accessing }
YavuSystemMigration class >> logMigrationSuccessful [

	^ YavuSystemMigrationLog new
		migrationIdentifier: self migrationIdentifier;
		description: self description;
		executionDate: DateAndTime now;
		addToSystem
]

{ #category : #accessing }
YavuSystemMigration class >> migrationIdentifier [

	 ^ self subclassResponsibility 
]

{ #category : #accessing }
YavuSystemMigration class >> run [ 
	
	self wasAlreadyRun ifFalse: [  
		[ self runMigration ] on: Error do: [ :ex | ^ ex pass ].
		self logMigrationSuccessful]
]

{ #category : #accessing }
YavuSystemMigration class >> shortDescription [ 
	"Short description to identify the migration"
	
	| shortedDescription |
	
	shortedDescription := self description copyFrom: 1 to: (50 min: self description size).
	^ self migrationIdentifier asString, ' - ', shortedDescription, '...'
]

{ #category : #'as yet unclassified' }
YavuSystemMigration class >> wasAlreadyRun [

	^ ((self yavuSystem storedSubsystem instancesOf: YavuSystemMigrationLog)
			detect: [ :one | one migrationIdentifier = self migrationIdentifier ]
			ifNone: [ ]) notNil
]
