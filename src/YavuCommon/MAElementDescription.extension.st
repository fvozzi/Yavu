Extension { #name : #MAElementDescription }

{ #category : #'*YavuCommon' }
MAElementDescription >> checkboxLabel [
	^ self propertyAt: #checkboxLabel ifAbsent: [ self label ]
]

{ #category : #'*YavuCommon' }
MAElementDescription >> checkboxLabel: aString [
	self propertyAt: #checkboxLabel put: aString
]

{ #category : #'*YavuCommon' }
MAElementDescription >> placeholder [
	^ self 
		propertyAt: #placeholder 
		ifAbsent: [ nil ]
]

{ #category : #'*YavuCommon' }
MAElementDescription >> placeholder: placeHolderText [
	^ self propertyAt: #placeholder put: placeHolderText
]
