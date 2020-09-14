Class {
	#name : #CommandMenuView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'contentView',
		'command'
	],
	#category : #'YavuRestaurant-View'
}

{ #category : #testing }
CommandMenuView class >> canBeRoot [
	^ true
]

{ #category : #'instance creation' }
CommandMenuView class >> on: aClass [ 
	
	^ self new
]

{ #category : #accessing }
CommandMenuView >> applicationTitle [ 

	^ 'Comandas'
]

{ #category : #accessing }
CommandMenuView >> componentSupplierForApplication [

	^ Bootstrap4ComponentSupplier
		usingLibraries:
			{(self deploymentMode libraryFor: Bootstrap4MetadataLibrary)
				withoutBundledDependencies.
			(self deploymentMode libraryFor: BootstrapSelectLibrary)
				using: self language.
			(self deploymentMode libraryFor: BootstrapDatepickerLibrary)
				using: self language.
			(self deploymentMode libraryFor: BootstrapTypeaheadLibrary) default}
]

{ #category : #'as yet unclassified' }
CommandMenuView >> contentView [
	^ contentView
]

{ #category : #accessing }
CommandMenuView >> deploymentMode [ 

	^ WAApplicationInDevelopment new
]

{ #category : #hooks }
CommandMenuView >> initialRequest: request [

	super initialRequest: request.
	self initializeContainerView
]

{ #category : #initialization }
CommandMenuView >> initialize [

	super initialize.
	self session startUpApplicationContextFor: self.
	contentView := [ :canvas |  ].
	self initializeContainerView
]

{ #category : #hooks }
CommandMenuView >> initializeContainerView [

	| commandView |

	commandView := IdentifiedWebView
		forDivNamed: 'command-view'
		containing: WPB4TestRunnerTestResultWebView new.
	contentView := GenericContainerWebView
		wrapping:
			( self componentSupplier gridBuilder
				columnsPerRow: 1;
				addContent: ( HeadingWebView displaying: 'Comandas' withLevel: 1 );
				addContent: commandView;
				"addContent: ( self toolbarRenderingOnAction: commandView );"
				addContent: TBSCustomerMenuView  new;
				build )
		applying: [ :div | div addClass bootstrap4 container ]
]

{ #category : #accessing }
CommandMenuView >> jQueryLibrary [

	^ (self deploymentMode libraryFor: JQuery3MetadataLibrary) default
]

{ #category : #accessing }
CommandMenuView >> language [ 

	^ WALocale fromString: 'es'
]

{ #category : #rendering }
CommandMenuView >> renderContentOn: aCanvas [

	aCanvas render: self contentView
]

{ #category : #hooks }
CommandMenuView >> toolbarRenderingOnAction: aWebView [

]

{ #category : #updating }
CommandMenuView >> updateRoot: html [ 

	
]
