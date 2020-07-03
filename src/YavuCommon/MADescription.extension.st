Extension { #name : #MADescription }

{ #category : #'*YavuCommon' }
MADescription >> csvLabel: aString [
	^self propertyAt: #csvLabel put: aString
]

{ #category : #'*YavuCommon' }
MADescription >> filename [

	^self propertyAt: #filename ifAbsent: [ self label ]
]
