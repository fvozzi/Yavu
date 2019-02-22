Class {
	#name : #WASeleccionIngresoDeSituacionesView,
	#superclass : #WAYavuComponent,
	#instVars : [
		'opcionSeleccionada',
		'mapaDeOpciones'
	],
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WASeleccionIngresoDeSituacionesView >> children [

	^self mapaDeOpciones asArray
]

{ #category : #'as yet unclassified' }
WASeleccionIngresoDeSituacionesView >> inicializarMapaDeOpciones [
	
	mapaDeOpciones := Dictionary new.
	mapaDeOpciones 
		at: 'Ingreso manual'	put: TBSInputFinancialSituationView new;
		at: 'Cargar archivo con informes' put: WAImportarSituacionesComercialesView new
]

{ #category : #'as yet unclassified' }
WASeleccionIngresoDeSituacionesView >> mapaDeOpciones [
	
	mapaDeOpciones isNil ifTrue: [self inicializarMapaDeOpciones].
	^mapaDeOpciones
]

{ #category : #'as yet unclassified' }
WASeleccionIngresoDeSituacionesView >> mapaDeOpciones: aDictionary [
	
	mapaDeOpciones := aDictionary
]

{ #category : #accessing }
WASeleccionIngresoDeSituacionesView >> opcionSeleccionada [

	"opcionSeleccionada isNil ifTrue: [opcionSeleccionada := self opcionSeleccionadaDefault]."
	^opcionSeleccionada
]

{ #category : #accessing }
WASeleccionIngresoDeSituacionesView >> opcionSeleccionada: anObject [
	
	^ opcionSeleccionada := anObject
]

{ #category : #accessing }
WASeleccionIngresoDeSituacionesView >> opcionSeleccionadaDefault [

	^'Ingreso manual'
]

{ #category : #'as yet unclassified' }
WASeleccionIngresoDeSituacionesView >> renderContentOn: html [
	
		html form: [
		html div class: 'titulo2'; with: [html text: 'Seleccione la forma en la que se ingresarán los datos:'].
		self renderSelectListOn: html.	
		html submitButton 
			callback: [self call: self viewSeleccionada ];
			value: 'Siguiente']
		
]

{ #category : #'as yet unclassified' }
WASeleccionIngresoDeSituacionesView >> renderSelectListOn: html [
	self
		renderLabel: 'Tipo de ingreso'
		control: [ :id :script |
			html select
				id: id;
				list: self mapaDeOpciones keys;
				selected: self opcionSeleccionada;
				callback: [ :value | opcionSeleccionada := value ];
				onChange: (script html: [ :h | h div id: 'ayuda'; with: [html text: self textoDeAyuda ]]).
			(html jQuery: 'select') trigger: 'Change']
		model: opcionSeleccionada
		on: html
]

{ #category : #'as yet unclassified' }
WASeleccionIngresoDeSituacionesView >> textoDeAyuda [

	^self viewSeleccionada textoDeAyuda 
]

{ #category : #'as yet unclassified' }
WASeleccionIngresoDeSituacionesView >> viewSeleccionada [

	^self mapaDeOpciones at: (self opcionSeleccionada ifNil: [self opcionSeleccionadaDefault])
]
