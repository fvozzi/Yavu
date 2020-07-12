Class {
	#name : #TBSMagritteOneToManyComponent,
	#superclass : #MAOneToManyComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

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
