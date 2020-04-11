Class {
	#name : #TBSEntitiesBrowserView,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'report',
		'selectedTab',
		'orderSelector',
		'valueToSearch',
		'subsystemClass',
		'entityClass',
		'entityClassSelector'
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

{ #category : #accessing }
TBSEntitiesBrowserView class >> exampleName [

	^ 'Entities Browser'
]

{ #category : #'instance creation' }
TBSEntitiesBrowserView class >> on: yavuSubsystemClass [

	 ^ self new initializeSubsystemClass: yavuSubsystemClass
]

{ #category : #crud }
TBSEntitiesBrowserView >> addEntity [

	| answer |

	answer := self call: (self renderAddEntityForm: entityClass new).
	answer notNil ifTrue: [
		answer addToSystem.
		self updateReport].
]

{ #category : #rendering }
TBSEntitiesBrowserView >> buildReport [
	"Create a MAReport new instance showing the reciver selected model class instances."
	
	| instance |
	instance := self entities ifEmpty: [ self selectedOrDefaultEntityClass new ] ifNotEmpty: [ :instances | instances first ].  
	
	^(TBSMagritteReport rows: self entities description: instance maDescriptionForReport)
		batchSize: 20;
		addColumn: (MACommandColumn new
						addCommandOn: self selector: #viewEntity: text: 'ver';
						addCommandOn: self selector: #editEntity: text: 'modificar';
						addCommandOn: self selector: #removeEntity: text: 'eliminar';
						yourself);
		tableEmpty: 'No hay ', self selectedOrDefaultEntityClass label, ' para mostrar. Use la opción Buscar.'
		yourself
]

{ #category : #accessing }
TBSEntitiesBrowserView >> children [

	^Array with: self report
]

{ #category : #crud }
TBSEntitiesBrowserView >> editEntity: anEntity [

	| answer |

	self call: (self renderAddEntityForm: anEntity).
	answer notNil ifTrue: [
		answer updateOnSystem
		]
]

{ #category : #accessing }
TBSEntitiesBrowserView >> entities [ 

	^ entityClass all
]

{ #category : #initialization }
TBSEntitiesBrowserView >> initialize [

	super initialize.
	"entityClass := self selectedOrDefaultEntityClass."
	"report := self buildReport"
	
]

{ #category : #initialization }
TBSEntitiesBrowserView >> initializeSubsystemClass: yavuSubsystemClass [

	subsystemClass := yavuSubsystemClass.
	self onYavuSubsystemChanged
]

{ #category : #eventActions }
TBSEntitiesBrowserView >> onEntitySelection: aClass [ 
	
	entityClass := aClass.
	report := self buildReport 
]

{ #category : #initialization }
TBSEntitiesBrowserView >> onYavuSubsystemChanged [

	self onEntitySelection: self selectedOrDefaultEntityClass
]

{ #category : #accessing }
TBSEntitiesBrowserView >> possibleEntitiesClasses [

	^ (self session yavuSystem allowedEntitiesClassesOn: self subsystemClass)
]

{ #category : #accessing }
TBSEntitiesBrowserView >> possibleSearchSelectors [
	^ self model objectClass
		ifNil: [ #() ]
		ifNotNil: [ :each | each possibleSearchSelectors ]
]

{ #category : #crud }
TBSEntitiesBrowserView >> removeEntity: anEntity [
	| answer mensaje |
	mensaje := MensajeDeSistema
		mensaje: 'Se eliminará definitivamente del sistema. ¿Continua?'.
	answer := self
		call:
			(mensaje asComponent
				addValidatedForm:
					{#save -> 'Sí'. #cancel -> 'No'};
				addDecoration: (WAWindowDecoration title: 'Confirmación requerida');
				yourself).
	answer notNil
		ifTrue: [ anEntity removeFromSystem.
			self updateReport ]
]

{ #category : #rendering }
TBSEntitiesBrowserView >> renderAddEntityForm: anEntity [
	
	| component |

	component := 	anEntity asComponent.
	component addDecoration: (
		TBSMagritteFormDecoration new
					buttons: { #save -> 'Guardar'. #cancel -> 'Cancelar' }; 
					formCss: 'form-horizontal';
					legend: 'Agregar ', anEntity class label;
					yourself).
	component addDecoration: TBSMagritteValidationDecoration new.
	component magritteDescription tbsFormHorizontal: true.
	^ component
]

{ #category : #rendering }
TBSEntitiesBrowserView >> renderContentOn: html [
	"Renderiza el contenido del receptor en html."

	html tbsPanel beDefault 
		with: [ html tbsPanelHeading: [ html tbsPanelTitle level: 3; with: 'Administración de entidades' ].
			    html tbsPanelBody: [ 
					html paragraph: 'Seleccione la clase de entidad para administrar. Una vez seleccionada podrá agregar una nueva entidad de la clase o ver, editar y borrar alguna de las existentes.'.
					html form: [self renderEntityClassSelection: html].
			    html tbsTable: [ html form: [  
			
			
			html render: self report
					]] ] ]


]

{ #category : #rendering }
TBSEntitiesBrowserView >> renderEntityClassSelection: html [

	html text: 'Tipo de entidad:'.
	html select
		list: self possibleEntitiesClasses;
		selected: self selectedOrDefaultEntityClass ;
		callback: [ :oneEntityClass | self onEntitySelection: oneEntityClass ];
		labels: [ :each | each label];
		onChange: 'submit()'.
	html anchor
		callback: [ self addEntity ];
		with: 'Agregar ' , self selectedOrDefaultEntityClass label
]

{ #category : #eventActions }
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

{ #category : #rendering }
TBSEntitiesBrowserView >> renderViewEntityForm: anEntity [
	
	| component |

	component := 	anEntity asComponent.
	component addDecoration: (
		TBSMagritteFormDecoration new
					buttons: {#cancel -> 'Cerrar' }; 
					formCss: 'form-horizontal';
					legend: 'Ver entidad';
					yourself).
	component magritteDescription tbsFormHorizontal: true.
	^ component
]

{ #category : #accessing }
TBSEntitiesBrowserView >> report [ 

	^report
]

{ #category : #rendering }
TBSEntitiesBrowserView >> selectedOrDefaultEntityClass [

	entityClass ifNil: [ ^ self possibleEntitiesClasses  first ].
	^ entityClass 

]

{ #category : #accessing }
TBSEntitiesBrowserView >> subsystemClass [ 
	
	 ^ subsystemClass 
]

{ #category : #eventActions }
TBSEntitiesBrowserView >> updateReport [  

	^self report rows: entityClass all
]

{ #category : #crud }
TBSEntitiesBrowserView >> viewEntity: anEntity [

	self call: (self renderViewEntityForm: anEntity)
]
