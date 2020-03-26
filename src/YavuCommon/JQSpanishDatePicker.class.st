Class {
	#name : #JQSpanishDatePicker,
	#superclass : #JQDatepicker,
	#category : #'YavuCommon-0Extensions'
}

{ #category : #'as yet unclassified' }
JQSpanishDatePicker >> initialize [
	
	super initialize.
	self 
		dateFormat: 'dd/mm/yy';
		monthNames: #('Enero' 'Febrero' 'Marzo' 'Abril' 'Mayo' 'Junio' 'Julio' 'Agosto' 'Septiembre' 'Octubre' 'Noviembre' 'Diciembre');
		dayNamesMin: #('Do' 'Lu' 'Ma' 'Mi' 'Ju' 'Vi' 'Sa')
]
