Extension { #name : #MADescribedColumn }

{ #category : #'*YavuCommon' }
MADescribedColumn >> defaultCsvLabel [
	^self magritteDescription csvLabel
]

{ #category : #'*YavuCommon' }
MADescribedColumn >> isPrintable [
	^true
]
