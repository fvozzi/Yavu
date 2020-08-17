Class {
	#name : #TBSMagritteDateInputComponent,
	#superclass : #MADateInputComponent,
	#category : #'YavuCommon-Bootstrap-Magritte'
}

{ #category : #rendering }
TBSMagritteDateInputComponent >> renderButtonOn: html [
]

{ #category : #rendering }
TBSMagritteDateInputComponent >> renderInputOn: html [

	html dateInput5
		value: (self value notNil ifTrue: [self value asDate yyyymmdd ]);
		callback: [ :value | self value: (value ifEmpty: [] ifNotEmpty: [ value asDate])]
]
