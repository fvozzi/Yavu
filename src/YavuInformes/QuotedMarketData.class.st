Class {
	#name : #QuotedMarketData,
	#superclass : #YavuTransaction,
	#instVars : [
		'dolar',
		'cereal'
	],
	#category : #'YavuInformes-DomainModel'
}

{ #category : #'as yet unclassified' }
QuotedMarketData class >> createAndStoreInstanceFor: aDate [

	| instance |
	
	instance := self new date: aDate; yourself.
	"Solo lo persisto si trajo datos de dolar y cereal. Sino, no, asi lo vuelve a buscar de la web en el proximo acceso."
	"(instance dolarCompraOficial notEmpty and: [ instance ultimoSoja notEmpty ]) ifTrue: [ 
		instance store ]."
	^instance
]

{ #category : #'as yet unclassified' }
QuotedMarketData class >> instanceOf: aDate [
	"Busca en la BD la cotizacion del día. Si no existe, la busca en la web y la persiste y la devuelve"

	| instances |
"	instances:= self yavuSystem readManyOf: self where: [:each | each date = aDate]."
	instances := OrderedCollection new.
	instances isEmpty ifTrue: [ ^self createAndStoreInstanceFor: aDate].
	^instances first
]

{ #category : #accesing }
QuotedMarketData >> anteriorMaiz [
	
	^self cotizacionCereal: 'maiz' tipo: 'anterior'
]

{ #category : #accesing }
QuotedMarketData >> anteriorMaiz: unaCotizacion [
	
	^self setCotizacionCereal: 'maiz' tipo: 'anterior' con: unaCotizacion 
]

{ #category : #accesing }
QuotedMarketData >> anteriorSoja [
	
	^self cotizacionCereal: 'soja' tipo: 'anterior'
]

{ #category : #accesing }
QuotedMarketData >> anteriorSoja: unaCotizacion [
	
	^self setCotizacionCereal: 'soja' tipo: 'anterior' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> anteriorTrigo [
	
	^self cotizacionCereal: 'trigo' tipo: 'anterior'
]

{ #category : #accesing }
QuotedMarketData >> anteriorTrigo: unaCotizacion [
	
	^self setCotizacionCereal: 'trigo' tipo: 'anterior' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> cereal [
	"Responde un diccionario con las cotizaciones de la soja, maiz y trigo.
	Fuente: Ambito financiero."
	
	cereal isNil ifTrue: [self initializeCerealQuotedData].
	^cereal
	
]

{ #category : #testing }
QuotedMarketData >> convertirVariacionANumero: unStringDeVariacion [

	| result |
	unStringDeVariacion isEmpty ifTrue: [^0].
	result := unStringDeVariacion copyFrom: 1 to: unStringDeVariacion size - 1.
	result := result replaceAll: $, with: $. .
	^result asNumber
]

{ #category : #'sin categoria' }
QuotedMarketData >> cotizacionCereal: mercado tipo: tipoOperacion [

	^self cereal at: tipoOperacion asLowercase capitalized, ' ', mercado asLowercase capitalized 
]

{ #category : #'sin categoria' }
QuotedMarketData >> cotizacionDolarMercado: mercado tipo: tipoOperacion [

	^self dolar at: tipoOperacion asLowercase capitalized, ' ', mercado asLowercase capitalized 
]

{ #category : #accesing }
QuotedMarketData >> dolar [
	"Responde un diccionario con las cotizaciones del dolar formal e informal.
	Fuente: Ambito financiero."
	
	dolar isNil ifTrue: [self initializeDolarQuotedData].
	^dolar
	
]

{ #category : #accesing }
QuotedMarketData >> dolarCompraInformal [
	
	^self cotizacionDolarMercado: 'informal' tipo: 'compra'
]

{ #category : #accesing }
QuotedMarketData >> dolarCompraInformal: unaCotizacion [
	
	^self setCotizacionDolarMercado: 'informal' tipo: 'compra' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> dolarCompraOficial [
	
	^self cotizacionDolarMercado: 'oficial' tipo: 'compra'
]

{ #category : #accesing }
QuotedMarketData >> dolarCompraOficial: unaCotizacion [
	
	^self setCotizacionDolarMercado: 'oficial' tipo: 'compra' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> dolarInformalBaja [

	^self variacionDolarInformalAsNumber < 0
]

{ #category : #accesing }
QuotedMarketData >> dolarInformalSube [

	^self variacionDolarInformalAsNumber > 0
]

{ #category : #accesing }
QuotedMarketData >> dolarOficialBaja [

	^self variacionDolarOficialAsNumber < 0
]

{ #category : #accesing }
QuotedMarketData >> dolarOficialSube [

	^self variacionDolarOficialAsNumber > 0
]

{ #category : #accesing }
QuotedMarketData >> dolarVariacionInformal [

	^self cotizacionDolarMercado: 'informal' tipo: 'variacion' 
]

{ #category : #accesing }
QuotedMarketData >> dolarVariacionInformal: unaCotizacion [

	^self setCotizacionDolarMercado: 'informal' tipo: 'variacion' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> dolarVariacionOficial [

	^self cotizacionDolarMercado: 'oficial' tipo: 'variacion' 
]

{ #category : #accesing }
QuotedMarketData >> dolarVariacionOficial: unaCotizacion [

	^self setCotizacionDolarMercado: 'oficial' tipo: 'variacion' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> dolarVentaInformal [

	^self cotizacionDolarMercado: 'informal' tipo: 'venta'
]

{ #category : #accesing }
QuotedMarketData >> dolarVentaInformal: unaCotizacion [

	^self setCotizacionDolarMercado: 'informal' tipo: 'venta' con: unaCotizacion 
]

{ #category : #accesing }
QuotedMarketData >> dolarVentaOficial [

	^self cotizacionDolarMercado: 'oficial' tipo: 'venta'
]

{ #category : #accesing }
QuotedMarketData >> dolarVentaOficial: unaCotizacion [

	^self setCotizacionDolarMercado: 'oficial' tipo: 'venta' con: unaCotizacion 
]

{ #category : #httpData }
QuotedMarketData >> getHttpCerealQuotedString [
	
	^ [ 
	ZnClient new
		timeout: YavuPersistentSubsystem externalHttpConnectionTimeout;
		get: 'http://www.ambito.com/economia/mercados/granos/' ]
		on: ConnectionTimedOut, NameLookupFailure, ZnParseError 
		do: [ :ex | '' ]
]

{ #category : #httpData }
QuotedMarketData >> getHttpDolarQuotedString [
	^ [ 
	ZnClient new
		timeout: YavuPersistentSubsystem externalHttpConnectionTimeout;
		get: 'http://www.ambito.com/economia/mercados/monedas/dolar/' ]
		on: ConnectionTimedOut, NameLookupFailure , ZnParseError 
		do: [ :ex | '' ]
]

{ #category : #httpData }
QuotedMarketData >> initializeCerealQuotedData [
	| result stream httpString |
	result := Dictionary new.
	httpString := self getHttpCerealQuotedString.
	stream := ReadStream on: httpString.
	#('Soja' 'Maiz' 'Trigo')
		do: [ :cerealData | 
			stream
				upToAll: '<span>MERCADO INTERNACIONAL</span></h2>';
				upToAll: 'color:'.
			stream upToAll: '>'.
			result at: 'Variacion ' , cerealData put: (stream upToAll: '</b>').
			stream upToAll: '<div class="ultimo"><b>'.
			result at: 'Ultimo ' , cerealData put: (stream upToAll: '</b>').
			stream upToAll: '<div class="cierreAnterior"><b>'.
			result at: 'Anterior ' , cerealData put: (stream upToAll: '</b>') ].
	cereal := result
]

{ #category : #httpData }
QuotedMarketData >> initializeDolarQuotedData [
	| result stream httpString |
	result := Dictionary new.
	httpString := self getHttpDolarQuotedString.
	stream := ReadStream on: httpString.
	#('Oficial' 'Informal' 'Mayorista')
		do: [ :tipoDolar | 
			stream
				upToAll: '<div class="variacion">';
				upToAll: '>'.
			result at: 'Variacion ' , tipoDolar put: (stream upToAll: '</big>').
			stream upToAll: '<div class="ultimo"><big>'.
			result at: 'Compra ' , tipoDolar put: (stream upToAll: '</big>').
			stream upToAll: '<div class="cierreAnterior"><big>'.
			result at: 'Venta ' , tipoDolar put: (stream upToAll: '</big>') ].
	dolar := result
]

{ #category : #'as yet unclassified' }
QuotedMarketData >> setCotizacionCereal: mercado tipo: tipoOperacion con: unaCotizacion [

	^self cereal at: tipoOperacion asLowercase capitalized, ' ', mercado asLowercase capitalized put: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> setCotizacionDolarMercado: mercado tipo: tipoOperacion con: unaCotizacion [

	^self dolar at: tipoOperacion asLowercase capitalized, ' ', mercado asLowercase capitalized put: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> ultimoMaiz [
	
	^self cotizacionCereal: 'maiz' tipo: 'ultimo'
]

{ #category : #accesing }
QuotedMarketData >> ultimoMaiz: unaCotizacion [
	
	^self setCotizacionCereal: 'maiz' tipo: 'ultimo' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> ultimoSoja [
	
	^self cotizacionCereal: 'soja' tipo: 'ultimo'
]

{ #category : #accesing }
QuotedMarketData >> ultimoSoja: unaCotizacion [
	
	^self setCotizacionCereal: 'soja' tipo: 'ultimo' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> ultimoTrigo [
	
	^self cotizacionCereal: 'maiz' tipo: 'ultimo'
]

{ #category : #accesing }
QuotedMarketData >> ultimoTrigo: unaCotizacion [
	
	^self setCotizacionCereal: 'maiz' tipo: 'ultimo' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> variacionCereal: unCereal [

	^self convertirVariacionANumero: (self cotizacionCereal: unCereal tipo: 'variacion')
]

{ #category : #accesing }
QuotedMarketData >> variacionDolarInformalAsNumber [

	| result |
	self dolarVariacionInformal isEmpty ifTrue: [ ^0 ].
	result := self dolarVariacionInformal copyFrom: 1 to: self dolarVariacionInformal size - 1.
	result := result replaceAll: $, with: $. .
	^result asNumber
]

{ #category : #accesing }
QuotedMarketData >> variacionDolarOficialAsNumber [

	| result |
	self dolarVariacionOficial isEmpty ifTrue: [ ^0 ].
	result := self dolarVariacionOficial copyFrom: 1 to: self dolarVariacionOficial size - 1.
	result := result replaceAll: $, with: $. .
	^result asNumber
]

{ #category : #accesing }
QuotedMarketData >> variacionMaiz [
	
	^self cotizacionCereal: 'maiz' tipo: 'variacion'
]

{ #category : #accesing }
QuotedMarketData >> variacionMaiz: unaCotizacion [
	
	^self setCotizacionCereal: 'maiz' tipo: 'variacion' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> variacionSoja [
	
	^self cotizacionCereal: 'soja' tipo: 'variacion'
]

{ #category : #accesing }
QuotedMarketData >> variacionSoja: unaCotizacion [
	
	^self setCotizacionCereal: 'soja' tipo: 'variacion' con: unaCotizacion
]

{ #category : #accesing }
QuotedMarketData >> variacionTrigo [
	
	^self cotizacionCereal: 'trigo' tipo: 'variacion'
]

{ #category : #accesing }
QuotedMarketData >> variacionTrigo: unaCotizacion [
	
	^self setCotizacionCereal: 'trigo' tipo: 'variacion' con: unaCotizacion
]
