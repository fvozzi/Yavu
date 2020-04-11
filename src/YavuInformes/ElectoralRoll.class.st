Class {
	#name : #ElectoralRoll,
	#superclass : #YavuEntity,
	#instVars : [
		'sex',
		'birthday',
		'age',
		'address',
		'city',
		'state',
		'zipCode',
		'occupation',
		'cuit',
		'dni'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #accessing }
ElectoralRoll >> address [
	
	^ address
]

{ #category : #accessing }
ElectoralRoll >> address: anObject [
	
	address := anObject
]

{ #category : #rendering }
ElectoralRoll >> addressDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #address;
		label: 'Dirección';
		priority: 180;
		beReadonly;
		yourself
		

]

{ #category : #accessing }
ElectoralRoll >> age [
	
	^ age
]

{ #category : #accessing }
ElectoralRoll >> age: anObject [
	
	age := anObject
]

{ #category : #rendering }
ElectoralRoll >> ageDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #age;
		label: 'Edad';
		priority: 140;
		beReadonly;
		yourself
]

{ #category : #accessing }
ElectoralRoll >> birthday [
	
	^ birthday
]

{ #category : #accessing }
ElectoralRoll >> birthday: anObject [
	
	birthday := anObject
]

{ #category : #rendering }
ElectoralRoll >> birthdayDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MADateDescription new
		accessor: #birthday;
		label: 'Fecha Nacimiento';
		priority: 120;
		beReadonly;
		yourself
]

{ #category : #accessing }
ElectoralRoll >> city [
	
	^ city
]

{ #category : #accessing }
ElectoralRoll >> city: anObject [
	
	city := anObject
]

{ #category : #rendering }
ElectoralRoll >> cityDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #city;
		label: 'Ciudad';
		priority: 200;
		beReadonly;
		yourself
]

{ #category : #accessing }
ElectoralRoll >> cuit [
	
	^ cuit
]

{ #category : #accessing }
ElectoralRoll >> cuit: anObject [
	
	cuit := anObject
]

{ #category : #rendering }
ElectoralRoll >> descriptionNombre [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #name;
		label: 'Nombre';
		priority: 100;
		beReadonly;
		yourself
]

{ #category : #accessing }
ElectoralRoll >> dni [
	
	^ dni
]

{ #category : #accessing }
ElectoralRoll >> dni: anObject [
	
	dni := anObject
]

{ #category : #accessing }
ElectoralRoll >> hasAnyData [

	^true
]

{ #category : #accessing }
ElectoralRoll >> occupation [
	
	^ occupation
]

{ #category : #accessing }
ElectoralRoll >> occupation: anObject [
	
	occupation := anObject
]

{ #category : #rendering }
ElectoralRoll >> occupationDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #occupation ;
		label: 'Ocupación';
		priority: 240;
		beReadonly;
		yourself
]

{ #category : #'as yet unclassified' }
ElectoralRoll >> setAgeFromString: anString [
	"Setea la edad como un numero luego de parsearlo de unString. Ej: anString contiene una edad en esta forma: 34 años."
	
	self age: ([anString trimRight: [ :c |  ' años' includes: c ]] on: Error do: [ :ex | 0 ])
]

{ #category : #accessing }
ElectoralRoll >> sex [
	
	^ sex
]

{ #category : #accessing }
ElectoralRoll >> sex: anObject [
	
	sex := anObject
]

{ #category : #rendering }
ElectoralRoll >> sexDescription [
	"Devuelve un objeto que describe la representación de la variable sexo del receptor."

	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #sex;
		label: 'Sexo' ; 
		priority: 100;
		beSorted;
		beReadonly;
		yourself
]

{ #category : #'as yet unclassified' }
ElectoralRoll >> sexInNaturalPersonFormat [

	^self sex size > 1 ifTrue: [ self sex first asString ]
]

{ #category : #accessing }
ElectoralRoll >> state [
	
	^ state
]

{ #category : #accessing }
ElectoralRoll >> state: anObject [
	
	state := anObject
]

{ #category : #rendering }
ElectoralRoll >> stateDescription [
	"Devuelve un objeto que describe la representación de la variable dni del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #state;
		label: 'Provincia';
		priority: 220;
		beReadonly;
		yourself
]

{ #category : #accessing }
ElectoralRoll >> zipCode [
	
	^ zipCode
]

{ #category : #accessing }
ElectoralRoll >> zipCode: anObject [
	
	zipCode := anObject
]

{ #category : #rendering }
ElectoralRoll >> zipCodeDescription [
	"Devuelve un objeto que describe la representación de la variable zipCode del receptor."

	<magritteDescription>
	^MAStringDescription new 
		accessor: #zipCode ;
		label: 'Cod. Postal';
		priority: 260;
		beReadonly;
		yourself
]
