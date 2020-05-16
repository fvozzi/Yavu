Class {
	#name : #TBSYavuObjectsBrowser,
	#superclass : #WAYavuBootstrap,
	#instVars : [
		'instances',
		'report',
		'instanceClass'
	],
	#category : #'YavuCommon-View'
}

{ #category : #'instance creation' }
TBSYavuObjectsBrowser class >> on: aCollectionOfInstances class: aYavuObjectClass [

	^ self new 
		initializeInstances: aCollectionOfInstances class: aYavuObjectClass;
		yourself
]

{ #category : #crud }
TBSYavuObjectsBrowser >> addInstance [
	| answer |
	
	answer := parent call: (self renderAddInstanceForm: instanceClass new ).
	answer notNil
		ifFalse: [ ^ self ].
	answer addToSystem.
	self updateReport
]

{ #category : #rendering }
TBSYavuObjectsBrowser >> buildReport [
	"Create a MAReport new instance showing the reciver selected model class instances."

	^(TBSMagritteReport rows: instances  description: instanceClass new maDescriptionForReport)
		batchSize: 20;
		addColumn: (MACommandColumn new
						addCommandOn: self selector: #viewInstance: text: 'ver';
						addCommandOn: self selector: #editInstance: text: 'modificar';
						addCommandOn: self selector: #removeInstance: text: 'eliminar';
						yourself);
		tableEmpty: 'No hay elementos', instanceClass label, ' para mostrar. Use la opción Buscar.'
		yourself
]

{ #category : #hooks }
TBSYavuObjectsBrowser >> children [

	^Array with: report
]

{ #category : #crud }
TBSYavuObjectsBrowser >> editInstance: anEntity [
	| answer |
	
	
	answer := parent call: (self renderAddInstanceForm: anEntity).
	answer notNil
		ifTrue: [ answer updateToSystem ]
]

{ #category : #initialization }
TBSYavuObjectsBrowser >> initializeInstances: aCollection class: aYavuObjectClass [ 

	instances := aCollection.
	instanceClass := aYavuObjectClass.
	self onInstancesCollectionChanged
]

{ #category : #eventActions }
TBSYavuObjectsBrowser >> onInstancesCollectionChanged [

	report := self buildReport 
]

{ #category : #crud }
TBSYavuObjectsBrowser >> removeInstance: anInstance [
	
	| answer |
	answer := parent call: (self renderRemoveInstanceForm: instanceClass new).
	answer notNil
		ifTrue: [ anInstance removeFromSystem.
			self updateReport ]
]

{ #category : #rendering }
TBSYavuObjectsBrowser >> renderAddInstanceForm: anInstance [
	
	| component |

	component := anInstance asComponent.
	component addDecoration: (
		TBSMagritteFormDecoration new
					buttons: { #save -> 'Guardar'. #cancel -> 'Cancelar' }; 
					formCss: 'form-horizontal';
					legend: 'Agregar ', anInstance class label;
					yourself).
	component addDecoration: TBSMagritteValidationDecoration new.
	component magritteDescription tbsFormHorizontal: true.
	^ component
]

{ #category : #rendering }
TBSYavuObjectsBrowser >> renderContentOn: html [

	html tbsPanelBody: [ 
		html form: [ 
		html tbsColumn: [ 
			html tbsSubmitButton 
			beSuccess;
			callback: [ self addInstance ];
			with: 'Agregar ' , instanceClass label]].
	html div class: 'table-responsive'; with: [  html render: report ]]
]

{ #category : #rendering }
TBSYavuObjectsBrowser >> renderRemoveInstanceForm: anInstance [
	
	| 	component |

	component := (TBSYavuConfirmMessage
		messsage: 'Se eliminará definitivamente del sistema. ¿Continua?') asComponent.

	component addDecoration: (
		TBSMagritteFormDecoration new
					buttons: { #save -> 'Sí, eliminar'. #cancel -> 'No' }; 
					legend: 'Eliminar del sistema ', anInstance class label;
					yourself).
	component addDecoration: TBSMagritteValidationDecoration new.
	component magritteDescription tbsFormHorizontal: true.
	^ component
]

{ #category : #rendering }
TBSYavuObjectsBrowser >> renderViewInstanceForm: anInstance [ 
	
	| component |

	component := 	anInstance asComponent.
	component addDecoration: (
		TBSMagritteFormDecoration new
					buttons: {#cancel -> 'Cerrar' }; 
					formCss: 'form-horizontal';
					legend: 'Ver entidad';
					yourself).
	component magritteDescription tbsFormHorizontal: true.
	^ component
]

{ #category : #initialization }
TBSYavuObjectsBrowser >> updateInstances: aCollection class: aYavuObjectClass [

	self initializeInstances: aCollection class: aYavuObjectClass 
]

{ #category : #eventActions }
TBSYavuObjectsBrowser >> updateReport [  

	^ report rows: instances
]

{ #category : #crud }
TBSYavuObjectsBrowser >> viewInstance: anInstance [

	self call: (self renderViewInstanceForm: anInstance)
]
