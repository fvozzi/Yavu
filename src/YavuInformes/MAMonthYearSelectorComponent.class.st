Class {
	#name : #MAMonthYearSelectorComponent,
	#superclass : #MADateInputComponent,
	#category : #'YavuInformes-Extensions'
}

{ #category : #'as yet unclassified' }
MAMonthYearSelectorComponent >> renderButtonOn: html [
]

{ #category : #'as yet unclassified' }
MAMonthYearSelectorComponent >> renderInputOn: html [
	html monthYearInput
		value: self value;
		callback: [ :value | self value: value ]
]
