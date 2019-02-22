Extension { #name : #Collection }

{ #category : #'*YavuInformes-Extensions' }
Collection >> classifiedBy: aBlock [
	"Answer a dictionary whose keys are the result of evaluating aBlock
	for all my elements, and the value for each key is the selection of 
	my elements that evaluated to that key."
	
	| groups |
	groups := PluggableDictionary integerDictionary.
	self do: [ :each | groups at: (aBlock value: each) ifAbsentPut: [each]].
	^groups

]

{ #category : #'*YavuInformes-Extensions' }
Collection >> groupedBy: aBlock andBy: anotherBlock [
	"Answer a dictionary whose keys are the result of evaluating aBlock
	for all my elements, and the value for each key is the selection of 
	my elements that evaluated to that key. Uses species."
	
	| oneLevelGrouped twoLevelGrouped |
	oneLevelGrouped := self groupedBy: aBlock.
	twoLevelGrouped := PluggableDictionary new.
	oneLevelGrouped keysAndValuesDo: [:key :elements |
		twoLevelGrouped at: key put: (elements groupedBy: anotherBlock)
		].
	^twoLevelGrouped
]
