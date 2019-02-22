Extension { #name : #Symbol }

{ #category : #'*YavuInformes-Extensions' }
Symbol >> asSQLLiteral [
	"Answer the receiver in a postgresql database compatible format."
	
	^self asString
]
