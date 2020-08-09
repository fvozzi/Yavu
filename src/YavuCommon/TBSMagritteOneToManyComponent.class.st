Class {
	#name : #TBSMagritteOneToManyComponent,
	#superclass : #MAOneToManyComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #actions }
TBSMagritteOneToManyComponent >> add [

	self root 
		show: (self validatedFormOn: (self selected owner: self model) forOperation: 'Agregar')
		onAnswer: [ :result |
			result isNil
				ifFalse: [ self value: (self value copyWith: result); refresh ] ]
]

{ #category : #private }
TBSMagritteOneToManyComponent >> buildReport [

	^ (TBSMagritteReport rows: self value description: self reference)
		sortEnabled: self magritteDescription isOrdered not;
		yourself
]

{ #category : #'*YavuCommon' }
TBSMagritteOneToManyComponent >> canExport [

	^self magritteDescription canExport
]

{ #category : #'as yet unclassified' }
TBSMagritteOneToManyComponent >> csvData [

	^self report csvData
]

{ #category : #'*YavuCommon' }
TBSMagritteOneToManyComponent >> csvDocument [
	^WAMimeDocument
		on: (self csvData)
		mimeType: (WAMimeType main: 'text' sub: 'csv')
		fileName: (self exportFilename, '.csv')
		
]

{ #category : #actions }
TBSMagritteOneToManyComponent >> edit: anObject [

	anObject owner: self model.
	super edit: anObject 
]

{ #category : #'*YavuCommon' }
TBSMagritteOneToManyComponent >> exportCsv [
	self requestContext respond: [ :response |
		response
			doNotCache;
			document: self csvDocument ]
		
]

{ #category : #'*YavuCommon' }
TBSMagritteOneToManyComponent >> exportFilename [
	^self magritteDescription filename
		
]

{ #category : #actions }
TBSMagritteOneToManyComponent >> refresh [
	self report rows: self value.
	self value: self value
]

{ #category : #'*YavuCommon' }
TBSMagritteOneToManyComponent >> renderButtonsOn: canvas [
	canvas div
		class: 'report-buttons';
		with: [
			self canExport ifTrue: [ 
				self renderExportMenuOn: canvas ]]
]

{ #category : #'*YavuCommon' }
TBSMagritteOneToManyComponent >> renderExportMenuOn: canvas [
	self canExportCsv ifTrue: [ 
		canvas anchor
			callback: [ self exportCsv ];
			with: 'Exportar CSV']
]

{ #category : #'rendering-buttons' }
TBSMagritteOneToManyComponent >> renderSelectButtonOn: html [

	html button 
		beSubmit;
		class: 'btn';
		callback: [self add];
		with: [
				html div fontAwesome; 
				with: [html span fontAwesomePlusSquareIcon]. 
				html space; text: (self labelForSelector: #add)]

]

{ #category : #rendering }
TBSMagritteOneToManyComponent >> renderViewerOn: html [

	super renderViewerOn: html.
	self renderButtonsOn: html
]

{ #category : #private }
TBSMagritteOneToManyComponent >> validatedFormOn: result forOperation: aString [
	| component |
	component := result asComponent.
	component addMessage: aString , ' ' , self selected label.
	component
		addDecoration:
			(TBSMagritteFormDecoration new
				buttons:
					{(#save -> 'Guardar').
					(#cancel -> 'Cancelar')};
				formCss: '.col-form-label';
				yourself).
	component addDecoration: TBSMagritteValidationDecoration new.
	component magritteDescription tbsFormHorizontal: true.
	^ component
]
