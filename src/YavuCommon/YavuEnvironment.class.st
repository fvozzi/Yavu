Class {
	#name : #YavuEnvironment,
	#superclass : #Object,
	#classVars : [
		'Current',
		'CurrentSystem',
		'CurrentSystemClass'
	],
	#category : #'YavuCommon-Environment'
}

{ #category : #system }
YavuEnvironment class >> beCurrent [

	Current := self
]

{ #category : #seaside }
YavuEnvironment class >> configureWAAdmin [

	WAAdmin defaultDispatcher preferenceAt: #serverPath put: self serverPath
]

{ #category : #system }
YavuEnvironment class >> current [

	Current ifNil: [ Current := self ].
	^Current
	
]

{ #category : #system }
YavuEnvironment class >> currentSystem [

	CurrentSystem ifNil: [ CurrentSystem := self newSystem ].
	^CurrentSystem
	
]

{ #category : #'as yet unclassified' }
YavuEnvironment class >> deploymentMode [

	^ self subclassResponsibility 
]

{ #category : #seaside }
YavuEnvironment class >> fontAwesomeLibrary [
	
	^ self subclassResponsibility 
]

{ #category : #system }
YavuEnvironment class >> initializeSubsystems [	

	self subclassResponsibility 
]

{ #category : #seaside }
YavuEnvironment class >> jqLibrary [
	
	^ self subclassResponsibility 
]

{ #category : #mongo }
YavuEnvironment class >> mongoDatabaseName [

 ^ self subclassResponsibility 
]

{ #category : #system }
YavuEnvironment class >> newSystem [

	^CurrentSystemClass new
]

{ #category : #seaside }
YavuEnvironment class >> pingApplicationName [
	
	^ 'ping' 
]

{ #category : #'as yet unclassified' }
YavuEnvironment class >> pingApplicationRoot [

	^ WAYavuPing  
]

{ #category : #seaside }
YavuEnvironment class >> registerPingApp [
	^ WAAdmin
		register: self pingApplicationRoot
		asApplicationAt: self pingApplicationName
]

{ #category : #seaside }
YavuEnvironment class >> registerSeasideApplication [
	"Register the seaside app."

	SBSHtmlCanvas selectAsDefault.
	self configureWAAdmin.
	self registerPingApp.
	self systemClass registerSeasideApplication
]

{ #category : #seaside }
YavuEnvironment class >> registerYavuApp [
	^ (WAAdmin
		register: self seasideApplicationRoot
		asApplicationAt: self seasideApplicationName)
		preferenceAt: #sessionClass put: YavuSession;
		preferenceAt: #resourceBaseUrl put: self resourceBaseUrl;
		preferenceAt: #maximumRelativeAge put: 28800;
		addLibrary: self jqLibrary;
		addLibrary: self tbsLibrary;
		addLibrary: self fontAwesomeLibrary
]

{ #category : #seaside }
YavuEnvironment class >> resourceBaseUrl [
	^ 'http://localhost:8081'
]

{ #category : #'as yet unclassified' }
YavuEnvironment class >> serverPath [

	^ self subclassResponsibility 
]

{ #category : #system }
YavuEnvironment class >> startOn: aYavuSystemClass [ 

	self beCurrent.
	self systemClass: aYavuSystemClass.
	self registerSeasideApplication 
]

{ #category : #system }
YavuEnvironment class >> systemClass [

	^ CurrentSystemClass
	
]

{ #category : #system }
YavuEnvironment class >> systemClass: aYavuSystemClass [

	CurrentSystem := nil.
	CurrentSystemClass := aYavuSystemClass.
	self initializeSubsystems	
]

{ #category : #seaside }
YavuEnvironment class >> tbsLibrary [
	
	^ self subclassResponsibility 
]
