Class {
	#name : #TBSListCompositionComponent,
	#superclass : #MAListCompositonComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #'as yet unclassified' }
TBSListCompositionComponent >> renderEditorAvailableOn: html [
	html select
		size: 6; 
		style: 'span3';
		list: self availableList;
		selected: self availableSelected;
		callback: [ :value | self availableSelected: value ];
		labels: [ :value | self labelForOption: value ]
]

{ #category : #'as yet unclassified' }
TBSListCompositionComponent >> renderEditorButtonAddOn: html [
	html div
		class: 'btn-group';
		class: 'btn-group-vertical';
		with: [
			html button
				beSubmit;
				class: 'btn';
				callback: [ self add ];
				with: [html text: 'Add'].
			html button
				class: 'btn';
				beSubmit;
				callback: [ self remove ];
				with: [html text: 'Remove']].
]

{ #category : #'as yet unclassified' }
TBSListCompositionComponent >> renderEditorButtonOrderOn: html [
	html div
		class: 'btn-group';
		class: 'btn-group-vertical';
		with: [
			html button
				beSubmit;
				class: 'btn';
				callback: [ self moveUp ];
				with: [html tbsGlyphIcon iconChevronUp].
			html button
				beSubmit
				class: 'btn';
				callback: [ self moveDown ];
				with: [html tbsGlyphIcon iconChevronDown]].
]

{ #category : #rendering }
TBSListCompositionComponent >> renderEditorOn: html [
	
	html div
		class: 'controls-row';
		with: [	
			self renderEditorAvailableOn: html.
			self renderEditorButtonAddOn: html.
			self renderEditorSelectedOn: html.
			self isOrdered ifTrue: [
				self renderEditorButtonOrderOn: html]]
]

{ #category : #'as yet unclassified' }
TBSListCompositionComponent >> renderEditorSelectedOn: html [
	html select
		size: 6; 
		style: 'span3';
		list: self selectedList;
		selected: self selectedSelected;
		callback: [ :value | self selectedSelected: value ];
		labels: [ :value | self labelForOption: value ]
]
