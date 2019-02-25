"
Este clase mapea la información disponible en www.nutriinfo.com.ar y la persiste en un archivo xml para usarla dentro de NutriData.

"
Class {
	#name : #NutriInfoXMLUpdater,
	#superclass : #YavuObject,
	#instVars : [
		'znClient',
		'xmlDocument'
	],
	#category : #'YavuNutriData-Model'
}

{ #category : #nutriInfoWebAccess }
NutriInfoXMLUpdater >> baseUrl [

	^'http://www.nutrinfo.com/tabla_composicion_quimica_alimentos.php'
]

{ #category : #'source XML' }
NutriInfoXMLUpdater >> compositionMap [
	"Mapea la relación entre los tags html de la web de nutriinfo con el tag del XML.
	NOTA: este mapa es lo unico que hay que mantener si cambia la web de nutriinfo o si aparecen nuevos campos."
	
	 ^OrderPreservingDictionary new
		at: 'Porción: </strong>' put:  'Porcion';
		at: 'Valor Energético</strong>'put: 'E';
		at: 'Carbohidratos</strong>' put: 'HCdisp';
		at: 'Proteínas</strong>' put: 'Prot';
		at: 'Grasas Totales</strong>' put: 'Lip';
		at: 'grasas saturadas' put: 'AGSat' ;
		at: 'grasas monoinsaturadas' put: 'AGMI' ;
		at: 'grasas poliinsaturadas' put: 'AGPI' ;
		at: 'grasas trans' put: 'GrasasTrans';
		at: '     colesterol' put: 'Colesterol';
		at: 'Fibra</strong>' put: 'Fibra';
		at: 'Sodio</strong>' put: 'Na';
		at: 'Actualizado:</strong>' put: 'Actualizado';
		yourself
]

{ #category : #'source XML' }
NutriInfoXMLUpdater >> createXmlDocumentFrom: aHtmlResult [
	"Itera por el html que tiene todos los resultados de los productos y por cada uno pide la información completa por via REST."

	| stream xmlWriter |
	
	stream := ReadStream on: aHtmlResult.
	xmlWriter := XMLWriter new.
	xmlWriter enablePrettyPrinting ; xml.
	xmlWriter tag
		name: 'dataroot';
		with: [ 	[ stream atEnd ] whileFalse: [ | foodId htmlComposition |
					stream upToAll: 'FoodId='.
					foodId := stream upToAll: '&'.
					htmlComposition := self getFoodCompositionOfId: foodId on: xmlWriter.
					htmlComposition notNil ifTrue: [ 
					self parseHtmlFoodComposition: htmlComposition id: foodId on: xmlWriter]
		 ].
	].
	^xmlWriter contents
		
	

	
]

{ #category : #'source XML' }
NutriInfoXMLUpdater >> getFoodCompositionOfId: aString on: aXmlWriter [
	"Busca la informacion de composicion nutricional de cada producto y parsea el resultado en aWriteStream para armar el xml."

	| foodId url |
	
	foodId := aString trimBoth.
	url := self baseUrl , '?FoodId=' , foodId.
	^self getHtmlStringFormUrl: url
	
]

{ #category : #nutriInfoWebAccess }
NutriInfoXMLUpdater >> getHtmlStringFormUrl: url [
	^ [ 
	self znClient
		url: url;
		timeout: 15;
		get ]
		on: ConnectionTimedOut , NameLookupFailure , ZnHttpUnsuccessful , ZnUnexpectedContentType
		do: [ :ex | nil ]
]

{ #category : #nutriInfoWebAccess }
NutriInfoXMLUpdater >> getXmlDocument [
	| string url |
	url := self baseUrl , '?marca=Todas&numberOfResults=9999&measure=porcion&FoodCategory=Todas'.
	string := self getHtmlStringFormUrl: url.
	^ self createXmlDocumentFrom: string
]

{ #category : #'source XML' }
NutriInfoXMLUpdater >> parseHtmlFoodComposition: htmlString id: foodId on: aXmlWriter [
	| stream |
	aXmlWriter tag 
		name: 'AlimentoyComposicion';
		with: [ 	aXmlWriter tag name: 'Codigo'; with: foodId trimBoth.
			    	stream := ReadStream on: htmlString.
				stream upToAll: '<div id="columna-vademecum2" >'.
				stream upToAll: '<p style="font-size:0.80em; color:#5170C2;"><strong>'.
				aXmlWriter  tag name: 'Alimento'; with: (stream upToAll: '</strong>') trimBoth.
				self compositionMap keysAndValuesDo: [ :htmlKey :xmlTag | 
					| position |
					position := stream position.
					stream upToAll: htmlKey.
					stream atEnd
						ifTrue: [ stream position: position ]
						ifFalse: [ aXmlWriter tag
									name: xmlTag;
									with: (stream upToAll: '</p>') trimBoth
							].
				] ].
	^aXmlWriter
]

{ #category : #'source XML' }
NutriInfoXMLUpdater >> parseHtmlFoodCompositionForID: foodId on: htmlString [
	| stream xmlString |
	xmlString := '<AlimentoyComposicion><Codigo>' , foodId , '</Codigo>'.
	stream := ReadStream on: htmlString.
	stream upToAll: '<div id="columna-vademecum2" >'.
	stream upToAll: '<p style="font-size:0.80em; color:#5170C2;"><strong>'.
	xmlString := xmlString , '<Alimento>' , (stream upToAll: '</strong>') , '</Alimento>'.
	self compositionMap
		keysAndValuesDo: [ :htmlKey :xmlTag | 
			| position |
			position := stream position.
			stream upToAll: htmlKey.
			stream atEnd
				ifTrue: [ stream position: position ]
				ifFalse: [ xmlString := xmlString , xmlTag , (stream upToAll: '</p>') trimBoth , xmlTag ] ].
	^ xmlString , '</AlimentoyComposicion>'
]

{ #category : #storing }
NutriInfoXMLUpdater >> updateXMLFileFromWeb [
	"Actualiza el archivo XML desde la web. Este procedimiento puede hacerse cada cierto periodo de tiempo para mantener actualizado la data."

	| newFile |
	xmlDocument := self getXmlDocument.
	[newFile := MultiByteFileStream forceNewFileNamed: ('/home/user/dev/websic/data/nutridata/', 'nutriInfo.xml') asFileReference.
	newFile converter: UTF8TextConverter new.
	newFile nextPutAll: xmlDocument contents] ensure: [ newFile close ] 
]

{ #category : #nutriInfoWebAccess }
NutriInfoXMLUpdater >> znClient [
	
	^znClient ifNil: [ znClient := ZnClient new
								accept: ZnMimeType textHtml setCharSetUTF8;
								yourself ]
]
