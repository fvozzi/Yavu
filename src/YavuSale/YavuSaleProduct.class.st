Class {
	#name : #YavuSaleProduct,
	#superclass : #YavuEntity,
	#instVars : [
		'description',
		'recipe',
		'saleProductCategory',
		'validStartDate',
		'validEndDate',
		'imageName',
		'subtitle',
		'isSpecialOffer'
	],
	#category : #'YavuSale-Entities'
}

{ #category : #testing }
YavuSaleProduct class >> isVoyageRoot [ 

	^ true
]

{ #category : #'sin categoria' }
YavuSaleProduct class >> label [ 

	 ^ 'Producto de Venta'
]

{ #category : #'as yet unclassified' }
YavuSaleProduct class >> mongoValidEndDate [
<mongoDescription>

	^  VOToOneDescription new
			attributeName: 'validEndDate';
			accessor: (MAPluggableAccessor
				read: [ :entity | entity validEndDate ]
				write: [ :entity :value  | value notNil ifTrue: [entity validEndDate: value asDate]]);
			yourself

]

{ #category : #'as yet unclassified' }
YavuSaleProduct class >> mongoValidStartDate [
<mongoDescription>

	^  VOToOneDescription new
			attributeName: 'validStartDate';
			accessor: (MAPluggableAccessor
				read: [ :entity | entity validStartDate ]
				write: [ :entity :value  | value notNil ifTrue: [entity validStartDate: value asDate]]);
			yourself

]

{ #category : #accessing }
YavuSaleProduct class >> subsystemClass [
	^ Smalltalk at: #YavuSaleSubsystem
]

{ #category : #accessing }
YavuSaleProduct >> description [
	^ description
]

{ #category : #accessing }
YavuSaleProduct >> description: anObject [
	description := anObject
]

{ #category : #descriptions }
YavuSaleProduct >> descriptionDescription [ 

	<magritteDescription>
	^MAStringDescription new 
      accessor: #description ;
      label: 'Descripción';
      	priority: 110;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuSaleProduct >> descriptionImageName [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #imageName ;
      label: 'Imagen';
      	priority: 135;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuSaleProduct >> descriptionIsSpecialOffer [
	
	<magritteDescription>
	^MABooleanDescription new
		accessor: #isSpecialOffer;
		label: 'Está en promo?';
		priority: 150;
		componentClass: TBSMagritteCheckboxComponent;
		yourself
]

{ #category : #descriptions }
YavuSaleProduct >> descriptionRecipe [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #recipe;
		label: 'Receta';
		priority: 120;
		options: self subsystem allAvailableRecipes;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuSaleProduct >> descriptionSaleCategory [
	
	<magritteDescription>
	^MASingleOptionDescription new
		accessor: #saleProductCategory;
		label: 'Categoria';
		priority: 130;
		options: YavuSaleCategory all ;
		beSorted;
		beRequired;
		componentClass: TBSMagritteSelectListComponent;
		yourself
]

{ #category : #descriptions }
YavuSaleProduct >> descriptionSubtitle [

	<magritteDescription>
	^MAStringDescription new 
      accessor: #subtitle ;
      label: 'Subtitulo';
      	priority: 105;
		componentClass: TBSMagritteTextInputComponent;
      	yourself
]

{ #category : #descriptions }
YavuSaleProduct >> descriptionValidEndDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new 
		componentClass: TBSMagritteDateInputComponent;
        	accessor: #validEndDate;
        	label: 'Valido hasta';
        	priority: 150;
        	yourself
]

{ #category : #descriptions }
YavuSaleProduct >> descriptionValidStartDate [
	"Devuelve un objeto que describe la representación de la variable nombre del receptor."

	<magritteDescription>
	^MADateDescription new 
		componentClass: TBSMagritteDateInputComponent;
        	accessor: #validStartDate;
        	label: 'Valido desde';
        	priority: 140;
		   beRequired;
        	yourself
]

{ #category : #accessing }
YavuSaleProduct >> imageName [
	^ imageName
]

{ #category : #accessing }
YavuSaleProduct >> imageName: anObject [
	imageName := anObject
]

{ #category : #accessing }
YavuSaleProduct >> isSpecialOffer [
	isSpecialOffer ifNil: [ isSpecialOffer := false ].
	^ isSpecialOffer 
]

{ #category : #accessing }
YavuSaleProduct >> isSpecialOffer: anObject [
	isSpecialOffer := anObject
]

{ #category : #'as yet unclassified' }
YavuSaleProduct >> maDescriptionForReport [ 

	^super maDescriptionForReport,
			self descriptionIsSpecialOffer,
			self descriptionValidEndDate 
]

{ #category : #accessing }
YavuSaleProduct >> recipe [
	^ recipe
]

{ #category : #accessing }
YavuSaleProduct >> recipe: anObject [

	recipe := anObject
]

{ #category : #accessing }
YavuSaleProduct >> saleProductCategory [
	^ saleProductCategory
]

{ #category : #accessing }
YavuSaleProduct >> saleProductCategory: anObject [
	saleProductCategory := anObject
]

{ #category : #accessing }
YavuSaleProduct >> saleProductCategoryOrSpecialOfferCategory [
	
	self isSpecialOffer ifTrue: [ ^ self yavuSystem saleSubsystem specialOfferCategory ].
	^ saleProductCategory
]

{ #category : #accessing }
YavuSaleProduct >> subtitle [
	^ subtitle
]

{ #category : #accessing }
YavuSaleProduct >> subtitle: anObject [
	subtitle := anObject
]

{ #category : #'as yet unclassified' }
YavuSaleProduct >> validAt: aDate [ 
	
	self validEndDate ifNil: [^ aDate >= self validStartDate].
	^ aDate between: self validStartDate and: self validEndDate
]

{ #category : #accessing }
YavuSaleProduct >> validEndDate [
	^ validEndDate
]

{ #category : #accessing }
YavuSaleProduct >> validEndDate: anObject [
	validEndDate := anObject
]

{ #category : #accessing }
YavuSaleProduct >> validStartDate [
	^ validStartDate
]

{ #category : #accessing }
YavuSaleProduct >> validStartDate: anObject [
	validStartDate := anObject
]
