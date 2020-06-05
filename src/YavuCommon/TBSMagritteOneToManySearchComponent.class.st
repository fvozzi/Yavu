Class {
	#name : #TBSMagritteOneToManySearchComponent,
	#superclass : #MAOneToManyComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #private }
TBSMagritteOneToManySearchComponent >> buildReport [

	^ (TBSMagritteReport rows: self value description: self reference)
		sortEnabled: self magritteDescription isOrdered not;
		yourself
]

{ #category : #'rendering-buttons' }
TBSMagritteOneToManySearchComponent >> renderSelectButtonOn: html [

	html button 
		beSubmit;
		class: 'btn';
		callback: [self search];
		with: [html tbsGlyphIcon iconPlus. html space; text: 'Buscar']
]
