Extension { #name : #Number }

{ #category : #'*YavuCommon' }
Number >> cajonDe11Maple [ 

	^ Measure amount: self unit: YavuEnvironment currentSystem cajonDe11MapleUnit
	

]

{ #category : #'*YavuCommon' }
Number >> cajonDe12Maple [ 

	^ Measure amount: self unit: YavuEnvironment currentSystem cajonDe12MapleUnit
	

]

{ #category : #'*YavuCommon' }
Number >> gram [ 

	^ Measure amount: self unit: YavuEnvironment currentSystem gramoUnit
	

]

{ #category : #'*YavuCommon' }
Number >> kilogram [ 

	^ Measure amount: self unit: YavuEnvironment currentSystem kilogramUnit
	

]

{ #category : #'*YavuCommon' }
Number >> maple [ 

	^ Measure amount: self unit: YavuEnvironment currentSystem mapleUnit
	

]

{ #category : #'*YavuCommon' }
Number >> unity [ 

	^ Measure amount: self unit: YavuEnvironment currentSystem unityUnit
	

]
