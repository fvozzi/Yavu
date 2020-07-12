"
Las instancias de está clase serán los que interactuen con el sistema. Un usuario se crea en una empresa, se le asignan roles, que son los que limitarán los menues del sistema, y se le asginan comercios con los cual podrá interacturar para cargar información.

Instance Variables:
	clave	clave de ingreso al sistema.
	roles	<(Collection of: (Rol | SistemaDeInformes | Usuario))>
	empresa	empresa a la que pertence el usuario.
	comercios	comercios permitidos para interacturar con el sistema.
"
Class {
	#name : #YavuUser,
	#superclass : #YavuEntity,
	#instVars : [
		'roles',
		'email',
		'password',
		'fullName',
		'phoneNumber'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'sin categoria' }
YavuUser class >> allForCompany: aCompany [
	"Devuelve todas las intancias del receptor en el sistema."

	^self yavuSystem read: self where: [:each | each company  = aCompany]
]

{ #category : #'as yet unclassified' }
YavuUser class >> allForCompany: aCompany searchSelector: aSearchSelector searchValue: aSearchValue [
	"Devuelve todas las intancias del receptor en el sistema."

	aSearchValue isEmpty ifTrue: [ ^self allForCompany: aCompany].
	^self yavuSystem readManyOf: self 
		where: [:each | each company  = aCompany AND: [(each perform: aSearchSelector) asUppercase like: aSearchValue, '%']]
]

{ #category : #testing }
YavuUser class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
YavuUser class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Usuario'
]

{ #category : #'instance creation' }
YavuUser class >> new [ 
	"Hack para el autocompletar del navegador."
	
	^ super new 
		name: 'Usuario';
		yourself 
]

{ #category : #accessing }
YavuUser class >> subsystemClass [

	^Smalltalk at: #YavuSecuritySubsystem 
]

{ #category : #configuration }
YavuUser >> addRole: aRole [
	
	self roles add: aRole
]

{ #category : #configuration }
YavuUser >> allowedEntitiesClasses [
	"Devuelve las clases de entidades del receptor."

	^self roles 
		inject: OrderedCollection new 
		into:  [:accum :each | accum addAll: each allowedEntitiesClasses; yourself]
]

{ #category : #descriptions }
YavuUser >> descriptionClave [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAPasswordDescription new 
        	accessor: #password;
        	label: 'Clave';
        	priority: 120;
		 	required: true;
       	 yourself
]

{ #category : #descriptions }
YavuUser >> descriptionEMail [
	"Devuelve un objeto que describe la representación de la variable correo electrónico del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #email;
        	label: 'Correo Electrónico';
        	priority: 180;
        	yourself
]

{ #category : #descriptions }
YavuUser >> descriptionNombreCompleto [
	"Devuelve un objeto que describe la representación de la variable nombre completo del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #fullName;
        	label: 'Nombre completo';
        	priority: 140;
        	yourself
]

{ #category : #descriptions }
YavuUser >> descriptionRol [
	
	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #roles;
		label: 'Roles';
		priority: 220;
		componentClass: TBSListCompositionComponent;
		options: (self subsystem roles);
		beSorted; 
		yourself
]

{ #category : #descriptions }
YavuUser >> descriptionTelefono [
	"Devuelve un objeto que describe la representación de la variable nombre completo del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #phoneNumber;
        	label: 'Teléfono';
        	priority: 160;
        	yourself
]

{ #category : #accessing }
YavuUser >> email [
	"Devuelve el contenido de la variable de instancia email del receptor."
	
	^email
]

{ #category : #accessing }
YavuUser >> email: unEmail [
	"Establece el contenido de la variable de instancia email del receptor con unEmail."
	
	email:= unEmail
]

{ #category : #accessing }
YavuUser >> fullName [
	"Devuelve el nombre completo del usuario.
	NOTA: a diferencia del nombre que refiere al nombre de usuario en el sistema es el nombre y apellido del usuario."
	
	^fullName
]

{ #category : #accessing }
YavuUser >> fullName: unNombre [
	"Establece el nombre completo del usuario con unNombre."
	
	fullName:= unNombre
]

{ #category : #initialization }
YavuUser >> initialize [
	"Initialize the receiver instances variable."
	
	super initialize.
	password := String new.
	roles := OrderedCollection new
]

{ #category : #descriptions }
YavuUser >> maDescriptionForReport [
	"Devuelve un magritte description para ver en una tabla."

	^super maDescriptionForReport reject: [:each | each class = MAPasswordDescription]
]

{ #category : #configuration }
YavuUser >> menuElements [
	"needs refactoring."
	
	^self roles inject: OrderedCollection new into: [:accum :each | accum addAll: each menuElements; yourself]
]

{ #category : #accessing }
YavuUser >> password [
	^ password
]

{ #category : #accessing }
YavuUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
YavuUser >> phoneNumber [
	"Devuelve el contenido de la variable de instancia telefono del receptor."
	
	^phoneNumber
]

{ #category : #accessing }
YavuUser >> phoneNumber: unTelefono [
	"Establece unTelefono como el numero de telefono del receptor."
	
	phoneNumber := unTelefono
]

{ #category : #accessing }
YavuUser >> roles [
	^ roles
]

{ #category : #accessing }
YavuUser >> roles: anObject [

	roles := anObject
]

{ #category : #configuration }
YavuUser >> subsystem [ 

	^ self yavuSystem loginSubsystem
	

	


]
