Class {
	#name : #StGLORPPersistence,
	#superclass : #StPersistence,
	#instVars : [
		'sharedSession'
	],
	#category : #'YavuInformes-Persistence'
}

{ #category : #'as yet unclassified' }
StGLORPPersistence class >> createConnection [

	^self new
		createConnection;
		yourself
]

{ #category : #'sin categoria' }
StGLORPPersistence >> accessor [

	^accessor 
]

{ #category : #private }
StGLORPPersistence >> createConnection [
	
	self 
		createLogin;
		createSession;
		yourself
	
]

{ #category : #private }
StGLORPPersistence >> createLogin [
	login := Login new
		database: PostgreSQLPlatform new;
		username: 'postgres';
		password: 'yavu09';
		connectString: '127.0.0.1_sic'.
	PharoDatabaseAccessor DefaultDriver: GlorpOpenDBXDriverPoolingDriver.
	(GlorpOpenDBXDriverPoolingDriver poolFor: login) maxConnections: 30.
	accessor := DatabaseAccessor forLogin: login.
	accessor logging: true.
	accessor login
]

{ #category : #private }
StGLORPPersistence >> createSession [
	
	session := GlorpSession new.
	^ session
		system: (SICDescriptorSystem forPlatform: login database);
		accessor: accessor;
		yourself
]

{ #category : #'as yet unclassified' }
StGLORPPersistence >> disconnect [

	self accessor disconnect
]

{ #category : #'as yet unclassified' }
StGLORPPersistence >> newSession [
	
	| session aLogin accessor |

	aLogin := Login new 
				database: (PostgreSQLPlatform new characterEncoding: 'cp-1252' asSymbol );
				username: 'postgres';
				password: 'yavu09';
				connectString: '127.0.0.1_sic'.
	PharoDatabaseAccessor DefaultDriver: NativePostgresDriver.
	accessor := DatabaseAccessor forLogin: aLogin.
	accessor logging: true.
	accessor login.
	session := GlorpSession new.
	^session 
		system: (SICDescriptorSystem forPlatform: aLogin database);
		accessor: accessor;
		yourself
]

{ #category : #'as yet unclassified' }
StGLORPPersistence >> session [

	^session
]

{ #category : #'sin categoria' }
StGLORPPersistence >> sharedSession [
	
	sharedSession isNil ifTrue: [sharedSession := self newSession].
	^sharedSession
]

{ #category : #'sin categoria' }
StGLORPPersistence >> sharedSession: anObject [
	sharedSession := anObject
]
