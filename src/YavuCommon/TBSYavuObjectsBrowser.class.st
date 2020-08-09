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
	answer := parent call: (self renderAddInstanceForm: self newInstance).
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
		addColumn: self maCommandColumn;
		tableEmpty: 'No hay elementos', instanceClass label, ' para mostrar. Use la opción Buscar.'
		yourself
]

{ #category : #hooks }
TBSYavuObjectsBrowser >> children [

	^Array with: report
]

{ #category : #crud }
TBSYavuObjectsBrowser >> downloadFiles:  anInstance [

	| document fileToDownload |

	fileToDownload := anInstance zipFileToDownload.
	document:= WAMimeDocument
			on: fileToDownload binaryReadStream contents
			mimeType: (WAMimeType main: 'application' sub: 'zip')
			fileName: (fileToDownload basename).

	self requestContext respond: [ :response |
		response
			doNotCache;
			document: document ] 
]

{ #category : #crud }
TBSYavuObjectsBrowser >> editInstance: anEntity [
	| answer originalObject |
	
	
	originalObject := anEntity.
	answer := parent call: (self renderAddInstanceForm: anEntity deepCopy).
	answer notNil
		ifTrue: [ 
			originalObject  copyFrom: answer.
			originalObject updateToSystem ]
]

{ #category : #initialization }
TBSYavuObjectsBrowser >> initializeInstances: aCollection class: aYavuObjectClass [ 

	instances := aCollection.
	instanceClass := aYavuObjectClass.
	report := self buildReport 
]

{ #category : #rendering }
TBSYavuObjectsBrowser >> maCommandColumn [
	
	| column |
	
	column := MACommandColumn new.
	instanceClass maPossibleCommands keysAndValuesDo: [ :commandSymbol :label |
		column addCommandOn: self selector: commandSymbol text: label ].
	^ column
	
]

{ #category : #crud }
TBSYavuObjectsBrowser >> newInstance [
	^ instanceClass new
]

{ #category : #crud }
TBSYavuObjectsBrowser >> removeInstance: anInstance [
	| answer |
	answer := parent
		call: (self renderRemoveInstanceForm: instanceClass new).
	answer notNil
		ifTrue: [ [ anInstance removeFromSystem ]
				on: Error
				do: [ :ex | self inform: ex description ].
			self updateReport ]
]

{ #category : #rendering }
TBSYavuObjectsBrowser >> renderAddInstanceForm: anInstance [
	
	| component |

	component := anInstance asComponent.
	component addDecoration: (
		TBSMagritteFormDecoration new
					buttons: { #save -> 'Guardar'. #cancel -> 'Cancelar' }; 
					formCss: '.col-form-label';
					legend: 'Agregar ', anInstance class label;
					yourself).
	component addDecoration: TBSMagritteValidationDecoration new.
	component magritteDescription tbsFormHorizontal: true.
	^ component
]

{ #category : #rendering }
TBSYavuObjectsBrowser >> renderContentOn: html [

	html cardBody: [ 
		html form: [ 
		html column: [ 
			html formButton 
			beSuccess;
			callback: [ self addInstance ];
			with: 'Agregar ' , instanceClass label]].
	html break.
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
