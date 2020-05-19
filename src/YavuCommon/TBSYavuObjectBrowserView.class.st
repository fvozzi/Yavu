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

{ #category : #initialization }
TBSYavuObjectBrowserView >> initialize [ 

	super initialize.
	objectsBrowser := TBSYavuObjectsBrowser onParent: self.
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

{ #category : #eventActions }
TBSYavuObjectBrowserView >> onObjectSelection: aClass [ 
	
	objectClass := aClass
]

{ #category : #initialization }
TBSYavuObjectBrowserView >> onYavuSubsystemChanged [

	self onObjectSelection: self selectedOrDefaultObjectClass
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

	objectsBrowser updateInstances: self instances class: self selectedOrDefaultObjectClass.
	objectsBrowser renderOn: html
]

{ #category : #rendering }
TBSYavuObjectBrowserView >> selectedOrDefaultObjectClass [

	objectClass ifNil: [ ^ self possibleInstancesClasses  first ].
	^ objectClass 

]

{ #category : #accessing }
TBSYavuObjectBrowserView >> subsystemClass [ 
	
	 ^ subsystemClass 
]
