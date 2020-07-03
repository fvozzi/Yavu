Extension { #name : #MAToManyRelationDescription }

{ #category : #'*YavuCommon' }
MAToManyRelationDescription >> canExport [
	^self propertyAt: #canExport ifAbsent: [ self class defaultCanExport ]
]

{ #category : #'*YavuCommon' }
MAToManyRelationDescription >> canExport: aBoolean [
	^self propertyAt: #canExport put: aBoolean
]

{ #category : #'*YavuCommon' }
MAToManyRelationDescription class >> defaultCanExport [
	^true
]
