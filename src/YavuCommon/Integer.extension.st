Extension { #name : #Integer }

{ #category : #'*YavuCommon' }
Integer >> digitAt: index put: value [ 

	"self
		deprecated: 'Please use #byteAt:put: instead'
		transformWith:
			'`@receiver digitAt: `@statements1 put: `@statements2'
		   -> '`@receiver byteAt: `@statements1 put: `@statements2'."

	^ self byteAt: index put: value 
]
