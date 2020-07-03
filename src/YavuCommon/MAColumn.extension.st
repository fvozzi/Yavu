Extension { #name : #MAColumn }

{ #category : #'*YavuCommon' }
MAColumn >> csvLabel [
	^self propertyAt: #csvLabel ifAbsent: [ self defaultCsvLabel ]
]

{ #category : #'*YavuCommon' }
MAColumn >> csvLabel: aString [
	^self propertyAt: #csvLabel put: aString
]

{ #category : #'*YavuCommon' }
MAColumn >> defaultCsvLabel [
	^self label
]

{ #category : #'*YavuCommon' }
MAColumn >> isPrintable [
	^false
]

{ #category : #'*YavuCommon' }
MAColumn >> stringValueFor: aRow [ 

	^self magritteDescription toString: (self valueFor: aRow)
]
