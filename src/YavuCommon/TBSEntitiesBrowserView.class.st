Class {
	#name : #TBSEntitiesBrowserView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'model',
		'report',
		'selectedTab',
		'orderSelector',
		'valueToSearch',
		'subsystemClass',
		'entityClass'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'as yet unclassified' }
TBSEntitiesBrowserView class >> canBeRoot [ 

	^true
]

{ #category : #'as yet unclassified' }
TBSEntitiesBrowserView class >> claseDeAyuda [
	"Devuelve la clase que modela y define la ayuda del repcetor."
	
	^WAAyudaABMEntidades
]

{ #category : #'instance creation' }
TBSEntitiesBrowserView class >> on: yavuSubsystemClass [

	 ^ self new initializeSubsystemClass: yavuSubsystemClass
]

{ #category : #rendering }
TBSEntitiesBrowserView >> buildReport [
	"Create a MAReport new instance showing the reciver selected model class instances."
	
	| instance |
	instance := entityClass all ifEmpty: [ self model objectClass new ] ifNotEmpty: [ :instances | instances first ].  

	^(MAReport rows: entityClass all description: instance maDescriptionForReport)
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
TBSEntitiesBrowserView >> children [

	^Array with: self report
]

{ #category : #rendering }
TBSEntitiesBrowserView >> descripcionClaseSeleccionada [
	^self selectedOrDefacultEntityClass
		ifNil: [ '' ]
		ifNotNil: [ :each | each label ]
]

{ #category : #adding }
TBSEntitiesBrowserView >> edit: anObject [

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
TBSEntitiesBrowserView >> initialize [

	super initialize.
	report := OrderedCollection new
	
]

{ #category : #initialization }
TBSEntitiesBrowserView >> initializeSubsystemClass: yavuSubsystemClass [

	subsystemClass := yavuSubsystemClass 
]

{ #category : #accessing }
TBSEntitiesBrowserView >> model [
	
	model isNil ifTrue: [model:= Factory on: OperationCharacter].
	^model
	

]

{ #category : #accessing }
TBSEntitiesBrowserView >> model: anObject [
	model := anObject
]

{ #category : #accessing }
TBSEntitiesBrowserView >> nuevo [

	| answer  component |

	component := entityClass new asComponent.
	answer := self call:  (component 
					addValidatedForm: {#save -> 'Guardar nuevo'. #cancel -> 'Cancelar'};
					addDecoration: (WAWindowDecoration title: 'Agregar');
					yourself).
	self halt.
	answer notNil ifTrue: [
		answer addToSystem.
		self updateReport].
]

{ #category : #'as yet unclassified' }
TBSEntitiesBrowserView >> onEntitySelection: aClass [ 
	
	entityClass := aClass.
	report := self buildReport 
]

{ #category : #accessing }
TBSEntitiesBrowserView >> orderSelector [
	
	^ orderSelector
]

{ #category : #accessing }
TBSEntitiesBrowserView >> orderSelector: anObject [
	
	orderSelector := anObject
]

{ #category : #'as yet unclassified' }
TBSEntitiesBrowserView >> possibleEntitiesClasses [

	^ self session yavuSystem allowedEntitiesClassesOn: self subsystemClass.
]

{ #category : #rendering }
TBSEntitiesBrowserView >> possibleSearchSelectors [
	^ self model objectClass
		ifNil: [ #() ]
		ifNotNil: [ :each | each possibleSearchSelectors ]
]

{ #category : #adding }
TBSEntitiesBrowserView >> remove: anObject [

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
TBSEntitiesBrowserView >> renderAcciones: html [
	
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
TBSEntitiesBrowserView >> renderContentOn: html [
	"Renderiza el contenido del receptor en html."

		html tbsPanel beDefault with: [ html tbsPanelHeading: [ html tbsPanelTitle level: 3; with: 'Administración'.	self renderMenuAyudaOn: html. ].
		html tbsPanelBody: [
			html form: [  
			
			self renderEntityClassSelection: html.
			html render: self report
					]
				]
	]
]

{ #category : #rendering }
TBSEntitiesBrowserView >> renderEntityClassSelection: html [

				html select 
					list: self possibleEntitiesClasses ;
					selected: self selectedOrDefacultEntityClass;
					callback: [:oneEntityClass | self onEntitySelection: oneEntityClass].
				html tbsButton 
					beInfo;
					callback: [ ];
					with: 'Buscar'.
				html tbsButton
					beSuccess;
					callback: [self nuevo];
					text: 'Agregar ', self descripcionClaseSeleccionada
					
									
				

]

{ #category : #'as yet unclassified' }
TBSEntitiesBrowserView >> renderMenuAyudaOn: html [
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
TBSEntitiesBrowserView >> report [ 

	^report
]

{ #category : #accessing }
TBSEntitiesBrowserView >> searchInstances [

	self model 
		searchSelector: (self possibleSearchSelectors at: self orderSelector);
		searchValue: self valueToSearch asUppercase;
		searchInstances.
	reportsByModel at: self model objectClass put: self buildReport.
]

{ #category : #rendering }
TBSEntitiesBrowserView >> selectedOrDefacultEntityClass [

	entityClass ifNil: [ ^ self possibleEntitiesClasses  first ].
	^ entityClass 

]

{ #category : #rendering }
TBSEntitiesBrowserView >> selectedOrDefaultOrderSelector [

	self orderSelector notNil ifTrue: [ ^self orderSelector ].
	^self model defaultSearchLabel
]

{ #category : #accessing }
TBSEntitiesBrowserView >> subsystemClass [ 
	
	 ^ subsystemClass 
]

{ #category : #'as yet unclassified' }
TBSEntitiesBrowserView >> updateReport [  

	^self report rows: entityClass all
]

{ #category : #accessing }
TBSEntitiesBrowserView >> valueToSearch [
	
	^ valueToSearch
]

{ #category : #accessing }
TBSEntitiesBrowserView >> valueToSearch: anObject [
	
	valueToSearch := anObject
]

{ #category : #adding }
TBSEntitiesBrowserView >> ver: anObject [

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
