Class {
	#name : #BaseDeDatos,
	#superclass : #YavuObject,
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

{ #category : #'as yet unclassified' }
BaseDeDatos >> initializeConnection [

	connection := DBXConnection platform: DBXPostgresBackend new settings: self connectionSettings
]

{ #category : #'as yet unclassified' }
BaseDeDatos >> initializeConnectionSettings [
	"Initialize the receiver connection settings."
	
	connectionSettings := DBXConnectionSettings new
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
