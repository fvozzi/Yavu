Class {
	#name : #HTMLDataReader,
	#superclass : #YvObject,
	#instVars : [
		'znClient',
		'captchaImagen',
		'captchaCaracteres',
		'basicData',
		'htmlBasicStream'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
HTMLDataReader class >> on: aPerson [

	^self new createBasicDataFor: aPerson
]

{ #category : #accessing }
HTMLDataReader >> basicData [

	^basicData
]

{ #category : #accessing }
HTMLDataReader >> basicData: anObject [

	basicData := anObject
]

{ #category : #subclassResponsability }
HTMLDataReader >> basicDataClass [

	^self subclassResponsibility 
]

{ #category : #accessing }
HTMLDataReader >> captchaCaracteres [

	^captchaCaracteres
]

{ #category : #accessing }
HTMLDataReader >> captchaCaracteres: unString [

	captchaCaracteres := unString
]

{ #category : #subclassResponsability }
HTMLDataReader >> captchaImageUrl [
	^self subclassResponsibility 
]

{ #category : #accessing }
HTMLDataReader >> captchaImagen [

	captchaImagen isNil  ifTrue: [captchaImagen := self getCaptchaImage].
	^captchaImagen
]

{ #category : #subclassResponsability }
HTMLDataReader >> createBasicDataFor: aPerson [

	self subclassResponsibility
]

{ #category : #subclassResponsability }
HTMLDataReader >> currentBasicDataFor: aCustomer [
	^self subclassResponsibility 
]

{ #category : #subclassResponsability }
HTMLDataReader >> executePreviousActions [
	"Ejecuta acciones previas a obtener el captcha."
	
	^self subclassResponsibility
	
]

{ #category : #htmlQueries }
HTMLDataReader >> getCaptchaImage [
	[ 
	self executePreviousActions.
	self znClient
		timeout: 5;
		url: self captchaImageUrl;
		accept: ZnMimeType imageJpeg;
		get ]
		on: ConnectionTimedOut , NameLookupFailure , ZnHttpUnsuccessful , ZnUnexpectedContentType
		do: [ :ex | ^ nil ].
	^ [ (JPEGReadWriter on: self znClient entity readStream) nextImage ]
		on: Error
		do: [ :ex | nil ]
]

{ #category : #htmlQueries }
HTMLDataReader >> getHtmlBasicStream [
	| htmlContents |
	htmlContents := [ 
	self setHtmlStreamHead.
	self setHtmlStreamParameters.
	self znClient
		accept: self mimeType;
		logToTranscript;
		post ]
		on: ZnHttpUnsuccessful , ConnectionTimedOut
		do: [ :ex | '' ].
	^ self readStreamOn: htmlContents
]

{ #category : #accessing }
HTMLDataReader >> htmlBasicStream [

	htmlBasicStream isNil ifTrue: [htmlBasicStream := self getHtmlBasicStream].
	^htmlBasicStream 
]

{ #category : #accessing }
HTMLDataReader >> htmlBasicStream: aStream [

	htmlBasicStream := aStream
]

{ #category : #subclassResponsability }
HTMLDataReader >> htmlStreamUrl [

	^self subclassResponsibility 
]

{ #category : #accessing }
HTMLDataReader >> initializeZnClient [
	
	znClient := ZnClient new
]

{ #category : #'as yet unclassified' }
HTMLDataReader >> mimeType [

	^ZnMimeType textHtml
]

{ #category : #subclassResponsability }
HTMLDataReader >> parseHtmlData [

	self subclassResponsibility 
]

{ #category : #htmlQueries }
HTMLDataReader >> readStreamOn: htmlContents [
	^ ReadStream on: htmlContents
]

{ #category : #htmlQueries }
HTMLDataReader >> setHtmlStreamHead [
	self znClient
		url: self htmlStreamUrl;
		accept: ZnMimeType textHtml setCharSetUTF8;
		enforceHttpSuccess: true;
		enforceAcceptContentType: true;
		setAcceptEncodingGzip
		
]

{ #category : #htmlQueries }
HTMLDataReader >> setHtmlStreamParameters [
	
	self subclassResponsibility 
]

{ #category : #subclassResponsability }
HTMLDataReader >> todayBasicDataFor: aCustomer [
	"Busca una instancia para el día de hoy para no volver a buscar un dato en la web."
	
	^self subclassResponsibility
]

{ #category : #'instance creation' }
HTMLDataReader >> valueForCustomer: aCustomer [
	basicData := self todayBasicDataFor: aCustomer.
	basicData notNil
		ifTrue: [ ^ self ].
	self createBasicDataFor: aCustomer.
	self parseHtmlData.
	self basicData hasAnyData
		ifTrue: [ self basicData store ]
		ifFalse: [ (self currentBasicDataFor: aCustomer) ifNotNil: [ :each | basicData := each ] ]
]

{ #category : #'instance creation' }
HTMLDataReader >> valueForCustomer: aCustomer using: aYavuSystem [
	basicData := self todayBasicDataFor: aCustomer using: aYavuSystem.
	basicData notNil
		ifTrue: [ ^ self ].
	self createBasicDataFor: aCustomer.
	self parseHtmlData.
	self basicData hasAnyData
		ifTrue: [ aYavuSystem store: self basicData ]
		ifFalse: [ (self currentBasicDataFor: aCustomer using: aYavuSystem) ifNotNil: [ :each | basicData := each ] ]
]

{ #category : #'as yet unclassified' }
HTMLDataReader >> znClient [

	znClient isNil  ifTrue: [self initializeZnClient].
	^znClient
]
