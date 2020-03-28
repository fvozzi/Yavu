"
A CUIT is xxxxxxxxx.

XY - 12345678 - Z 

XY: Indican el tipo (Masculino, Femenino o una empresa) 
12345678: Número de DNI 
Z: Código Verificador 

Algoritmo: 

Se determina XY con las siguientes reglas 
Masculino:20 
Femenio:27 
Empresa:30 

Se múltiplica XY 12345678 por un número de forma separada: 
X * 5 
Y * 4 
1 * 3 
2 * 2 
3 * 7 
4 * 6 
5 * 5 
6 * 4 
7 * 3 
8 * 2 

Se suman dichos resultados. 

El resultado obtenido se divide por 11 

De esa división se obtiene un Resto que determina Z 

Si el resto es 0= Entoces Z=0 
Si el resto es 1= Entonces se aplica la siguiente regla: 
*Si es hombre: Z=9 y XY pasa a ser 23 
*Si es mujer: Z=4 y XY pasa a ser 23 

Caso contrario XY pasa a ser (11- Resto). 
"
Class {
	#name : #CUIT,
	#superclass : #YavuObject,
	#instVars : [
		'xy',
		'dni',
		'z',
		'cuit',
		'tipo',
		'multiplicadores'
	],
	#category : #'YavuCommon-Entities'
}

{ #category : #'as yet unclassified' }
CUIT class >> cuit: aLiteral [
	"Crea un nuevo número de cuit."
	
	^super new inicializarCUIT: aLiteral
]

{ #category : #'as yet unclassified' }
CUIT class >> dni: unDni tipo: unTipo [
	"Crea un nuevo número de cuit a partir del numero de dni y el tipo."
	
	^super new inicializarDNI: unDni tipo: unTipo
]

{ #category : #'as yet unclassified' }
CUIT >> calcularDigitoVerificadorUsando: unResto [
	"Si el resto es 0= Entoces Z=0 
	Si el resto es 1= Entonces se aplica la siguiente regla: 
	*Si es hombre: Z=9 y XY pasa a ser 23 
	*Si es mujer: Z=4 y XY pasa a ser 23 
	Caso contrario XY pasa a ser (11- Resto). "
	
	unResto = 0 ifTrue: [^self restoCero].
	unResto = 1 ifTrue: [^self restoUno].
	z := (11 - unResto) asString
		
	
]

{ #category : #calculation }
CUIT >> calcularNumeroDeCUIT [
	"Calcula el número de cuit según el dni y el tipo del receptor."
	
	| digitos sumaDigitos resto |
	
	digitos := self xy, self dni.
	digitos inject: 0 into: [:accum :each | accum + each asString asNumber ].
	sumaDigitos := 0.
	1 to: 10 do: [:index | sumaDigitos := sumaDigitos + ((digitos at: index) asString asNumber * (self multiplicadores at: index))].
	resto := sumaDigitos \\ 11.
	self calcularDigitoVerificadorUsando: resto.
	cuit:= self xy, self dni, self z
]

{ #category : #'as yet unclassified' }
CUIT >> cuit [
	"Devuelve el numero de CUIT/CUIL asociado al receptor."
	
	cuit isNil ifTrue: [self calcularNumeroDeCUIT].
	^cuit
]

{ #category : #'as yet unclassified' }
CUIT >> dni [

	^dni
]

{ #category : #'as yet unclassified' }
CUIT >> inicializarCUIT: aCuitLiteral [
	"Privado - Inicializa el literal del cuit."
	
	cuit := aCuitLiteral
]

{ #category : #'as yet unclassified' }
CUIT >> inicializarDNI: unDni tipo: unTipo [
	"Privado - Inicializa el numero de dni y el tipo.
	NOTA: el tipo puede ser Masculino(M), Femenino(F) u Organizacion(O)."
	
	dni:= self normalizarDNI: unDni.
	tipo:= unTipo
]

{ #category : #'as yet unclassified' }
CUIT >> inicializarMultiplicadores [
	"Privado - Inicializa el mapa de número usados para el calculo del número de cuit."

	multiplicadores := Dictionary new
						at: 1 put: 5;
						at: 2 put: 4;
						at: 3 put: 3;
						at: 4 put: 2;
						at: 5 put: 7;
						at: 6 put: 6;
						at: 7 put: 5;
						at: 8 put: 4;
						at: 9 put: 3;
						at: 10 put: 2;
						yourself

]

{ #category : #'as yet unclassified' }
CUIT >> inicializarXY [
	"Masculino:20, Femenio:27, Empresa:30."
	
	xy:= self tipo xy
]

{ #category : #'as yet unclassified' }
CUIT >> multiplicadores [
	"Devuelve el mapa de números a usar para el calculo del número de CUIT."
	
	multiplicadores isNil ifTrue: [self inicializarMultiplicadores].
	^multiplicadores
]

{ #category : #'as yet unclassified' }
CUIT >> normalizarDNI: unDni [
	"Completa con 0 a la izquierda si unDni tiene menos de 9 caracteres."
	
	| dniNormalizado |
	
	dniNormalizado := '000000000', unDni.
	^dniNormalizado copyFrom: dniNormalizado size - 7 to: dniNormalizado size
]

{ #category : #'as yet unclassified' }
CUIT >> restoCero [

	z:= '0'
]

{ #category : #'as yet unclassified' }
CUIT >> restoUno [

	xy := '23'.
	z := self tipo zParaRestoUno
]

{ #category : #'as yet unclassified' }
CUIT >> tipo [

	^tipo
]

{ #category : #'as yet unclassified' }
CUIT >> xy [

	xy isNil ifTrue: [self inicializarXY].
	^xy
]

{ #category : #'as yet unclassified' }
CUIT >> z [

	^z
]
