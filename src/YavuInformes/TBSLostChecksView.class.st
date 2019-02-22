Class {
	#name : #TBSLostChecksView,
	#superclass : #TBSCheckOperationView,
	#instVars : [
		'lostDate'
	],
	#category : #'YavuInformes-BootstrapView'
}

{ #category : #'as yet unclassified' }
TBSLostChecksView class >> claseDeAyuda [
	"Devuelve la clase que modela y define la ayuda del repcetor."
	
	^WAYavuComponent
]

{ #category : #accessing }
TBSLostChecksView >> lostDate [
	
	^ lostDate
]

{ #category : #accessing }
TBSLostChecksView >> lostDate: anObject [
	
	lostDate := anObject
]

{ #category : #'as yet unclassified' }
TBSLostChecksView >> newTransaction [
	"Devuelve una nueva situacion comercial según los datos ingresados por el usuario."
	
	^super newTransaction 
		lostDate: (self convertirFecha: self lostDate);
		yourself
]

{ #category : #rendering }
TBSLostChecksView >> renderSegundoPasoOn: html [
	"Renderiza el segundo paso del ingreso manual de la información."

	html heading level4 with: [html text: '2'].
	html div class: 'ui-widget-header';  class: 'ui-corner-all'; with: [html text: 'Ingrese todos los cheques rechazados que desee informar:'].
	html div id: 'fila1'; with: [
		html div class: 'columna'; with: [
			html div class: 'label'; with: [html text: 'N° Documento'].
			html textInput on: #documentNumber of: self.].
		html div class: 'columna'; with: [		
			html div class: 'label'; with: [html text: 'Tipo'].
			html select 
				list: CustomerType all;
				labels: [ :each | each label ];
				selected: self customerType;
				callback: [:descripcionSexo | self customerType: descripcionSexo]].
		html div class: 'columna'; with: [				
			html submitButton text: 'Buscar'; callback: [self searchCustomer]].
		html div class: 'columna'; with: [
			html div id: 'nombre'; with: [
				self renderNombreDeClienteOn: html]]].
	html div id: 'fila2'; with: [
		html div class: 'columna'; with: [	
			html div class: 'label'; with: [html text: 'Fecha Extravío'].
			html textInput
      			value: self lostDate;
      			callback: [ :value | self lostDate: value ];
      			script: (html jQuery new spanishDatepicker
         			onSelect: (html jQuery ajax serializeThis))].
		html div class: 'columna'; with: [	
			html div id: 'checkNumber'; with: [		
			html div class: 'label'; with: [html text: 'Nro. cheque'].
			html textInput on: #checkNumber of: self]].
		html div class: 'columna'; with: [			
			html div class: 'label'; with: [html text: 'Monto cheque'].
			html textInput on: #amountOfCheck of: self].
		html div class: 'columna'; with: [	
			html div class: 'label'; with: [html text: 'Banco'].
			html select 
				list: Bank all;
				selected: Bank default;
				callback: [:value | self bank: value]]].
	html div id: 'fila3'; with: [
		html div class: 'columna'; with: [
				html submitButton text: 'Agregar a la lista'; callback: [self agregar]]].
		self renderDescripcionErrorOn: html.
		html heading level3; with: [html text: 'Listado de cheques perdidos a procesar:'].
		html div id: #vistaPrevia; with: [self renderTransactionListOn: html].
]

{ #category : #accessing }
TBSLostChecksView >> transactionClass [

	^LostCheck
]

{ #category : #printing }
TBSLostChecksView >> transactionDescription [

	^'cheque perdido.'
]

{ #category : #'as yet unclassified' }
TBSLostChecksView >> verifyTransactionData [
	"Devuelve true si el monto no es nil."
	
	self amountOfCheck notEmpty ifTrue: [
		[self amountOfCheck asNumber ] on: Error do: [ :ex | 
		self descriptionError: 'El monto debe ser un número o estar vacio.'.
		^false ]].
	^super verifyTransactionData 
]
