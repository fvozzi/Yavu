Extension { #name : #MADescription }

{ #category : #'*YavuInformes-Extensions' }
MADescription >> beBDMapping [

	self mapping: true
]

{ #category : #'*YavuInformes-Extensions' }
MADescription class >> defaultMapping [

	^false
]

{ #category : #'*YavuInformes-Extensions' }
MADescription >> mapping [
	"Answer ==true== if the model described by the receiver is used for DB Mapping."

	^ self propertyAt: #mapping ifAbsent: [ self class defaultMapping ]
]

{ #category : #'*YavuInformes-Extensions' }
MADescription >> mapping: aBoolean [
	"Set ==aBoolean== to the model described by the receiver is used for DB Mapping."
	
	self propertyAt: #mapping put: aBoolean
]
