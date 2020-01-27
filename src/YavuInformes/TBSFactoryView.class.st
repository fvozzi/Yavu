Class {
	#name : #TBSFactoryView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'model',
		'reportsByModel',
		'selectedTab',
		'orderSelector',
		'valueToSearch'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #'as yet unclassified' }
TBSFactoryView class >> canBeRoot [ 

	^true
]

{ #category : #'as yet unclassified' }
TBSFactoryView class >> claseDeAyuda [
	"Devuelve la clase que modela y define la ayuda del repcetor."
	
	^WAAyudaABMEntidades
]

{ #category : #'as yet unclassified' }
TBSFactoryView class >> on: aModel [
	
	^super new model: aModel
]

{ #category : #rendering }
TBSFactoryView >> buildReport [
	"Create a MAReport new instance showing the reciver selected model class instances."
	
	| instance |
	instance := self model instances ifEmpty: [ self model objectClass new ] ifNotEmpty: [ :instances | instances first ]. 
	self halt.
	^(MAReport rows: self model instances description: instance maDescriptionForReport)
		batchSize: 20;
		addColumn: (MACommandColumn new
						addCommandOn: self selector: #ver: text: 'ver';
						addCommandOn: self selector: #edit: text: 'modificar';
						"addCommandOn: self selector: #remove: text: 'eliminar';"
						yourself);
		tableEmpty: 'No hay ', self descripcionClaseSeleccionada, ' para mostrar. Use la opción Buscar.'
		yourself
]

{ #category : #accessing }
TBSFactoryView >> children [

	^Array with: self report
]

{ #category : #rendering }
TBSFactoryView >> descripcionClaseSeleccionada [
	^ self model objectClass
		ifNil: [ '' ]
		ifNotNil: [ :each | each label ]
]

{ #category : #adding }
TBSFactoryView >> edit: anObject [

	| anEntity component |
	component := anObject asComponent.
	anEntity := self call:  (component 
					addValidatedForm: {#save -> 'Guardar'. #cancel -> 'Cancelar'};
					addDecoration: (WAWindowDecoration title: 'Modificar');
					yourself).
	anEntity notNil ifTrue: [
		anEntity store
		]
]

{ #category : #'as yet unclassified' }
TBSFactoryView >> initialize [

	super initialize.
	reportsByModel := Dictionary new
	
]

{ #category : #accessing }
TBSFactoryView >> model [
	
	model isNil ifTrue: [model:= Factory on: OperationCharacter].
	^model
	

]

{ #category : #accessing }
TBSFactoryView >> model: anObject [
	model := anObject
]

{ #category : #accessing }
TBSFactoryView >> nuevo [

	| answer  component |
	component := self model nuevoElemento asComponent.
	answer := self call:  (component 
					addValidatedForm: {#save -> 'Guardar nuevo'. #cancel -> 'Cancelar'};
					addDecoration: (WAWindowDecoration title: 'Agregar');
					yourself).
	answer notNil ifTrue: [
		self model add: answer.
		self updateReport].
]

{ #category : #accessing }
TBSFactoryView >> orderSelector [
	
	^ orderSelector
]

{ #category : #accessing }
TBSFactoryView >> orderSelector: anObject [
	
	orderSelector := anObject
]

{ #category : #rendering }
TBSFactoryView >> possibleSearchSelectors [
	^ self model objectClass
		ifNil: [ #() ]
		ifNotNil: [ :each | each possibleSearchSelectors ]
]

{ #category : #adding }
TBSFactoryView >> remove: anObject [

	| answer mensaje|
	mensaje := MensajeDeSistema mensaje: 'Se eliminará definitivamente del sistema. ¿Continua?'.
	answer := self call: (mensaje asComponent 
					addValidatedForm: {#save -> 'Sí'. #cancel -> 'No'};
					addDecoration: (WAWindowDecoration title: 'Confirmación requerida');
					yourself).
	answer notNil ifTrue: [
		[self model remove: anObject] on: GlorpDatabaseWriteError  do: [ :ex | self inform: 'No se puede eliminar porque tiene dependencias.'. ex  ].
		self updateReport]
]

{ #category : #rendering }
TBSFactoryView >> renderAcciones: html [
	
		html select 
			list: self possibleSearchSelectors keys;
			selected: self selectedOrDefaultOrderSelector;
			callback: [:selector | self orderSelector: selector].
		html textInput on: #valueToSearch of: self.			
		html submitButton
			callback: [self searchInstances];
			text: 'Buscar'.
	html submitButton
			callback: [self nuevo];
			text: 'Agregar ', self descripcionClaseSeleccionada.
]

{ #category : #rendering }
TBSFactoryView >> renderContentOn: html [
	"Renderiza el contenido del receptor en html."

		html tbsPanelBody: [
			html form: [  
			self renderMenuAyudaOn: html.
			html div id: 'acciones'; with: [self renderAcciones: html].
			html render: self report
					]
				]

]

{ #category : #'as yet unclassified' }
TBSFactoryView >> renderMenuAyudaOn: html [
	"Renderiza el anchor de menu ayuda para el receptor.
	NOTA: cada clase que implemente la ayuda deberá definir la clase de ayuda."
	
	html div class: #ayuda; with: [html popupAnchor
		scrollbars: true;
		resizable: false;
		extent: 850 @ 600;
		position: 20 @ 20;
		 resourceUrl: 'help/financialSituationInput.html' ;
		location: false;
		menubar: false;
		with: 'Ayuda'
	]. 
]

{ #category : #accessing }
TBSFactoryView >> report [ 

	^reportsByModel at: self model objectClass ifAbsentPut: [self buildReport]
]

{ #category : #accessing }
TBSFactoryView >> searchInstances [

	self model 
		searchSelector: (self possibleSearchSelectors at: self orderSelector);
		searchValue: self valueToSearch asUppercase;
		searchInstances.
	reportsByModel at: self model objectClass put: self buildReport.
]

{ #category : #rendering }
TBSFactoryView >> selectedOrDefaultOrderSelector [

	self orderSelector notNil ifTrue: [ ^self orderSelector ].
	^self model defaultSearchLabel
]

{ #category : #'as yet unclassified' }
TBSFactoryView >> updateReport [  

	^self report rows: self model instances 
]

{ #category : #accessing }
TBSFactoryView >> valueToSearch [
	
	^ valueToSearch
]

{ #category : #accessing }
TBSFactoryView >> valueToSearch: anObject [
	
	valueToSearch := anObject
]

{ #category : #adding }
TBSFactoryView >> ver: anObject [

	| anEntity component |
	component := anObject asComponent.
	anEntity := self call:  (component 
					addValidatedForm: {#cancel -> 'Cerrar'};
					addDecoration: (WAWindowDecoration title: 'Visualizar');
					yourself).
	anEntity notNil ifTrue: [
		self session databaseSession commit: [anEntity]
		]
]
