"
Las instancias de está clase serán los que interactuen con el sistema. Un usuario se crea en una empresa, se le asignan roles, que son los que limitarán los menues del sistema, y se le asginan comercios con los cual podrá interacturar para cargar información.

Instance Variables:
	clave	clave de ingreso al sistema.
	roles	<(Collection of: (Rol | SistemaDeInformes | Usuario))>
	empresa	empresa a la que pertence el usuario.
	comercios	comercios permitidos para interacturar con el sistema.
"
Class {
	#name : #SicUser,
	#superclass : #Entity,
	#instVars : [
		'roles',
		'email',
		'password',
		'commerces',
		'company',
		'fullName',
		'phoneNumber'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
SicUser class >> allForCompany: aCompany [
	"Devuelve todas las intancias del receptor en el sistema."

	^self yavuSystem read: self where: [:each | each company  = aCompany]
]

{ #category : #'as yet unclassified' }
SicUser class >> allForCompany: aCompany searchSelector: aSearchSelector searchValue: aSearchValue [
	"Devuelve todas las intancias del receptor en el sistema."

	aSearchValue isEmpty ifTrue: [ ^self allForCompany: aCompany].
	^self yavuSystem readManyOf: self 
		where: [:each | each company  = aCompany AND: [(each perform: aSearchSelector) asUppercase like: aSearchValue, '%']]
]

{ #category : #testing }
SicUser class >> isVoyageRoot [

	 ^true 
]

{ #category : #'sin categoria' }
SicUser class >> label [
	"Devuelve una descripción de la clase del receptor."

	^'Usuario'
]

{ #category : #'sin categoria' }
SicUser class >> name: aString company: aCompany [
	"Crea una nueva instancia del receptor inicializada con nombre = unString y empresa = unaEmpresa."
	 
	^(self name: aString) initializeCompany: aCompany
]

{ #category : #'sin categoria' }
SicUser >> addRole: aRole [
	
	self roles add: aRole
]

{ #category : #'sin categoria' }
SicUser >> agregarComercio: unComercio [ 
	"Agrega unComercio permitido a la lista de comercios del receptor."
	
	^self commerces add: unComercio
]

{ #category : #'sin categoria' }
SicUser >> allowedEntitiesClasses [
	"Devuelve las clases de entidades del receptor."

	^self roles 
		inject: OrderedCollection new 
		into:  [:accum :each | accum addAll: each allowedEntitiesClasses; yourself]
]

{ #category : #'sin categoria' }
SicUser >> comerciosAsignados [
	"Devuelve la cantidad de comercios asginados al receptor."
	
	^self commerces size
]

{ #category : #'sin categoria' }
SicUser >> commerces [
	"Devuelve la colección de comercios permitidos del receptor."
	
	^commerces
]

{ #category : #'sin categoria' }
SicUser >> commerces: unColeccionDeComercios [
	"Setea la colección de comercios permitidos del receptor."
	
	commerces:= unColeccionDeComercios
]

{ #category : #'sin categoria' }
SicUser >> company [ 

	^company
]

{ #category : #'sin categoria' }
SicUser >> company: unaEmpresa [

	company:= unaEmpresa
]

{ #category : #'as yet unclassified' }
SicUser >> defaultCommerce [
	"Devuelve el comercio predeterminado del receptor. 
	NOTA: por ahora es el primero pero si van a aparecer muchos usuarios con más de un comercio
	tendriamos que setearlo a una variable de instancia."
	
	| varios |

	varios :=  self sicSession yavuSystem commerceOfName: 'Varios'  inCompany: self company.
	(self commerces detect: [:one | one = varios] ifNone: []) ifNotNil: [:object | ^object].
	^self sortedCommerces ifEmpty: [Commerce inexistente] ifNotEmpty: [:object | object first]
]

{ #category : #'sin categoria' }
SicUser >> descriptionClave [
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
SicUser >> descriptionEMail [
	"Devuelve un objeto que describe la representación de la variable correo electrónico del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #email;
        	label: 'Correo Electrónico';
        	priority: 180;
        	yourself
]

{ #category : #'sin categoria' }
SicUser >> descriptionEmpresa [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #company;
		label: 'Empresa';
		priority: 200;
		options: Company all;
		beSorted;
		beRequired;
		yourself
]

{ #category : #'sin categoria' }
SicUser >> descriptionNombreCompleto [
	"Devuelve un objeto que describe la representación de la variable nombre completo del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #fullName;
        	label: 'Nombre completo';
        	priority: 140;
        	yourself
]

{ #category : #'sin categoria' }
SicUser >> descriptionRol [
	
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
SicUser >> descriptionTelefono [
	"Devuelve un objeto que describe la representación de la variable nombre completo del receptor."

	<magritteDescription>
	^MAStringDescription new 
        	accessor: #phoneNumber;
        	label: 'Teléfono';
        	priority: 160;
        	yourself
]

{ #category : #'sin categoria' }
SicUser >> email [
	"Devuelve el contenido de la variable de instancia email del receptor."
	
	^email
]

{ #category : #'sin categoria' }
SicUser >> email: unEmail [
	"Establece el contenido de la variable de instancia email del receptor con unEmail."
	
	email:= unEmail
]

{ #category : #'as yet unclassified' }
SicUser >> financialSituationsOfCommerceFileReference [

	"hay usuarios que pueden tener habilitado más de un comercio pero no parece tener sentido que recien el mail esos usuarios."
	self commerces first createFileOfFinancialSituations.
	^self commerces first nameOfFileOfFinancialSituations 
]

{ #category : #'sin categoria' }
SicUser >> fullName [
	"Devuelve el nombre completo del usuario.
	NOTA: a diferencia del nombre que refiere al nombre de usuario en el sistema es el nombre y apellido del usuario."
	
	^fullName
]

{ #category : #'sin categoria' }
SicUser >> fullName: unNombre [
	"Establece el nombre completo del usuario con unNombre."
	
	fullName:= unNombre
]

{ #category : #'sin categoria' }
SicUser >> initialize [
	"Initialize the receiver instances variable."
	
	super initialize.
	password := String new.
	roles := OrderedCollection new.
	commerces := OrderedCollection new
]

{ #category : #'sin categoria' }
SicUser >> initializeCompany: unaEmpresa [ 

	company := unaEmpresa
]

{ #category : #'sin categoria' }
SicUser >> maDescriptionForReport [
	"Devuelve un magritte description para ver en una tabla."

	^super maDescriptionForReport reject: [:each | each class = MAPasswordDescription]
]

{ #category : #'as yet unclassified' }
SicUser >> menuElements [
	"needs refactoring."
	
	^self roles inject: OrderedCollection new into: [:accum :each | accum addAll: each menuElements; yourself]
]

{ #category : #'sin categoria' }
SicUser >> password [
	^ password
]

{ #category : #'sin categoria' }
SicUser >> password: anObject [
	password := anObject
]

{ #category : #'sin categoria' }
SicUser >> phoneNumber [
	"Devuelve el contenido de la variable de instancia telefono del receptor."
	
	^phoneNumber
]

{ #category : #'sin categoria' }
SicUser >> phoneNumber: unTelefono [
	"Establece unTelefono como el numero de telefono del receptor."
	
	phoneNumber := unTelefono
]

{ #category : #'sin categoria' }
SicUser >> roles [
	^ roles
]

{ #category : #'sin categoria' }
SicUser >> roles: anObject [

	roles := anObject
]

{ #category : #'as yet unclassified' }
SicUser >> sortedCommerces [
	"Devuelve la colección ordenada de comercios permitidos del receptor."
	
	^self commerces asSortedCollection
]
