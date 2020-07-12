Class {
	#name : #TBSMagritteReport,
	#superclass : #MAReport,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #'private-batch' }
TBSMagritteReport >> batchPageRangeEnd [
	^ self batchMaxPages min: self batchPage + 5
]

{ #category : #'private-batch' }
TBSMagritteReport >> batchPageRangeStart [
	^ self defaultBatchPage max: self batchPage - 5
]

{ #category : #'accessing-defaults' }
TBSMagritteReport >> defaultShowBordered [
	^ true
]

{ #category : #'accessing-defaults' }
TBSMagritteReport >> defaultShowCondensed [
	^ false
]

{ #category : #'accessing-defaults' }
TBSMagritteReport >> defaultShowHover [
	^ false
]

{ #category : #'accessing-defaults' }
TBSMagritteReport >> defaultShowStriped [
	^ false
]

{ #category : #'rendering-batch' }
TBSMagritteReport >> renderBatchDivOn: html [
	html form: [ 
		html tbsButtonToolbar
			class: 'pagination' ;
			with: [
				self showBatchFirstLast
					ifTrue: [ self renderBatchFirstOn: html ].
				self showBatchPreviousNext
					ifTrue: [ self renderBatchPreviousOn: html ].
				self showBatchPages
					ifTrue: [ self renderBatchItemsOn: html ].
				self showBatchPreviousNext
					ifTrue: [ self renderBatchNextOn: html ].
				self showBatchFirstLast
					ifTrue: [ self renderBatchLastOn: html ] ] ]
]

{ #category : #'rendering-batch' }
TBSMagritteReport >> renderBatchFirstOn: html [
	html tbsButtonGroup: [ 
		html tbsButton
			beExtraSmall;
			beDisabledIf: [ self isOnFirstPage ];
			callback: [ self batchPage: self defaultBatchPage ];
			with: [ html tbsGlyphIcon iconFastBackward ] ]
]

{ #category : #'rendering-batch' }
TBSMagritteReport >> renderBatchItemsOn: html [
	html tbsButtonGroup: [ 
		(self showBatchFirstLast or: [ self batchPageRangeStart = self defaultBatchPage ])
			ifFalse: [
				html tbsButton
					beExtraSmall;
					callback: [ self batchPage: self defaultBatchPage ];
					with: self defaultBatchPage ].

		(self batchPageRangeStart -1) > self defaultBatchPage
			ifTrue: [
				html tbsButton
					beExtraSmall;
					beDisabled;
					with: '...' ].

		self batchPageRange do: [ :index |
			html tbsButton
				bePrimaryIf: [ self batchPage = index ];
				beDisabledIf: [ self batchPage = index ];
				callback: [ self batchPage: index ];
				beExtraSmall;
				with: index ].
	
		self batchPageRangeEnd < (self batchMaxPages - 1)
			ifTrue: [
				html tbsButton
					beExtraSmall;
					beDisabled;
					with: '...' ].
		
		(self showBatchFirstLast or: [ self batchPageRangeEnd = self batchMaxPages ])
			ifFalse: [
				html tbsButton
					beExtraSmall;
					callback: [ self batchPage: self batchMaxPages ];
					with: self batchMaxPages ] ]

]

{ #category : #'rendering-batch' }
TBSMagritteReport >> renderBatchLastOn: html [
	html tbsButtonGroup: [ 
		html tbsButton
			beExtraSmall;
			callback: [ self batchPage: self batchMaxPages ];
			beDisabledIf: [ self isOnLastPage ];
			with: [ html tbsGlyphIcon iconFastForward ] ]

]

{ #category : #'rendering-batch' }
TBSMagritteReport >> renderBatchNextOn: html [
	html tbsButtonGroup: [ 
		html tbsButton
			callback: [ self nextPage ];
			beDisabledIf: [ self isOnLastPage ];
			beExtraSmall;
			with: [ html tbsGlyphIcon iconForward ] ]
]

{ #category : #'rendering-batch' }
TBSMagritteReport >> renderBatchPreviousOn: html [
	html tbsButtonGroup: [ 
		html tbsButton
			callback: [ self previousPage ];
			beDisabledIf: [ self isOnFirstPage ];
			beExtraSmall;
			with: [ html tbsGlyphIcon iconBackward ] ]
]

{ #category : #rendering }
TBSMagritteReport >> renderContentOn: html [
	| tag class |
	tag := html table
		id: self ajaxId;
		yourself.
	class := 'table'.
	self showBordered 
		ifTrue: [ class := class, ' table-bordered' ].
	self showStriped 
		ifTrue: [ class := class, ' table-striped' ].
	self showCondensed 
		ifTrue: [ class := class, ' table-condensed' ].
	self showHover 
		ifTrue: [ class := class, ' table-hover'  ].
	
	tag class: class.
	tag with: [ self renderTableOn: html ]
]

{ #category : #rendering }
TBSMagritteReport >> renderTableBatchOn: html [
	self hasMoreThanOnePage ifTrue: [
		html tableRow: [
			html tableData
				class: 'batch';
				colSpan: self visibleColumns size;
				with: [
					self renderBatchDivOn: html ] ] ]
]

{ #category : #private }
TBSMagritteReport >> rowStyleForNumber: aNumber [
	"odd/even classes not required for Twitter Bootstrap."
	^ nil
]

{ #category : #'accessing-settings' }
TBSMagritteReport >> showBordered [
	^ properties at: #showBordered ifAbsent: [ self defaultShowBordered ]
]

{ #category : #'accessing-settings' }
TBSMagritteReport >> showBordered: aBoolean [
	properties at: #showBordered put: aBoolean
]

{ #category : #'accessing-settings' }
TBSMagritteReport >> showCondensed [
	^ properties at: #showCondensed ifAbsent: [ self defaultShowCondensed ]
]

{ #category : #'accessing-settings' }
TBSMagritteReport >> showCondensed: aBoolean [
	properties at: #showCondensed put: aBoolean
]

{ #category : #'accessing-settings' }
TBSMagritteReport >> showHover [
	^ properties at: #showHover ifAbsent: [ self defaultShowHover ]
]

{ #category : #'accessing-settings' }
TBSMagritteReport >> showHover: aBoolean [
	properties at: #showHover put: aBoolean
]

{ #category : #'accessing-settings' }
TBSMagritteReport >> showStriped [
	^ properties at: #showStriped ifAbsent: [ self defaultShowStriped ]
]

{ #category : #'accessing-settings' }
TBSMagritteReport >> showStriped: aBoolean [
	properties at: #showStriped put: aBoolean
]

{ #category : #accessing }
TBSMagritteReport >> tableClass [

	^ String streamContents: [:stream |
		stream 
			nextPutAll: 'report'; nextPut: Character space;
			nextPutAll: 'table'.				
		self showBordered 
			ifTrue: [stream nextPut: Character space; nextPutAll: 'table-bordered'].
		self showStriped 
			ifTrue: [stream nextPut: Character space; nextPutAll: 'table-striped' ].
		self showCondensed 
			ifTrue: [stream nextPut: Character space; nextPutAll: 'table-condensed' ].
		self showHover 
			ifTrue: [stream nextPut: Character space; nextPutAll: 'table-hover']].

]
