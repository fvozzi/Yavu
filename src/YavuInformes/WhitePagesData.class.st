Class {
	#name : #WhitePagesData,
	#superclass : #YvObject,
	#instVars : [
		'name',
		'phone',
		'address',
		'city',
		'state'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'sin categoria' }
WhitePagesData class >> emptyNewInstance [ 

	| result |
	
	result := Dictionary new.
	result at: 'name' put: ''.
	result at: 'phone' put: ''.
	result at: 'address' put: ''.
	result at: 'city' put: ''.
	result at: 'state' put: ''.
	^self new initializeFrom: result
]

{ #category : #'initialize-release' }
WhitePagesData class >> forPerson: aPerson padron: aPadronOrString [

	aPerson isNaturalPerson not ifTrue: [ ^self newForLegalPerson: aPerson ].
	aPadronOrString = DatosPadronElectoral  inexistente  ifTrue: [^Array with: WhitePagesData new].
	^self name: aPerson name city: aPadronOrString localidad state: aPadronOrString provincia
]

{ #category : #'as yet unclassified' }
WhitePagesData class >> mapaProvinciaPadron [

	^Dictionary new
		at: 'Bs.As.' put: 'Buenos-Aires';
		at: 'Cordoba' put: 'Cordoba';
		at: 'BS.AS.' put: 'BUENOS-AIRES';
		yourself
]

{ #category : #nil }
WhitePagesData class >> name: aName city: aCity state: aState [

	| httpString result stream streetNumber instances |
	result := Dictionary new.
	instances := OrderedCollection new.
	httpString := 'http://www.paginasblancas.com.ar/Persona/s/'.
	httpString := httpString, (self normalizePersonName: aName).
	httpString := httpString, '/', (self normalizeStateName: aState).
	stream := ReadStream on: (([ZnClient new url: httpString; get] on: Error do: [:ex | '']) ifNil: ['']).
	stream atEnd ifTrue: [
		^instances add: self emptyNewInstance; yourself ].
	[stream atEnd] whileFalse: [
		stream upToAll: 'GLOBAL_CONTEXT.'.
		(stream upToAll: '"phoneAsString":"').
		result at: 'phone' put: (stream upToAll: '","floor"').
		stream upToAll: '"name":"'.
		result at: 'name' put: (stream upToAll: '","id":"'). 
		stream upToAll: '"state":"'.
		result at: 'state' put: (self normalizeString: (stream upToAll: '","type":"')) trimBoth.
		stream upToAll: 'subscriber","city"'.
		result at: 'city' put: (self normalizeString: (stream upToAll: '"streetNumber"')) trimBoth.. 
		streetNumber := self normalizeString: (stream upToAll: ',"localized"').
		(stream upToAll: '"streetName":"').
		result at: 'address' put: (self normalizeString: (stream upToAll: '","phoneAreaCodeList"')) trimBoth, streetNumber. 
		instances add: (self new initializeFrom: result)].
	^instances
]

{ #category : #initialization }
WhitePagesData class >> newForLegalPerson: aLegalPerson [ 
	
	^self name: aLegalPerson name city: '' state: ''
]

{ #category : #'sin categoria' }
WhitePagesData class >> normalizePersonName: aPersonName [

	| subArrays string | 
 	aPersonName isNil ifTrue: [^''].
	subArrays := aPersonName asLowercase subStrings: ' '.
	string := (subArrays at: 1 ifAbsent: ['']), '-'.
	string := string, (subArrays at: 2 ifAbsent: ['']).
	(subArrays at: 3 ifAbsent: ['']) = '' ifFalse: [
		string := string, '-', ((subArrays at: 3) copyFrom: 1 to: 1)
		].
	^string
]

{ #category : #'as yet unclassified' }
WhitePagesData class >> normalizeStateName: aState [ 

	^self mapaProvinciaPadron at: aState ifAbsent: [ 'Buenos-Aires' ]
]

{ #category : #'class initialization' }
WhitePagesData class >> normalizeString: aByteString [ 
	
	| normalizedString |
	
	normalizedString := aByteString replaceAll: $" with: Character space.
	normalizedString := normalizedString replaceAll: $, with: Character space.
	normalizedString := normalizedString replaceAll: $: with: Character space.
	^normalizedString 
]

{ #category : #'sin categoria' }
WhitePagesData >> address [
	^ address
]

{ #category : #'sin categoria' }
WhitePagesData >> address: anObject [
	address := anObject
]

{ #category : #'sin categoria' }
WhitePagesData >> addressDescription [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteContainer>
	^MAStringDescription new 
        	accessor: #address;
        	label: 'Dirección';
        	priority: 120;
		beReadonly;
        	yourself
]

{ #category : #'sin categoria' }
WhitePagesData >> city [
	^ city
]

{ #category : #'sin categoria' }
WhitePagesData >> city: anObject [
	city := anObject
]

{ #category : #'sin categoria' }
WhitePagesData >> cityDescription [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteContainer>
	^MAStringDescription new 
        	accessor: #city;
        	label: 'Ciudad';
        	priority: 130;
		beReadonly;
        	yourself
]

{ #category : #'as yet unclassified' }
WhitePagesData >> hasData [

	^(self name notNil and: [self name notEmpty]) and: [self phone notEmpty]
]

{ #category : #'sin categoria' }
WhitePagesData >> initializeFrom: aDictionary [

	^self 
		name: (aDictionary at: 'name');
		phone: (aDictionary at: 'phone');
		address: (aDictionary at: 'address');
		city: (aDictionary at: 'city');
		state: (aDictionary at: 'state');
		yourself    
]

{ #category : #'sin categoria' }
WhitePagesData >> name [
	^ name
]

{ #category : #'sin categoria' }
WhitePagesData >> name: anObject [
	name := anObject
]

{ #category : #'sin categoria' }
WhitePagesData >> nameDescription [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteContainer>
	^MAStringDescription new 
        	accessor: #name;
        	label: 'Nombre';
        	priority: 100;
		beReadonly;
        	yourself
]

{ #category : #'sin categoria' }
WhitePagesData >> phone [
	^ phone
]

{ #category : #'sin categoria' }
WhitePagesData >> phone: anObject [
	phone := anObject
]

{ #category : #'sin categoria' }
WhitePagesData >> phoneDescription [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteContainer>
	^MAStringDescription new 
        	accessor: #phone;
        	label: 'Teléfono';
        	priority: 110;
		beReadonly;
        	yourself
]

{ #category : #'sin categoria' }
WhitePagesData >> state [
	^ state
]

{ #category : #'sin categoria' }
WhitePagesData >> state: anObject [
	state := anObject
]

{ #category : #'sin categoria' }
WhitePagesData >> stateDescription [
	"Devuelve un objeto que describe la representación de la constancia de inscripcion de empleador del receptor."

	<magritteContainer>
	^MAStringDescription new 
        	accessor: #state;
        	label: 'Provincia';
        	priority: 140;
		beReadonly;
        	yourself
]
