Extension { #name : #JQueryInstance }

{ #category : #'*YavuInformes-Extensions' }
JQueryInstance >> spanishDatepicker [
	"The method that you use to create a new date picker."
	
	^ self create: JQSpanishDatePicker
]
