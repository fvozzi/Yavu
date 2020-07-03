Extension { #name : #TBSMagritteOneToManyComponent }

{ #category : #'*YavuCommon' }
TBSMagritteOneToManyComponent >> canExport [

	^self magritteDescription canExport
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
