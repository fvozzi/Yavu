Class {
	#name : #WAQuotedMarketDataComponent,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'model'
	],
	#category : #'YavuInformes-View'
}

{ #category : #accessing }
WAQuotedMarketDataComponent >> colorVariacionCereal: unCereal [

	(self model variacionCereal: unCereal) > 0 ifTrue:  [^'#66CC00'].
	(self model variacionCereal: unCereal) < 0 ifTrue: [^'#C00'].
	^'#006C93'
]

{ #category : #accessing }
WAQuotedMarketDataComponent >> colorVariacionDolarInformal [

	self model dolarInformalSube ifTrue: [^'#66CC00'].
	self model dolarInformalBaja ifTrue: [^'#C00'].
	^'#006C93'
]

{ #category : #accessing }
WAQuotedMarketDataComponent >> colorVariacionDolarOficial [

	self model dolarOficialSube ifTrue: [^'#66CC00'].
	self model dolarOficialBaja ifTrue: [^'#C00'].
	^'#006C93'
]

{ #category : #initialization }
WAQuotedMarketDataComponent >> initializeModel [
	
	model := QuotedMarketData instanceOf: Date today
]

{ #category : #accessing }
WAQuotedMarketDataComponent >> model [
	
	model isNil ifTrue: [self initializeModel].
	^model
]

{ #category : #rendering }
WAQuotedMarketDataComponent >> renderContentOn: html [
	"Renderiza la cotizacion del dolar y los cereales en html."
	
	self 
		renderCotizacionDolarOn: html;
		renderCotizacionCerealesOn: html
]

{ #category : #rendering }
WAQuotedMarketDataComponent >> renderCotizacionCerealesOn: html [

	html div id: 'cereal'; with: [
		html div id: 'soja'; with: [
			html div class: 'titulo'; with: [
					html strong: 'Soja'.
					html image resourceUrl: 'img/soja.jpg'].
			html div class: 'cotizacion'; style: 'background-image:url(', (html absoluteUrlForResource: 'img/fondo_bonos.jpg') asString, ')'; with: [
				html div class: 'variacion'; style: 'color:', (self colorVariacionCereal: 'soja'); with: [
					html image resourceUrl: (self urlImagenVariacionCereal: 'soja').
					html big: (self model cotizacionCereal: 'soja' tipo: 'variacion')].
				html div class: 'ultimo'; with: [
					html big: (self model cotizacionCereal: 'soja' tipo: 'ultimo').
					html text: 'Compra'].
				html div class: 'cierreAnterior'; with: [
					html big: (self model cotizacionCereal: 'soja' tipo: 'anterior').
					html text: 'Venta']
				]
			].
		html div id: 'trigo'; with: [
			html div class: 'titulo'; with: [
					html strong: 'Trigo'.
					html image resourceUrl: 'img/trigo.jpg'].
			html div class: 'cotizacion'; style: 'background-image:url(', (html absoluteUrlForResource: 'img/fondo_bonos.jpg') asString, ')'; with: [
				html div class: 'variacion'; style: 'color:', (self colorVariacionCereal: 'trigo'); with: [
					html image resourceUrl: (self urlImagenVariacionCereal: 'trigo').
					html big: (self model cotizacionCereal: 'trigo' tipo: 'variacion')].
				html div class: 'ultimo'; with: [
					html big: (self model cotizacionCereal: 'trigo' tipo: 'ultimo').
					html text: 'Compra'].
				html div class: 'cierreAnterior'; with: [
					html big: (self model cotizacionCereal: 'trigo' tipo: 'anterior').
					html text: 'Venta']
				]
			].
		html div id: 'maiz'; with: [
			html div class: 'titulo'; with: [
					html strong: 'Maiz'.
					html image resourceUrl: 'img/maiz.jpg'].
			html div class: 'cotizacion'; style: 'background-image:url(', (html absoluteUrlForResource: 'img/fondo_bonos.jpg') asString, ')'; with: [
				html div class: 'variacion'; style: 'color:', (self colorVariacionCereal: 'maiz'); with: [
					html image resourceUrl: (self urlImagenVariacionCereal: 'maiz').
					html big: (self model cotizacionCereal: 'maiz' tipo: 'variacion')].
				html div class: 'ultimo'; with: [
					html big: (self model cotizacionCereal: 'maiz' tipo: 'ultimo').
					html text: 'Compra'].
				html div class: 'cierreAnterior'; with: [
					html big: (self model cotizacionCereal: 'maiz' tipo: 'anterior').
					html text: 'Venta']
				]
			].
		]
]

{ #category : #rendering }
WAQuotedMarketDataComponent >> renderCotizacionDolarOn: html [

	html div id: 'dolar'; with: [
		html div id: 'dolarOficial'; with: [
			html div class: 'titulo'; with: [
					html strong: 'Oficial'.
					html image resourceUrl: 'img/formal.jpg'].
			html div class: 'cotizacion'; style: 'background-image:url(', (html absoluteUrlForResource: 'img/fondo_bonos.jpg') asString, ')'; with: [
				html div class: 'variacion'; style: 'color:', self colorVariacionDolarOficial; with: [
					html image resourceUrl: self urlImagenVariacionDolarOficial.
					html big: self model dolarVariacionOficial].
				html div class: 'ultimo'; with: [
					html big: self model dolarCompraOficial.
					html text: 'Compra'].
				html div class: 'cierreAnterior'; with: [
					html big: self model dolarVentaOficial.
					html text: 'Venta']
				]
			].
		html div id: 'dolarInformal'; with: [
			html div class: 'titulo'; with: [
					html strong: 'Informal'.
					html image resourceUrl: 'img/informal.jpg'].
			html div class: 'cotizacion'; style: 'background-image:url(', (html absoluteUrlForResource: 'img/fondo_bonos.jpg') asString, ')'; with: [
				html div class: 'variacion'; style: 'color:', self colorVariacionDolarInformal; with: [
					html image resourceUrl: self urlImagenVariacionDolarInformal.
					html big: self model dolarVariacionInformal].
				html div class: 'ultimo'; with: [
					html big: self model dolarCompraInformal.
					html text: 'Compra'].
				html div class: 'cierreAnterior'; with: [
					html big: self model dolarVentaInformal.
					html text: 'Venta']
				]
			
			].
		]
]

{ #category : #accessing }
WAQuotedMarketDataComponent >> urlImagenVariacionCereal: unCereal [

	(self model variacionCereal: unCereal) > 0 ifTrue:  [^'img/sube.jpg'].
	(self model variacionCereal: unCereal) < 0 ifTrue: [^'img/baja.png'].
	^'img/igual.jpg'
]

{ #category : #accessing }
WAQuotedMarketDataComponent >> urlImagenVariacionDolarInformal [

	self model dolarInformalSube ifTrue: [^'img/sube.jpg'].
	self model dolarInformalBaja ifTrue: [^'img/baja.png'].
	^'img/igual.jpg'
]

{ #category : #accessing }
WAQuotedMarketDataComponent >> urlImagenVariacionDolarOficial [

	self model dolarOficialSube ifTrue: [^'img/sube.jpg'].
	self model dolarOficialBaja ifTrue: [^'img/baja.png'].
	^'img/igual.jpg'
]
