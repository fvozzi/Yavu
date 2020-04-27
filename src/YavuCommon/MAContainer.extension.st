Extension { #name : #MAContainer }

{ #category : #'*YavuCommon' }
MAContainer >> tbsFormHorizontal [
	^ self propertyAt: #tbsFormHorizontal ifAbsent: [ false ]
]

{ #category : #'*YavuCommon' }
MAContainer >> tbsFormHorizontal: aBoolean [

	self propertyAt: #tbsFormHorizontal put: aBoolean
]

{ #category : #'*YavuCommon' }
MAContainer >> tbsFormInline [
	^ self propertyAt: #tbsFormInline ifAbsent: [ false ]
]

{ #category : #'*YavuCommon' }
MAContainer >> tbsFormInline: aBoolean [
	self propertyAt: #tbsFormInline put: aBoolean
]

{ #category : #'*YavuCommon' }
MAContainer >> tbsInlineValidationMessages [
	^ self propertyAt: #tbsInlineValidationMessages ifAbsent: [ false ]
]

{ #category : #'*YavuCommon' }
MAContainer >> tbsInlineValidationMessages: aBoolean [
	self propertyAt: #tbsInlineValidationMessages put: aBoolean
]
