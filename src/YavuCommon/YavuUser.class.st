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
		'commerces',
		'company',
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

{ #category : #'sin categoria' }
YavuUser class >> name: aString company: aCompany [
	"Crea una nueva instancia del receptor inicializada con nombre = unString y empresa = unaEmpresa."
	 
	^(self name: aString) initializeCompany: aCompany
]

{ #category : #'sin categoria' }
YavuUser >> addRole: aRole [
	
	self roles add: aRole
]

{ #category : #'as yet unclassified' }
YavuUser >> addToSystem [
	
	self yavuSystem loginSubsystem addUser: self
]

{ #category : #'sin categoria' }
YavuUser >> agregarComercio: unComercio [ 
	"Agrega unComercio permitido a la lista de comercios del receptor."
	
	^self commerces add: unComercio
]

{ #category : #'sin categoria' }
YavuUser >> allowedEntitiesClasses [
	"Devuelve las clases de entidades del receptor."

	^self roles 
		inject: OrderedCollection new 
		into:  [:accum :each | accum addAll: each allowedEntitiesClasses; yourself]
]

{ #category : #'sin categoria' }
YavuUser >> comerciosAsignados [
	"Devuelve la cantidad de comercios asginados al receptor."
	
	^self commerces size
]

{ #category : #'sin categoria' }
YavuUser >> commerces [
	"Devuelve la colección de comercios permitidos del receptor."
	
	^commerces
]

{ #category : #'sin categoria' }
YavuUser >> commerces: unColeccionDeComercios [
	"Setea la colección de comercios permitidos del receptor."
	
	commerces:= unColeccionDeComercios
]

{ #category : #'sin categoria' }
YavuUser >> company [ 

	^company
]

{ #category : #'sin categoria' }
YavuUser >> company: unaEmpresa [

	company:= unaEmpresa
]

{ #category : #'as yet unclassified' }
YavuUser >> defaultCommerce [
	"Devuelve el comercio predeterminado del receptor. 
	NOTA: por ahora es el primero pero si van a aparecer muchos usuarios con más de un comercio
	tendriamos que setearlo a una variable de instancia."
	
	| varios |

	varios :=  self sicSession yavuSystem commerceOfName: 'Varios'  inCompany: self company.
	(self commerces detect: [:one | one = varios] ifNone: []) ifNotNil: [:object | ^object].
	^self sortedCommerces ifEmpty: [Commerce inexistente] ifNotEmpty: [:object | object first]
]

{ #category : #'sin categoria' }
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

{ #category : #'sin categoria' }
YavuUser >> descriptionEMail [
	"Devuelve un objeto que describe la representación de la variable correo electrónico del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #email;
        	label: 'Correo Electrónico';
        	priority: 180;
        	yourself
]

{ #category : #'sin categoria' }
YavuUser >> descriptionNombreCompleto [
	"Devuelve un objeto que describe la representación de la variable nombre completo del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #fullName;
        	label: 'Nombre completo';
        	priority: 140;
        	yourself
]

{ #category : #'sin categoria' }
YavuUser >> descriptionRol [
	
	<magritteDescription>
	^MAMultipleOptionDescription new
		accessor: #roles;
		label: 'Roles';
		priority: 220;
		componentClass: MAListCompositonComponent;
		options: Role all;
		beSorted; 
		yourself
]

{ #category : #'sin categoria' }
YavuUser >> descriptionTelefono [
	"Devuelve un objeto que describe la representación de la variable nombre completo del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #phoneNumber;
        	label: 'Teléfono';
        	priority: 160;
        	yourself
]

{ #category : #'sin categoria' }
YavuUser >> email [
	"Devuelve el contenido de la variable de instancia email del receptor."
	
	^email
]

{ #category : #'sin categoria' }
YavuUser >> email: unEmail [
	"Establece el contenido de la variable de instancia email del receptor con unEmail."
	
	email:= unEmail
]

{ #category : #'as yet unclassified' }
YavuUser >> financialSituationsOfCommerceFileReference [

	"hay usuarios que pueden tener habilitado más de un comercio pero no parece tener sentido que recien el mail esos usuarios."
	self commerces first createFileOfFinancialSituations.
	^self commerces first nameOfFileOfFinancialSituations 
]

{ #category : #'sin categoria' }
YavuUser >> fullName [
	"Devuelve el nombre completo del usuario.
	NOTA: a diferencia del nombre que refiere al nombre de usuario en el sistema es el nombre y apellido del usuario."
	
	^fullName
]

{ #category : #'sin categoria' }
YavuUser >> fullName: unNombre [
	"Establece el nombre completo del usuario con unNombre."
	
	fullName:= unNombre
]

{ #category : #'sin categoria' }
YavuUser >> initialize [
	"Initialize the receiver instances variable."
	
	super initialize.
	password := String new.
	roles := OrderedCollection new.
	commerces := OrderedCollection new
]

{ #category : #'sin categoria' }
YavuUser >> initializeCompany: unaEmpresa [ 

	company := unaEmpresa
]

{ #category : #'sin categoria' }
YavuUser >> maDescriptionForReport [
	"Devuelve un magritte description para ver en una tabla."

	^super maDescriptionForReport reject: [:each | each class = MAPasswordDescription]
]

{ #category : #'as yet unclassified' }
YavuUser >> menuElements [
	"needs refactoring."
	
	^self roles inject: OrderedCollection new into: [:accum :each | accum addAll: each menuElements; yourself]
]

{ #category : #'sin categoria' }
YavuUser >> password [
	^ password
]

{ #category : #'sin categoria' }
YavuUser >> password: anObject [
	password := anObject
]

{ #category : #'sin categoria' }
YavuUser >> phoneNumber [
	"Devuelve el contenido de la variable de instancia telefono del receptor."
	
	^phoneNumber
]

{ #category : #'sin categoria' }
YavuUser >> phoneNumber: unTelefono [
	"Establece unTelefono como el numero de telefono del receptor."
	
	phoneNumber := unTelefono
]

{ #category : #'sin categoria' }
YavuUser >> roles [
	^ roles
]

{ #category : #'sin categoria' }
YavuUser >> roles: anObject [

	roles := anObject
]

{ #category : #'as yet unclassified' }
YavuUser >> sortedCommerces [
	"Devuelve la colección ordenada de comercios permitidos del receptor."
	
	^self commerces asSortedCollection
]