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

{ #category : #seaside }
YavuEnvironment class >> fontAwesomeLibrary [
	
	^ self subclassResponsibility 
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
YavuEnvironment class >> registerSeasideApplication [

	SBSHtmlCanvas selectAsDefault.
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

{ #category : #seaside }
YavuEnvironment class >> seasideApplicationName [
	
	^ 'yavu' 
]

{ #category : #'as yet unclassified' }
YavuEnvironment class >> seasideApplicationRoot [

	^ TBSYavuLogin 
]

{ #category : #system }
YavuEnvironment class >> systemClass: aYavuSystem [

	CurrentSystem := nil.
	^CurrentSystemClass := aYavuSystem
	
]

{ #category : #seaside }
YavuEnvironment class >> tbsLibrary [
	
	^ self subclassResponsibility 
]
