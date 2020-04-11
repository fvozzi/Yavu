Class {
	#name : #BaseDeDatos,
	#superclass : #YvObject,
	#instVars : [
		'connection',
		'connectionSettings'
	],
	#classVars : [
		'Current'
	],
	#category : #'YavuInformes-Persistence'
}

{ #category : #'as yet unclassified' }
BaseDeDatos class >> current [

	Current isNil ifTrue: [Current:= self new].
	^Current
]

{ #category : #'as yet unclassified' }
BaseDeDatos class >> reset [

	Current := nil
]

{ #category : #'as yet unclassified' }
BaseDeDatos >> connect [
	
	self connection isConnected ifFalse: [self connection connect]
	
]

{ #category : #'as yet unclassified' }
BaseDeDatos >> connection [

	connection isNil ifTrue: [self initializeConnection].
	^connection
]

{ #category : #'as yet unclassified' }
BaseDeDatos >> connectionSettings [
	"Answer the receiver connectionSettings instance variable contents."
	
	connectionSettings isNil ifTrue: [self initializeConnectionSettings].
	^connectionSettings
]

{ #category : #'as yet unclassified' }
BaseDeDatos >> execute: aSQLQuery [

	^self yavuSystem accessor databaseDriver basicExecuteSQLString: aSQLQuery
	
]

{ #category : #initialization }
BaseDeDatos >> initializeConnection [

	connection := (Smalltalk at: #DBXConnection) platform: (Smalltalk at: #DBXPostgresBackend) new settings: self connectionSettings
]

{ #category : #initialization }
BaseDeDatos >> initializeConnectionSettings [
	"Initialize the receiver connection settings."
	
	connectionSettings := (Smalltalk at: #DBXConnectionSettings) new
								host: '127.0.0.1';
								port: '5432';
								database: 'sic';
								userName: 'postgres';
								userPassword: 'yavu09';
								yourself
]

{ #category : #'as yet unclassified' }
BaseDeDatos >> open [
	"Open the receiver data base connection."
	
	self connect.
	self connection isOpen ifFalse: [self connection open]
	
]
