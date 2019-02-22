Extension { #name : #Class }

{ #category : #'*YavuInformes-Extensions' }
Class >> asSQLLiteral [
	"Answer the receiver in a postgresql database compatible format."
	
	^self name asSQLLiteral
]
