Class {
	#name : #TBSYavuObjectBrowserView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'subsystemClass',
		'objectClass',
		'objectsBrowser'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'instance creation' }
TBSYavuObjectBrowserView class >> on: yavuSubsystemClass [

	 ^ self new initializeSubsystemClass: yavuSubsystemClass
]

{ #category : #'as yet unclassified' }
TBSYavuObjectBrowserView >> browserCaption [

	^ self subsystemClass label
]

{ #category : #accessing }
TBSYavuObjectBrowserView >> children [

	^Array with: objectsBrowser 
]

{ #category : #rendering }
TBSYavuObjectBrowserView >> defaultObjectClass [

	^ self possibleInstancesClasses  first 
]

{ #category : #initialization }
TBSYavuObjectBrowserView >> initialize [
	super initialize.
	objectsBrowser := self yavuObjectsBrowserClass onParent: self.
]

{ #category : #initialization }
TBSYavuObjectBrowserView >> initializeSubsystemClass: yavuSubsystemClass [

	subsystemClass := yavuSubsystemClass.
	self onYavuSubsystemChanged
]

{ #category : #subclassResponsability }
TBSYavuObjectBrowserView >> instances [

	self subclassResponsibility 
]

{ #category : #accessing }
TBSYavuObjectBrowserView >> objectClass [
	^ objectClass
]

{ #category : #accessing }
TBSYavuObjectBrowserView >> objectClass: anObject [
	objectClass := anObject.
	self onObjectClassChanged
]

{ #category : #accessing }
TBSYavuObjectBrowserView >> onObjectClassChanged [

	objectsBrowser initializeInstances: self instances class: self objectClass
]

{ #category : #initialization }
TBSYavuObjectBrowserView >> onYavuSubsystemChanged [

	self objectClass: self defaultObjectClass
]

{ #category : #subclassResponsability }
TBSYavuObjectBrowserView >> possibleInstancesClasses [

	^ self subclassResponsibility 
]

{ #category : #rendering }
TBSYavuObjectBrowserView >> renderContentOn: html [
	"Renderiza el contenido del receptor en html."

	html tbsPanel beDefault
		with: [ html
				tbsPanelHeading: [ html tbsPanelTitle
						level: 3;
						with: self browserCaption ].
			html
				tbsPanelBody: [ 
					html form: [ self renderObjectClassSelection: html ].
					 ].
			self renderReportOn: html ]
]

{ #category : #subclassResponsability }
TBSYavuObjectBrowserView >> renderObjectClassSelection: html [

	self subclassResponsibility
]

{ #category : #rendering }
TBSYavuObjectBrowserView >> renderReportOn: html [

	objectsBrowser renderOn: html
]

{ #category : #eventActions }
TBSYavuObjectBrowserView >> search [
	objectsBrowser
		updateInstances: self instances
		class: self objectClass
]

{ #category : #accessing }
TBSYavuObjectBrowserView >> subsystemClass [ 
	
	 ^ subsystemClass 
]

{ #category : #initialization }
TBSYavuObjectBrowserView >> yavuObjectsBrowserClass [
	^ TBSYavuObjectsBrowser
]
