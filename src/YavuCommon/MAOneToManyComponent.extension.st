Extension { #name : #MAOneToManyComponent }

{ #category : #'*YavuCommon' }
MAOneToManyComponent >> canExportCsv [
	^(Smalltalk at: #NeoCSVWriter ifAbsent: [ nil ]) notNil
]
