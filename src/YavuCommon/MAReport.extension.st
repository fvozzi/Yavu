Extension { #name : #MAReport }

{ #category : #'*YavuCommon' }
MAReport >> csvData [ 
	^String streamContents: [ :s |
		| writer |
		writer := NeoCSVWriter on: s.
		self printableColumns do: [ :column | 
			writer writeQuotedField: column csvLabel ] separatedBy: [ writer writeSeparator ].
		writer writeEndOfLine.
		self cache
			do: [ :row |
				self printableColumns do: [ :column |
					writer writeQuotedField: (column stringValueFor: row) greaseString ] separatedBy: [ writer writeSeparator ] ] 
			separatedBy: [ writer writeEndOfLine ] ]
]

{ #category : #'*YavuCommon' }
MAReport >> printableColumns [
	^self visibleColumns select: [ :each |
		each isPrintable ]
]
