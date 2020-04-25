Class {
	#name : #TBSYavuLogin,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'userName',
		'password',
		'errorDescription',
		'system'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
TBSYavuLogin class >> canBeRoot [
	^ true
]

{ #category : #'as yet unclassified' }
TBSYavuLogin class >> initialize [
	
	super initialize.
	(WAAdmin register: self asApplicationAt: 'yavu')
		preferenceAt: #sessionClass put: YavuSession;
		preferenceAt: #resourceBaseUrl put: 'http://localhost:8081';
		addLibrary: JQDeploymentLibrary;
		addLibrary: TBSDevelopmentLibrary
]

{ #category : #accessing }
TBSYavuLogin >> failedLogin: aByteString [ 
	"Error de login."
	
	errorDescription := aByteString 
	
]

{ #category : #initialization }
TBSYavuLogin >> initialize [

	super initialize.
	system := YavuEnvironment newSystem
]

{ #category : #'private protocol' }
TBSYavuLogin >> login [

	[system loginUserName: self userName password: self password] on: Error do: [ :ex | ^self failedLogin: ex description ].
	self succeedLogin: system
]

{ #category : #accessing }
TBSYavuLogin >> password [

	^password 
]

{ #category : #accessing }
TBSYavuLogin >> password: aPassword [

	password := aPassword
]

{ #category : #rendering }
TBSYavuLogin >> renderContentOn: html [

	html form: [  
	html tbsContainer: [ 
		html heading level: 2; with: system label.
		html tbsFormGroup: [ 
			html label for: 'userNameLogin'; with: 'Usuario'.
			html textInput tbsFormControl; id: 'userNameLogin'; placeholder: 'Ingrese su usuario'; on: #userName of: self].
		html tbsFormGroup: [ 
			html label for: 'passwordLogin'; with: 'Clave'.
			html passwordInput tbsFormControl; id: 'passwordLogin'; placeholder: 'Clave'; on: #password of: self].
		errorDescription notNil ifTrue: [ self renderFailedLoginOn: html ].
		html tbsButton 
			bePrimary;
			callback: [ self login ];
			with: 'Ingresar'.
		
	] ]
]

{ #category : #rendering }
TBSYavuLogin >> renderFailedLoginOn: html [ 

	html tbsAlert 
		beWarning;
		with: [ html strong:  errorDescription ].

]

{ #category : #accessing }
TBSYavuLogin >> resetErrorDescription [

	errorDescription := nil
]

{ #category : #accessing }
TBSYavuLogin >> succeedLogin: aSystem [ 

	self resetErrorDescription.
	self session yavuSystem: aSystem.
	self call: aSystem mainView new
]

{ #category : #accessing }
TBSYavuLogin >> userName [

	^userName  
]

{ #category : #accessing }
TBSYavuLogin >> userName: anUserName [

	userName  := anUserName
]
