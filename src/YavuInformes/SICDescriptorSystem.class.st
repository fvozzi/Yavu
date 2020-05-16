Class {
	#name : #SICDescriptorSystem,
	#superclass : #DescriptorSystem,
	#category : #'YavuInformes-Persistence'
}

{ #category : #tables }
SICDescriptorSystem >> allTableNames [
	"Return a list of all the table names that this system uses."

	^#( 'OperationCharacter' 'OperationType' 'PackageOfReports' 'MenuElement' 'Role' 'SicUser' 'Company' 'Commerce' 'SecurityFunction' 'MonthlyPayment' 'ReportEmission' 'Person' 'FinancialSituations' 'synchronizationdatabase' 'bank' 'bouncedCheck' 'padronBCRA' 'InscripcionAFIP' 'padron2009')
]

{ #category : #models }
SICDescriptorSystem >> classModelForBCRACheckData: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #owner type: BCRAData.
	aClassModel newAttributeNamed: #checkNumber.
	aClassModel newAttributeNamed: #bouncedDate type: Date.
	aClassModel newAttributeNamed: #amountOfCheck.
	aClassModel newAttributeNamed: #cause.
	aClassModel newAttributeNamed: #paymentDate type: Date.
	aClassModel newAttributeNamed: #finePaymentDate type: Date.
	aClassModel newAttributeNamed: #revision.
	aClassModel newAttributeNamed: #judicial.
	aClassModel newAttributeNamed: #denomination.
	aClassModel newAttributeNamed: #type	
	
]

{ #category : #models }
SICDescriptorSystem >> classModelForBCRAData: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #entity type: YavuPerson.
	aClassModel newAttributeNamed: #date type: Date.
  	aClassModel newAttributeNamed: #ts type: TimeStamp.
	aClassModel newAttributeNamed: #bcraDebts collectionOf: BCRADebt.
	aClassModel newAttributeNamed: #bcraPersonalChecks collectionOf: BCRACheckData.
	aClassModel newAttributeNamed: #bcraSocietyChecks collectionOf: BCRACheckData

	
]

{ #category : #models }
SICDescriptorSystem >> classModelForBCRADebt: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #owner type: BCRAData.
	aClassModel newAttributeNamed: #denomination.
	aClassModel newAttributeNamed: #entity.
	aClassModel newAttributeNamed: #period.
	aClassModel newAttributeNamed: #situation.
	aClassModel newAttributeNamed: #amount.	
	aClassModel newAttributeNamed: #days.
	aClassModel newAttributeNamed: #observation
	
]

{ #category : #models }
SICDescriptorSystem >> classModelForBank: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #models }
SICDescriptorSystem >> classModelForBouncedCheck: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #entity type: Commerce.
	aClassModel newAttributeNamed: #date type: Date.
	aClassModel newAttributeNamed: #customer type: YavuPerson.
	aClassModel newAttributeNamed: #checkNumber.
	aClassModel newAttributeNamed: #bouncedDate type: Date.
	aClassModel newAttributeNamed: #amountOfCheck.
	aClassModel newAttributeNamed: #bank type: Bank.
	aClassModel newAttributeNamed: #cause.	
	aClassModel newAttributeNamed: #finePaymentDate type: Date.
	aClassModel newAttributeNamed: #paymentDate type: Date.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
	
	

	
]

{ #category : #models }
SICDescriptorSystem >> classModelForCommerce: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	aClassModel newAttributeNamed: #cuit.
	aClassModel newAttributeNamed: #address.
	aClassModel newAttributeNamed: #company type: Company.
	aClassModel newAttributeNamed: #inputStrategy.
	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #models }
SICDescriptorSystem >> classModelForCompany: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	aClassModel newAttributeNamed: #packagesOfReports collectionOf: PackageOfReports.
	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #models }
SICDescriptorSystem >> classModelForCompositeMenuElement: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	(aClassModel newAttributeNamed: #presenterClassLiteral) useDirectAccess: false.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #models }
SICDescriptorSystem >> classModelForDatosPadronBCRA: aClassModel [

	aClassModel newAttributeNamed: #cuit.
	aClassModel newAttributeNamed: #denom
]

{ #category : #models }
SICDescriptorSystem >> classModelForDatosPadronElectoral: aClassModel [

	aClassModel newAttributeNamed: #nombre.
	aClassModel newAttributeNamed: #numdoc.
	aClassModel newAttributeNamed: #sexo
]

{ #category : #models }
SICDescriptorSystem >> classModelForElectoralRoll: aClassModel [
        
	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	aClassModel newAttributeNamed: #cuit.
	aClassModel newAttributeNamed: #dni.
	aClassModel newAttributeNamed: #sex.
	aClassModel newAttributeNamed: #birthday.
	aClassModel newAttributeNamed: #age.
	aClassModel newAttributeNamed: #address.
	aClassModel newAttributeNamed: #city.
	aClassModel newAttributeNamed: #state.
	aClassModel newAttributeNamed: #zipCode.
	aClassModel newAttributeNamed: #occupation.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #models }
SICDescriptorSystem >> classModelForFinancialSituation: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #entity type: Commerce.
	aClassModel newAttributeNamed: #date type: Date.
	aClassModel newAttributeNamed: #customer type: YavuPerson.
	aClassModel newAttributeNamed: #amountOfDebt.
	aClassModel newAttributeNamed: #dateOfLastPayment type: Date.
	aClassModel newAttributeNamed: #operationType type: OperationType.
	aClassModel newAttributeNamed: #operationCharacter type: OperationCharacter.
	aClassModel newAttributeNamed: #type.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
	
	

	
]

{ #category : #models }
SICDescriptorSystem >> classModelForFinancialSituationsByCommerce: aClassModel [

	aClassModel newAttributeNamed: #entity type: Commerce.
	aClassModel newAttributeNamed: #date type: Date.
	aClassModel newAttributeNamed: #amountOfFinancialSituations
]

{ #category : #models }
SICDescriptorSystem >> classModelForFinancialSituationsReport: aClassModel [

	aClassModel newAttributeNamed: #entity type: Commerce.
	aClassModel newAttributeNamed: #amountOfFinancialSituations.
	aClassModel newAttributeNamed: #totalDebt.
	aClassModel newAttributeNamed: #higherDebt.
	aClassModel newAttributeNamed: #lowerDebt.
	aClassModel newAttributeNamed: #lastUpdate type: Date.
	aClassModel newAttributeNamed: #oldUpdate type: Date.
	aClassModel newAttributeNamed: #minDebtDate type: Date.
	aClassModel newAttributeNamed: #maxDebtDate type: Date.
]

{ #category : #models }
SICDescriptorSystem >> classModelForInscripcionAFIP: aClassModel [

	aClassModel newAttributeNamed: #denominacion.
	aClassModel newAttributeNamed: #cuit.
	aClassModel newAttributeNamed: #referencia

]

{ #category : #models }
SICDescriptorSystem >> classModelForLostCheck: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #entity type: Commerce.
	aClassModel newAttributeNamed: #date type: Date.
	aClassModel newAttributeNamed: #customer type: YavuPerson.
	aClassModel newAttributeNamed: #checkNumber.
	aClassModel newAttributeNamed: #lostDate type: Date.
	aClassModel newAttributeNamed: #amountOfCheck.
	aClassModel newAttributeNamed: #bank type: Bank.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
	
	

	
]

{ #category : #models }
SICDescriptorSystem >> classModelForMenuElement: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	(aClassModel newAttributeNamed: #presenterClassLiteral) useDirectAccess: false.
	aClassModel newAttributeNamed: #ts type: TimeStamp
  
]

{ #category : #models }
SICDescriptorSystem >> classModelForMonthlyPayment: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #entity type: Commerce.
	aClassModel newAttributeNamed: #date.
	aClassModel newAttributeNamed: #packageOfReports type: PackageOfReports.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #models }
SICDescriptorSystem >> classModelForNaturalPerson: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	aClassModel newAttributeNamed: #cuit.
	aClassModel newAttributeNamed: #dni.
	aClassModel newAttributeNamed: #customerType.
	aClassModel newAttributeNamed: #address.
	aClassModel newAttributeNamed: #birthday.
	aClassModel newAttributeNamed: #occupation.
	aClassModel newAttributeNamed: #job.
	aClassModel newAttributeNamed: #spouse.
	aClassModel newAttributeNamed: #spouseDocumentNumber.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #models }
SICDescriptorSystem >> classModelForQuotedMarketData: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #date type: Date.
	(aClassModel newAttributeNamed: #dolarCompraOficial) useDirectAccess: false.
	(aClassModel newAttributeNamed: #dolarCompraInformal) useDirectAccess: false.
	(aClassModel newAttributeNamed: #dolarVentaOficial) useDirectAccess: false.
	(aClassModel newAttributeNamed: #dolarVentaInformal) useDirectAccess: false.
	(aClassModel newAttributeNamed: #dolarVariacionOficial) useDirectAccess: false.
	(aClassModel newAttributeNamed: #dolarVariacionInformal) useDirectAccess: false.
	(aClassModel newAttributeNamed: #ultimoSoja) useDirectAccess: false.
	(aClassModel newAttributeNamed: #ultimoTrigo) useDirectAccess: false.	
	(aClassModel newAttributeNamed: #ultimoMaiz) useDirectAccess: false.
	(aClassModel newAttributeNamed: #anteriorSoja) useDirectAccess: false.																								
	(aClassModel newAttributeNamed: #anteriorTrigo) useDirectAccess: false.	
	(aClassModel newAttributeNamed: #anteriorMaiz) useDirectAccess: false.
	(aClassModel newAttributeNamed: #variacionSoja) useDirectAccess: false.																														
	(aClassModel newAttributeNamed: #variacionTrigo) useDirectAccess: false.
	(aClassModel newAttributeNamed: #variacionMaiz) useDirectAccess: false
]

{ #category : #models }
SICDescriptorSystem >> classModelForReportEmission: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #entity type: Commerce.
	aClassModel newAttributeNamed: #date type: TimeStamp.
	aClassModel newAttributeNamed: #user type: YavuUser.
	aClassModel newAttributeNamed: #customer type: YavuPerson.
	aClassModel newAttributeNamed: #reportKind.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #models }
SICDescriptorSystem >> classModelForSecurityFunction: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	(aClassModel newAttributeNamed: #yavuObjectClassLiteral) useDirectAccess: false.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #models }
SICDescriptorSystem >> classModelForSicUser: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	aClassModel newAttributeNamed: #email.
	aClassModel newAttributeNamed: #password.
	aClassModel newAttributeNamed: #fullName.
	aClassModel newAttributeNamed: #phoneNumber.
	aClassModel newAttributeNamed: #company type: Company.
	aClassModel newAttributeNamed: #roles collectionOf: OrderedCollection.
	aClassModel newAttributeNamed: #commerces collectionOf: OrderedCollection.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
	

  
]

{ #category : #models }
SICDescriptorSystem >> classModelForSimpleMenuElement: aClassModel [

	aClassModel newAttributeNamed: #id.
	aClassModel newAttributeNamed: #name.
	(aClassModel newAttributeNamed: #presenterClassLiteral) useDirectAccess: false.
	aClassModel newAttributeNamed: #parent type: YavuCompositeMenuElement.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
  
]

{ #category : #models }
SICDescriptorSystem >> classModelForSynchronizationDatabase: aClassModel [

	aClassModel newAttributeNamed: #id.
	(aClassModel newAttributeNamed: #entityClassLiteral) useDirectAccess: false.
	aClassModel newAttributeNamed: #date type: TimeStamp.
	aClassModel newAttributeNamed: #synchronizationDate type: TimeStamp.
  	aClassModel newAttributeNamed: #ts type: TimeStamp
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForBCRACheckData: aDescriptor [

	| table |
	table := self tableNamed: 'BCRACheckData'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'ID').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #owner.	
	(aDescriptor newMapping: DirectMapping) from: #checkNumber to: (table fieldNamed: 'CHECKNUMBER').
	(aDescriptor newMapping: DirectMapping) from: #bouncedDate to: (table fieldNamed: 'BOUNCEDDATE').	
	(aDescriptor newMapping: DirectMapping) from: #amountOfCheck to: (table fieldNamed: 'AMOUNTOFCHECK').
	(aDescriptor newMapping: DirectMapping) from: #cause to: (table fieldNamed: 'CAUSE').	
	(aDescriptor newMapping: DirectMapping) from: #paymentDate to: (table fieldNamed: 'PAYMENTDATE').											
	(aDescriptor newMapping: DirectMapping) from: #finePaymentDate to: (table fieldNamed: 'FINEPAYMENTDATE').																							
	(aDescriptor newMapping: DirectMapping) from: #revision to: (table fieldNamed: 'REVISION').
	(aDescriptor newMapping: DirectMapping) from: #judicial to: (table fieldNamed: 'JUDICIAL').
	(aDescriptor newMapping: DirectMapping) from: #denomination to: (table fieldNamed: 'DENOMINATION').
	(aDescriptor newMapping: DirectMapping) from: #type to: (table fieldNamed: 'TYPE')																									
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForBCRAData: aDescriptor [

	| ownerTable checkDataTable debtDataTable  |
	ownerTable := self tableNamed: 'BCRAData'.
	checkDataTable := self tableNamed: 'BCRACheckData'.
	debtDataTable := self tableNamed: 'BCRADebt'.
	aDescriptor table: ownerTable.
	(aDescriptor newMapping: DirectMapping) from: #id to: (ownerTable fieldNamed: 'ID').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #entity.	
	(aDescriptor newMapping: DirectMapping) from: #date to: (ownerTable fieldNamed: 'DATE').
	(aDescriptor newMapping: DirectMapping) from: #ts to: (ownerTable fieldNamed: 'ts').
	aDescriptor
		addMapping:
			((OneToManyMapping new)
				attributeName: #bcraDebts;
				referenceClass: BCRADebt;
				collectionType: OrderedCollection;
				join: (Join 
						from: (ownerTable fieldNamed: 'ID') 
						to: (debtDataTable fieldNamed: 'BCRADATAID')
						)).
	aDescriptor
		addMapping:
			((OneToManyMapping new)
				attributeName: #bcraPersonalChecks;
				referenceClass: BCRACheckData;
				collectionType: OrderedCollection;
				join: (Join 
						from: (ownerTable fieldNamed: 'ID') 
						to: (checkDataTable fieldNamed: 'BCRADATAID')
						from: 'P'
						to: (checkDataTable fieldNamed: 'TYPE')
						)).
	aDescriptor
		addMapping:
			((OneToManyMapping new)
				attributeName: #bcraSocietyChecks;
				referenceClass: BCRACheckData;
				collectionType: OrderedCollection;
				join: (Join 
						from: (ownerTable fieldNamed: 'ID') 
						to: (checkDataTable fieldNamed: 'BCRADATAID')
						from: 'S'
						to: (checkDataTable fieldNamed: 'TYPE')
						)).						

	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForBCRADebt: aDescriptor [

	| table |
	table := self tableNamed: 'BCRADebt'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'ID').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #owner.	
	(aDescriptor newMapping: DirectMapping) from: #denomination to: (table fieldNamed: 'DENOMINATION').
	(aDescriptor newMapping: DirectMapping) from: #entity to: (table fieldNamed: 'ENTITY').	
	(aDescriptor newMapping: DirectMapping) from: #period to: (table fieldNamed: 'PERIOD').
	(aDescriptor newMapping: DirectMapping) from: #situation to: (table fieldNamed: 'SITUATION').	
	(aDescriptor newMapping: DirectMapping) from: #amount to: (table fieldNamed: 'AMOUNT').											
	(aDescriptor newMapping: DirectMapping) from: #days to: (table fieldNamed: 'DAYS').																							
	(aDescriptor newMapping: DirectMapping) from: #observation to: (table fieldNamed: 'OBSERVATION')																						
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForBank: aDescriptor [

	| table |
	table := self tableNamed: 'Bank'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'ID').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'NAME').
	(aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts')
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForBouncedCheck: aDescriptor [

	| table |
	table := self tableNamed: 'bouncedcheck'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #entity.
	(aDescriptor newMapping: DirectMapping) from: #date to: (table fieldNamed: 'date').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #customer.
	(aDescriptor newMapping: DirectMapping) from: #checkNumber to: (table fieldNamed: 'checkNumber').			
	(aDescriptor newMapping: DirectMapping) from: #bouncedDate to: (table fieldNamed: 'bouncedDate').	
	(aDescriptor newMapping: DirectMapping) from: #amountOfCheck to: (table fieldNamed: 'amountOfCheck').		
	(aDescriptor newMapping: OneToOneMapping) attributeName: #bank.
	(aDescriptor newMapping: DirectMapping) from: #cause to: (table fieldNamed: 'cause').
	(aDescriptor newMapping: DirectMapping) from: #finePaymentDate to: (table fieldNamed: 'finePaymentDate').	
	(aDescriptor newMapping: DirectMapping) from: #paymentDate to: (table fieldNamed: 'paymentDate').				
	(aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts')
			  
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForCommerce: aDescriptor [

	| table converter |
	table := self tableNamed: 'Commerce'.
	converter := PluggableDatabaseConverter new.
	converter stToDbConverter: [ :value | value asSQLLiteral ].
	converter dbToStConverter: [ :literal | Smalltalk at: literal asSymbol ].
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'ID').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'NAME').
	(aDescriptor newMapping: DirectMapping) from: #cuit to: (table fieldNamed: 'CUIT').	
	(aDescriptor newMapping: DirectMapping) from: #address to: (table fieldNamed: 'ADDRESS').	
	(aDescriptor newMapping: OneToOneMapping) attributeName: #company.
	(aDescriptor newMapping: DirectMapping)  from: #inputStrategy to: (table fieldNamed: 'inputStrategy'); converter: converter.
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForCompany: aDescriptor [

	| table |
	table := self tableNamed: 'COMPANY'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').											
	(aDescriptor newMapping: ManyToManyMapping)
		attributeName: #packagesOfReports;
		referenceClass: PackageOfReports.
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts')) readOnly: true
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForCompositeMenuElement: aDescriptor [

	| table |
	table := self tableNamed: #YavuMenuElement.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #presenterClassLiteral to: (table fieldNamed: 'presenterClass').
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true.
	(self typeResolverFor: YavuMenuElement) register: aDescriptor keyedBy: 'CompositeMenuElement' field: (table fieldNamed: 'menuElementClass').
	^aDescriptor
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForDatosPadronBCRA: aDescriptor [

	| table |
	table := self tableNamed: 'PadronBCRA'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #cuit to: (table fieldNamed: 'CUIT').	
	(aDescriptor newMapping: DirectMapping) from: #denom to: (table fieldNamed: 'DENOM')
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForDatosPadronElectoral: aDescriptor [

	| table |
	table := self tableNamed: 'PADRON2009'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #nombre to: (table fieldNamed: 'NOMBRE').	
	(aDescriptor newMapping: DirectMapping) from: #numdoc to: (table fieldNamed: 'NUMDOC').
	(aDescriptor newMapping: DirectMapping) from: #sexo to: (table fieldNamed: 'SEXO')
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForElectoralRoll: aDescriptor [
        
	| table |
	table := self tableNamed: 'ElectoralRoll'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #cuit to: (table fieldNamed: 'cuit').
	(aDescriptor newMapping: DirectMapping) from: #dni to: (table fieldNamed: 'dni').
	(aDescriptor newMapping: DirectMapping) from: #sex to: (table fieldNamed: 'sex').
	(aDescriptor newMapping: DirectMapping) from: #birthday to: (table fieldNamed: 'birthday').	
	(aDescriptor newMapping: DirectMapping) from: #age to: (table fieldNamed: 'age').			
	(aDescriptor newMapping: DirectMapping) from: #address to: (table fieldNamed: 'address').		
	(aDescriptor newMapping: DirectMapping) from: #city to: (table fieldNamed: 'city').							
	(aDescriptor newMapping: DirectMapping) from: #state to: (table fieldNamed: 'state').															
	(aDescriptor newMapping: DirectMapping) from: #zipCode to: (table fieldNamed: 'zipCode').																	
	(aDescriptor newMapping: DirectMapping) from: #occupation to: (table fieldNamed: 'occupation').																			
	^aDescriptor
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForFinancialSituation: aDescriptor [

	| table converter |
	table := self tableNamed: 'FinancialSituations'.
	converter := PluggableDatabaseConverter new.
	converter stToDbConverter: [ :value | value asSQLLiteral ].
	converter dbToStConverter: [ :literal | literal ifNotNil: [:one | Smalltalk at: one asSymbol]].
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #entity.
	(aDescriptor newMapping: DirectMapping) from: #date to: (table fieldNamed: 'date').	
	(aDescriptor newMapping: DirectMapping) from: #amountOfDebt to: (table fieldNamed: 'amountOfDebt').			
	(aDescriptor newMapping: OneToOneMapping) attributeName: #customer.
	(aDescriptor newMapping: DirectMapping) from: #dateOfLastPayment to: (table fieldNamed: 'dateOfLastPayment').		
	(aDescriptor newMapping: OneToOneMapping) attributeName: #operationType.
	(aDescriptor newMapping: OneToOneMapping) attributeName: #operationCharacter.
	(aDescriptor newMapping: DirectMapping)  from: #type to: (table fieldNamed: 'type'); converter: converter.
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true
			  
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForFinancialSituationsByCommerce: aDescriptor [

	| table |
	table := self tableNamed: 'FinancialSituationsByCommerce'.
	aDescriptor table: table.
	(aDescriptor newMapping: OneToOneMapping) attributeName: #entity.
	(aDescriptor newMapping: DirectMapping) from: #date to: (table fieldNamed: 'date').	
	(aDescriptor newMapping: DirectMapping) from: #amountOfFinancialSituations to: (table fieldNamed: 'amountOfFinancialSituations').
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForFinancialSituationsReport: aDescriptor [

	| table |
	table := self tableNamed: 'FinancialSituations_Report'.
	aDescriptor table: table.
	(aDescriptor newMapping: OneToOneMapping) attributeName: #entity.
	(aDescriptor newMapping: DirectMapping) from: #amountOfFinancialSituations to: (table fieldNamed: 'amountOfFinancialSituations').	
	(aDescriptor newMapping: DirectMapping) from: #totalDebt to: (table fieldNamed: 'totalDebt').	
	(aDescriptor newMapping: DirectMapping) from: #higherDebt to: (table fieldNamed: 'higherDebt').	
	(aDescriptor newMapping: DirectMapping) from: #lowerDebt to: (table fieldNamed: 'lowerDebt').	
	(aDescriptor newMapping: DirectMapping) from: #lastUpdate to: (table fieldNamed: 'lastUpdate').	
	(aDescriptor newMapping: DirectMapping) from: #oldUpdate to: (table fieldNamed: 'oldUpdate').	
	(aDescriptor newMapping: DirectMapping) from: #maxDebtDate to: (table fieldNamed: 'maxDebtDate').	
	(aDescriptor newMapping: DirectMapping) from: #minDebtDate to: (table fieldNamed: 'minDebtDate')
			  
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForInscripcionAFIP: aDescriptor [

	| table |
	table := self tableNamed: 'InscripcionAFIP'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #denominacion to: (table fieldNamed: 'DENOMINACION').	
	(aDescriptor newMapping: DirectMapping) from: #cuit to: (table fieldNamed: 'CUIT').
	(aDescriptor newMapping: DirectMapping) from: #referencia to: (table fieldNamed: 'REFERENCIA')
]

{ #category : #types }
SICDescriptorSystem >> descriptorForLegalPerson: aDescriptor [

	| table |
	table := self tableNamed: #YavuPerson.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #cuit to: (table fieldNamed: 'cuit').
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true.		
	(self typeResolverFor: YavuPerson) register: aDescriptor keyedBy: 'LegalPerson' field: (table fieldNamed: 'personClass').	
	^aDescriptor
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForLostCheck: aDescriptor [

	| table |
	table := self tableNamed: 'lostCheck'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #entity.
	(aDescriptor newMapping: DirectMapping) from: #date to: (table fieldNamed: 'date').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #customer.
	(aDescriptor newMapping: DirectMapping) from: #checkNumber to: (table fieldNamed: 'checkNumber').			
	(aDescriptor newMapping: DirectMapping) from: #lostDate to: (table fieldNamed: 'lostDate').	
	(aDescriptor newMapping: DirectMapping) from: #amountOfCheck to: (table fieldNamed: 'amountOfCheck').		
	(aDescriptor newMapping: OneToOneMapping) attributeName: #bank.			
	(aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts')
			  
			  
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForMenuElement: aDescriptor [

	| table |
	table := self tableNamed: #YavuMenuElement.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #presenterClassLiteral to: (table fieldNamed: 'presenterClass').	
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true.
	(self typeResolverFor: YavuMenuElement) register: aDescriptor abstract: true.
	^aDescriptor
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForMonthlyPayment: aDescriptor [

	| table |
	table := self tableNamed: 'MonthlyPayment'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #entity.
	(aDescriptor newMapping: DirectMapping) from: #date to: (table fieldNamed: 'date').	
	(aDescriptor newMapping: OneToOneMapping) attributeName: #packageOfReports.
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForNaturalPerson: aDescriptor [

	| table |
	table := self tableNamed: #YavuPerson.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #cuit to: (table fieldNamed: 'cuit').
	(aDescriptor newMapping: DirectMapping) from: #dni to: (table fieldNamed: 'dni').
	(aDescriptor newMapping: DirectMapping) from: #customerType to: (table fieldNamed: 'customerType').
	(aDescriptor newMapping: DirectMapping) from: #address to: (table fieldNamed: 'address').
	(aDescriptor newMapping: DirectMapping) from: #birthday to: (table fieldNamed: 'birthday').
	(aDescriptor newMapping: DirectMapping) from: #occupation to: (table fieldNamed: 'occupation').
	(aDescriptor newMapping: DirectMapping) from: #job to: (table fieldNamed: 'job').
	(aDescriptor newMapping: DirectMapping) from: #spouse to: (table fieldNamed: 'spouse').
	(aDescriptor newMapping: DirectMapping) from: #spouseDocumentNumber to: (table fieldNamed: 'spouseDocumentNumber').				
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true.
	(self typeResolverFor: YavuPerson) register: aDescriptor keyedBy: 'NaturalPerson' field: (table fieldNamed: 'personClass').	
	^aDescriptor
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForOperationCharacter: aDescriptor [

	| table |
	table := self tableNamed: 'OperationCharacter'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #code to: (table fieldNamed: 'code').
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForOperationType: aDescriptor [

	| table |
	table := self tableNamed: 'OperationType'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #code to: (table fieldNamed: 'code').
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForPackageOfReports: aDescriptor [

	| table |
	table := self tableNamed: 'PACKAGEOFREPORTS'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'ID').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'NAME').
	(aDescriptor newMapping: DirectMapping) from: #numberOfReports to: (table fieldNamed: 'NUMBEROFREPORTS').
	(aDescriptor newMapping: DirectMapping) from: #packagePrice to: (table fieldNamed: 'PACKAGEPRICE').
	(aDescriptor newMapping: DirectMapping) from: #surplusReportPrice to: (table fieldNamed: 'SURPLUSREPORTPRICE').
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForPerson: aDescriptor [

	| table |
	table := self tableNamed: #YavuPerson.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #cuit to: (table fieldNamed: 'cuit').	
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true.
	(self typeResolverFor: YavuPerson) register: aDescriptor abstract: true.
	^aDescriptor
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForQuotedMarketData: aDescriptor [

	| table |
	table := self tableNamed: 'quotedmarketdata'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').		
	(aDescriptor newMapping: DirectMapping) from: #date to: (table fieldNamed: 'date').	
	(aDescriptor newMapping: DirectMapping) from: #dolarCompraOficial to: (table fieldNamed: 'dolarCompraOficial').
	(aDescriptor newMapping: DirectMapping) from: #dolarCompraInformal to: (table fieldNamed: 'dolarCompraInformal').
	(aDescriptor newMapping: DirectMapping) from: #dolarVentaOficial to: (table fieldNamed: 'dolarVentaOficial').
	(aDescriptor newMapping: DirectMapping) from: #dolarVentaInformal to: (table fieldNamed: 'dolarVentaInformal').
	(aDescriptor newMapping: DirectMapping) from: #dolarVariacionOficial to: (table fieldNamed: 'dolarVariacionOficial').
	(aDescriptor newMapping: DirectMapping) from: #dolarVariacionInformal to: (table fieldNamed: 'dolarVariacionInformal').
	(aDescriptor newMapping: DirectMapping) from: #ultimoSoja to: (table fieldNamed: 'ultimoSoja').
	(aDescriptor newMapping: DirectMapping) from: #ultimoTrigo to: (table fieldNamed: 'ultimoTrigo').
	(aDescriptor newMapping: DirectMapping) from: #ultimoMaiz to: (table fieldNamed: 'ultimoMaiz').
	(aDescriptor newMapping: DirectMapping) from: #anteriorSoja to: (table fieldNamed: 'anteriorSoja').
	(aDescriptor newMapping: DirectMapping) from: #anteriorTrigo to: (table fieldNamed: 'anteriorTrigo').
	(aDescriptor newMapping: DirectMapping) from: #anteriorMaiz to: (table fieldNamed: 'anteriorMaiz').
	(aDescriptor newMapping: DirectMapping) from: #variacionSoja to: (table fieldNamed: 'variacionSoja').
	(aDescriptor newMapping: DirectMapping) from: #variacionTrigo to: (table fieldNamed: 'variacionTrigo').
	(aDescriptor newMapping: DirectMapping) from: #variacionMaiz to: (table fieldNamed: 'variacionMaiz')
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForReportEmission: aDescriptor [

	| table |
	table := self tableNamed: 'ReportEmission'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #entity.
	(aDescriptor newMapping: DirectMapping) from: #date to: (table fieldNamed: 'date').	
	(aDescriptor newMapping: OneToOneMapping) attributeName: #customer.
	(aDescriptor newMapping: OneToOneMapping) attributeName: #user.
	(aDescriptor newMapping: DirectMapping) from: #reportKind to: (table fieldNamed: 'reportKind').
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForRole: aDescriptor [

	| table |
	table := self tableNamed: 'Role'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true.
	(aDescriptor newMapping: ManyToManyMapping)
		attributeName: #menuElements;
		referenceClass: YavuMenuElement.
	(aDescriptor newMapping: ManyToManyMapping)
		attributeName: #yavuObjects;
		referenceClass: YavuSecurityFunction
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForSecurityFunction: aDescriptor [

	| table |
	table := self tableNamed: 'SECURITYFUNCTION'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'ID').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'NAME').
	(aDescriptor newMapping: DirectMapping) from: #yavuObjectClassLiteral to: (table fieldNamed: 'YAVUOBJECTCLASS').
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForSicUser: aDescriptor [

	| table linkTable|
	table := self tableNamed: 'sicuser'.
	linkTable := self tableNamed: 'commerces_by_users'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #email to: (table fieldNamed: 'email').
	(aDescriptor newMapping: DirectMapping) from: #password to: (table fieldNamed: 'password').
	(aDescriptor newMapping: DirectMapping) from: #fullName to: (table fieldNamed: 'fullName').			
	(aDescriptor newMapping: DirectMapping) from: #phoneNumber to: (table fieldNamed: 'phonenumber').	
	(aDescriptor newMapping: OneToOneMapping) attributeName: #company.	
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true.										
	(aDescriptor newMapping: ManyToManyMapping)
		attributeName: #roles;
		referenceClass: YavuRole.
	(aDescriptor newMapping: ManyToManyMapping)
		attributeName: #commerces;
		referenceClass: Commerce;
		join: (Join 
				from: (table fieldNamed: 'ID')
				to: (linkTable fieldNamed: 'USERID'))
						
	
]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForSimpleMenuElement: aDescriptor [

	| table |
	table := self tableNamed: #YavuMenuElement.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #name to: (table fieldNamed: 'name').
	(aDescriptor newMapping: DirectMapping) from: #presenterClassLiteral to: (table fieldNamed: 'presenterClass').
	(aDescriptor newMapping: OneToOneMapping) attributeName: #parent.
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true.
	(self typeResolverFor: YavuMenuElement) register: aDescriptor keyedBy: 'SimpleMenuElement' field: (table fieldNamed: 'menuElementClass').
	^aDescriptor
	

]

{ #category : #descriptions }
SICDescriptorSystem >> descriptorForSynchronizationDatabase: aDescriptor [

	| table |
	table := self tableNamed: 'SynchronizationDatabase'.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #entityClassLiteral to: (table fieldNamed: 'entity').
	(aDescriptor newMapping: DirectMapping) from: #date to: (table fieldNamed: 'date').	
	(aDescriptor newMapping: DirectMapping) from: #synchronizationDate to: (table fieldNamed: 'synchronizationDate').
	((aDescriptor newMapping: DirectMapping) from: #ts to: (table fieldNamed: 'ts'))	readOnly: true
	
]

{ #category : #tables }
SICDescriptorSystem >> tableForBANK: aTable [

	aTable name: 'BANK'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'NAME' type: (platform varChar: 100).
	aTable createFieldNamed: 'ts' type: (platform timestamp)


]

{ #category : #tables }
SICDescriptorSystem >> tableForBCRACHECKDATA: aTable [

	| bcraDataID |
	aTable name: 'BCRACHECKDATA'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	bcraDataID := (aTable createFieldNamed: 'bcraDataID' type: platform int4).
	aTable addForeignKeyFrom: bcraDataID to: ((self tableNamed: 'bcradata') fieldNamed: 'id').
	aTable createFieldNamed: 'checkNumber' type: (platform varChar: 50).
	aTable createFieldNamed: 'bouncedDate' type: (platform datetime).	
	aTable createFieldNamed: 'amountOfCheck' type: (platform varChar: 50).	
	aTable createFieldNamed: 'cause' type: (platform varChar: 200).					
	aTable createFieldNamed: 'paymentDate' type: (platform datetime).
	aTable createFieldNamed: 'finePaymentDate' type: (platform datetime).	
	aTable createFieldNamed: 'revision' type: (platform varChar: 100).	
	aTable createFieldNamed: 'judicial' type: (platform varChar: 100).
	aTable createFieldNamed: 'denomination' type: (platform varChar: 200).
	aTable createFieldNamed: 'type' type: (platform varChar: 1)	
]

{ #category : #tables }
SICDescriptorSystem >> tableForBCRADATA: aTable [

	| customerID |
	aTable name: 'BCRADATA'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	customerID := aTable createFieldNamed: 'customerID' type: platform int4.
	aTable addForeignKeyFrom: customerID to: ((self tableNamed: 'person') fieldNamed: 'id').
	aTable createFieldNamed: 'date' type: (platform datetime).
	aTable createFieldNamed: 'ts' type: (platform timestamp)

]

{ #category : #tables }
SICDescriptorSystem >> tableForBCRADEBT: aTable [

	| bcraDataID |
	aTable name: 'BCRADEBT'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	bcraDataID := (aTable createFieldNamed: 'bcraDataID' type: platform int4).
	aTable addForeignKeyFrom: bcraDataID to: ((self tableNamed: 'bcradata') fieldNamed: 'id').
	aTable createFieldNamed: 'denomination' type: (platform varChar: 200).
	aTable createFieldNamed: 'entity' type: (platform varChar: 200).	
	aTable createFieldNamed: 'period' type: (platform varChar: 50).	
	aTable createFieldNamed: 'situation' type: (platform varChar: 1).					
	aTable createFieldNamed: 'amount' type: (platform varChar: 50).
	aTable createFieldNamed: 'days' type: (platform varChar: 10).	
	aTable createFieldNamed: 'observation' type: (platform varChar: 300)
]

{ #category : #tables }
SICDescriptorSystem >> tableForBOUNCEDCHECK: aTable [

	| commerceId customerId bankId |
	
	aTable name: 'bouncedcheck'.
	(aTable createFieldNamed: 'id' type: platform sequence) bePrimaryKey.
	commerceId := aTable createFieldNamed: 'commerceid' type: platform int4.
	aTable addForeignKeyFrom: commerceId to: ((self tableNamed: 'commerce') fieldNamed: 'id').
	aTable createFieldNamed: 'date' type: (platform datetime).	
	customerId := aTable createFieldNamed: 'customerId' type: platform int4.
	aTable addForeignKeyFrom: customerId to: ((self tableNamed: 'person') fieldNamed: 'id').
	aTable createFieldNamed: 'checkNumber' type: (platform number).
	aTable createFieldNamed: 'bouncedDate' type: (platform datetime).
	aTable createFieldNamed: 'amountOfCheck' type: (platform number).
	bankId := aTable createFieldNamed: 'bankId' type: platform int4.
	aTable addForeignKeyFrom: bankId to: ((self tableNamed: 'Bank') fieldNamed: 'id').
	aTable createFieldNamed: 'cause' type: (platform varchar).
	aTable createFieldNamed: 'finePaymentDate' type: (platform datetime).
	aTable createFieldNamed: 'paymentDate' type: (platform datetime).
	aTable createFieldNamed: 'ts' type: (platform timestamp)
	


]

{ #category : #tables }
SICDescriptorSystem >> tableForCOMMERCE: aTable [

	| companyId |
	
	aTable name: 'COMMERCE'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'NAME' type: (platform varChar: 100).
	aTable createFieldNamed: 'CUIT' type: (platform varChar: 100).
	aTable createFieldNamed: 'ADDRESS' type: (platform varChar: 100).		
	companyId := aTable createFieldNamed: 'COMPANYID' type: platform int4.
	aTable addForeignKeyFrom: companyId to: ((self tableNamed: 'COMPANY') fieldNamed: 'id').
	aTable createFieldNamed: 'inputStrategy' type: (platform varChar: 100).	
	aTable createFieldNamed: 'ts' type: (platform timestamp)


]

{ #category : #tables }
SICDescriptorSystem >> tableForCOMMERCES_BY_USERS: aTable [
	"Answer an association table to map the menu elements in each role."
	
	| commerceKey userKey |
	
	userKey := aTable createFieldNamed: 'userid' type: (platform int4).
	aTable addForeignKeyFrom: userKey to: ((self tableNamed: 'SICUSER') fieldNamed: 'id').
	commerceKey := aTable createFieldNamed: 'commerceid' type: (platform int4).
	aTable addForeignKeyFrom: commerceKey to: ((self tableNamed: 'COMMERCE') fieldNamed: 'id')
]

{ #category : #tables }
SICDescriptorSystem >> tableForCOMPANY: aTable [

	aTable name: 'COMPANY'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'NAME' type: (platform varChar: 100).
	aTable createFieldNamed: 'ts' type: (platform timestamp)



]

{ #category : #tables }
SICDescriptorSystem >> tableForELECTORALROLL: aTable [
   
	aTable name: 'ElectoralRoll'.
	(aTable createFieldNamed: 'id' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'name' type: (platform varChar: 100).
	aTable createFieldNamed: 'cuit' type: (platform varChar: 11).
	aTable createFieldNamed: 'dni' type: (platform varChar: 8).
	aTable createFieldNamed: 'sex' type: (platform varChar: 100).
	aTable createFieldNamed: 'birthday' type: (platform varChar: 100).
	aTable createFieldNamed: 'age' type: (platform varChar: 100).
	aTable createFieldNamed: 'address' type: (platform varChar: 100).
	aTable createFieldNamed: 'occupation' type: (platform varChar: 100).
	aTable createFieldNamed: 'city' type: (platform varChar: 100).
	aTable createFieldNamed: 'state' type: (platform varChar: 100).
	aTable createFieldNamed: 'zipCode' type: (platform varChar: 100).
	aTable createFieldNamed: 'ts' type: (platform timestamp)
]

{ #category : #tables }
SICDescriptorSystem >> tableForFINANCIALSITUATIONS: aTable [

	| commerceId customerId operationTypeId operationCharacterId |
	
	aTable name: 'financialsituations'.
	(aTable createFieldNamed: 'id' type: platform sequence) bePrimaryKey.
	commerceId := aTable createFieldNamed: 'commerceid' type: platform int4.
	aTable addForeignKeyFrom: commerceId to: ((self tableNamed: 'commerce') fieldNamed: 'id').
	aTable createFieldNamed: 'date' type: (platform datetime).
	aTable createFieldNamed: 'amountofdebt' type: (platform number).	
	customerId := aTable createFieldNamed: 'customerId' type: platform int4.
	aTable addForeignKeyFrom: customerId to: ((self tableNamed: 'person') fieldNamed: 'id').
	aTable createFieldNamed: 'dateOfLastPayment' type: (platform datetime).
	operationTypeId := aTable createFieldNamed: 'operationTypeId' type: platform int4.
	aTable addForeignKeyFrom: operationTypeId to: ((self tableNamed: 'operationtype') fieldNamed: 'id').
	operationCharacterId := aTable createFieldNamed: 'operationCharacterId' type: platform int4.
	aTable addForeignKeyFrom: operationCharacterId to: ((self tableNamed: 'operationcharacter') fieldNamed: 'id').
	aTable createFieldNamed: 'type' type: (platform varChar: 100).	
	aTable createFieldNamed: 'ts' type: (platform timestamp)
	


]

{ #category : #tables }
SICDescriptorSystem >> tableForFINANCIALSITUATIONSBYCOMMERCE: aTable [

	| commerceId |
	
	aTable name: 'FinancialSituationsByCommerce'.
	commerceId := aTable createFieldNamed: 'commerceid' type: platform int4.
	aTable addForeignKeyFrom: commerceId to: ((self tableNamed: 'commerce') fieldNamed: 'id').
	aTable createFieldNamed: 'date' type: (platform datetime).
	aTable createFieldNamed: 'amountOfFinancialSituations' type: (platform number)




]

{ #category : #tables }
SICDescriptorSystem >> tableForFINANCIALSITUATIONS_REPORT: aTable [

	| commerceId |
	
	aTable name: 'FINANCIALSITUATIONS_REPORT'.
	commerceId := aTable createFieldNamed: 'COMMERCEID' type: platform int4.
	aTable addForeignKeyFrom: commerceId to: ((self tableNamed: 'COMMERCE') fieldNamed: 'id').
	aTable createFieldNamed: 'amountOfFinancialSituations' type: (platform number).
	aTable createFieldNamed: 'totalDebt' type: (platform number).
	aTable createFieldNamed: 'higherDebt' type: (platform number).
	aTable createFieldNamed: 'lowerDebt' type: (platform number).	
	aTable createFieldNamed: 'lastUpdate' type: (platform datetime).	
	aTable createFieldNamed: 'oldUpdate' type: (platform datetime).	
	aTable createFieldNamed: 'maxDebtDate' type: (platform datetime).	
	aTable createFieldNamed: 'minDebtDate' type: (platform datetime).
]

{ #category : #tables }
SICDescriptorSystem >> tableForINSCRIPCIONAFIP: aTable [

	aTable name: 'InscripcionAFIP'.
	aTable createFieldNamed: 'CUIT' type: (platform varChar: 11).
	aTable createFieldNamed: 'DENOMINACION' type: (platform varChar: 30).
	aTable createFieldNamed: 'REFERENCIA' type: (platform varChar: 10)
]

{ #category : #tables }
SICDescriptorSystem >> tableForLOSTCHECK: aTable [

	| commerceId customerId bankId |
	
	aTable name: 'lostcheck'.
	(aTable createFieldNamed: 'id' type: platform sequence) bePrimaryKey.
	commerceId := aTable createFieldNamed: 'commerceid' type: platform int4.
	aTable addForeignKeyFrom: commerceId to: ((self tableNamed: 'commerce') fieldNamed: 'id').
	aTable createFieldNamed: 'date' type: (platform datetime).	
	customerId := aTable createFieldNamed: 'customerId' type: platform int4.
	aTable addForeignKeyFrom: customerId to: ((self tableNamed: 'person') fieldNamed: 'id').
	aTable createFieldNamed: 'checkNumber' type: (platform number).
	aTable createFieldNamed: 'lostDate' type: (platform datetime).
	aTable createFieldNamed: 'amountOfCheck' type: (platform number).
	bankId := aTable createFieldNamed: 'bankId' type: platform int4.
	aTable addForeignKeyFrom: bankId to: ((self tableNamed: 'Bank') fieldNamed: 'id').
	aTable createFieldNamed: 'ts' type: (platform timestamp)
	


]

{ #category : #tables }
SICDescriptorSystem >> tableForMENUELEMENT: aTable [

	| parentId |
	aTable name: 'MENUELEMENT'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'NAME' type: (platform varChar: 100).
	aTable createFieldNamed: 'PRESENTERCLASS' type: (platform varChar: 100).
	aTable createFieldNamed: 'MENUELEMENTCLASS' type: (platform varChar: 100).
	parentId := aTable createFieldNamed: 'PARENTID' type: platform int4.
	aTable addForeignKeyFrom: parentId to: (aTable fieldNamed: 'ID').
	aTable createFieldNamed: 'ts' type: (platform timestamp)
]

{ #category : #tables }
SICDescriptorSystem >> tableForMENUELEMENTS_BY_ROLE: aTable [
	"Answer an association table to map the menu elements in each role."
	
	| menuElementKey roleKey |
	
	roleKey := aTable createFieldNamed: 'ROLEID' type: (platform int4).
	aTable addForeignKeyFrom: roleKey to: ((self tableNamed: 'ROLE') fieldNamed: 'id').
	menuElementKey := aTable createFieldNamed: 'MENUELEMENTID' type: (platform int4).
	aTable addForeignKeyFrom: menuElementKey to: ((self tableNamed: 'MENUELEMENT') fieldNamed: 'id') 
]

{ #category : #tables }
SICDescriptorSystem >> tableForMONTHLYPAYMENT: aTable [

	| commerceId packageOfReportsId |
	
	aTable name: 'MONTHLYPAYMENT'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	commerceId := aTable createFieldNamed: 'commerceid' type: platform int4.
	aTable addForeignKeyFrom: commerceId to: ((self tableNamed: 'commerce') fieldNamed: 'id').
	aTable createFieldNamed: 'DATE' type: (platform datetime).
	packageOfReportsId := aTable createFieldNamed: 'packageOfReportsId' type: platform int4.
	aTable addForeignKeyFrom: packageOfReportsId to: ((self tableNamed: 'packageofreports') fieldNamed: 'id').
	aTable createFieldNamed: 'ts' type: (platform timestamp)


]

{ #category : #tables }
SICDescriptorSystem >> tableForOPERATIONCHARACTER: aTable [

	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	(aTable createFieldNamed: 'name' type: (platform varChar: 100)).
	(aTable createFieldNamed: 'code' type: (platform varChar: 5)).
	aTable createFieldNamed: 'ts' type: (platform timestamp)
]

{ #category : #tables }
SICDescriptorSystem >> tableForOPERATIONTYPE: aTable [

	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	(aTable createFieldNamed: 'name' type: (platform varChar: 100)).
	(aTable createFieldNamed: 'code' type: (platform varChar: 5)).
	aTable createFieldNamed: 'ts' type: (platform timestamp)
]

{ #category : #tables }
SICDescriptorSystem >> tableForPACKAGEOFREPORTS: aTable [

	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	(aTable createFieldNamed: 'name' type: (platform varChar: 100)).
	(aTable createFieldNamed: 'numberOfReports' type: (platform numeric)).
	(aTable createFieldNamed: 'packagePrice' type: (platform numeric)).
	(aTable createFieldNamed: 'surplusReportPrice' type: (platform numeric)).
	aTable createFieldNamed: 'ts' type: (platform timestamp)
]

{ #category : #tables }
SICDescriptorSystem >> tableForPACKAGESOFREPORTS_BY_COMPANY: aTable [
	"Answer an association table to map the menu elements in each role."
	
	| companyKey packagesOfReportsKey |
	
	companyKey := aTable createFieldNamed: 'COMPANYID' type: (platform int4).
	aTable addForeignKeyFrom: companyKey to: ((self tableNamed: 'COMPANY') fieldNamed: 'id').
	packagesOfReportsKey := aTable createFieldNamed: 'PACKAGEOFREPORTSID' type: (platform int4).
	aTable addForeignKeyFrom: packagesOfReportsKey to: ((self tableNamed: 'PACKAGEOFREPORTS') fieldNamed: 'id') 
	
]

{ #category : #tables }
SICDescriptorSystem >> tableForPADRON2009: aTable [

	aTable name: 'PADRON2009'.
	aTable createFieldNamed: 'NOMBRE' type: (platform varChar: 100).
	aTable createFieldNamed: 'NUMDOC' type: (platform varChar: 11).
	aTable createFieldNamed: 'SEXO' type: (platform varChar: 1)


]

{ #category : #tables }
SICDescriptorSystem >> tableForPADRONBCRA: aTable [

	aTable name: 'PadronBCRA'.
	aTable createFieldNamed: 'CUIT' type: (platform varChar: 11).
	aTable createFieldNamed: 'DENOM' type: (platform varChar: 100)


]

{ #category : #tables }
SICDescriptorSystem >> tableForPERSON: aTable [

	aTable name: 'person'.
	(aTable createFieldNamed: 'id' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'name' type: (platform varChar: 100).
	aTable createFieldNamed: 'cuit' type: (platform varChar: 11).
	aTable createFieldNamed: 'dni' type: (platform varChar: 11).
	aTable createFieldNamed: 'customerType' type: (platform varChar: 100).
	aTable createFieldNamed: 'personclass' type: (platform varChar: 100).
	aTable createFieldNamed: 'ts' type: (platform timestamp).
	aTable createFieldNamed: 'address' type: (platform varChar: 100).
	aTable createFieldNamed: 'birthday' type:  (platform timestamp).
	aTable createFieldNamed: 'occupation' type: (platform varChar: 100).
	aTable createFieldNamed: 'job' type: (platform varChar: 100).
	aTable createFieldNamed: 'spouse' type: (platform varChar: 100).
	aTable createFieldNamed: 'spouseDocumentNumber' type: (platform varChar: 100)
]

{ #category : #tables }
SICDescriptorSystem >> tableForQUOTEDMARKETDATA: aTable [
	
	aTable name: 'quotedmarketdata'.
	(aTable createFieldNamed: 'id' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'date' type: (platform datetime).	
	aTable createFieldNamed: 'dolarCompraOficial' type: (platform varchar).
	aTable createFieldNamed: 'dolarCompraInformal' type: (platform varchar).
	aTable createFieldNamed: 'dolarVentaOficial' type: (platform varchar).
	aTable createFieldNamed: 'dolarVentaInformal' type: (platform varchar).
	aTable createFieldNamed: 'dolarVariacionOficial' type: (platform varchar).
	aTable createFieldNamed: 'dolarVariacionInformal' type: (platform varchar).
	aTable createFieldNamed: 'ultimoSoja' type: (platform varchar).
	aTable createFieldNamed: 'ultimoTrigo' type: (platform varchar).
	aTable createFieldNamed: 'ultimoMaiz' type: (platform varchar).
	aTable createFieldNamed: 'anteriorSoja' type: (platform varchar).
	aTable createFieldNamed: 'anteriorTrigo' type: (platform varchar).
	aTable createFieldNamed: 'anteriorMaiz' type: (platform varchar).
	aTable createFieldNamed: 'variacionSoja' type: (platform varchar).
	aTable createFieldNamed: 'variacionTrigo' type: (platform varchar).
	aTable createFieldNamed: 'variacionMaiz' type: (platform varchar)
]

{ #category : #tables }
SICDescriptorSystem >> tableForREPORTEMISSION: aTable [

	| commerceId customerid userid |
	
	aTable name: 'REPORTEMISSION'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	commerceId := aTable createFieldNamed: 'commerceid' type: platform int4.
	aTable addForeignKeyFrom: commerceId to: ((self tableNamed: 'commerce') fieldNamed: 'id').
	aTable createFieldNamed: 'DATE' type: (platform datetime).
	customerid := aTable createFieldNamed: 'customerid' type: platform int4.
	aTable addForeignKeyFrom: customerid to: ((self tableNamed: 'person') fieldNamed: 'id').
	userid := aTable createFieldNamed: 'userid' type: platform int4.
	aTable addForeignKeyFrom: userid to: ((self tableNamed: 'sicuser') fieldNamed: 'id').
	aTable createFieldNamed: 'REPORTKIND' type: (platform varchar: 100).
	aTable createFieldNamed: 'ts' type: (platform timestamp)


]

{ #category : #tables }
SICDescriptorSystem >> tableForROLE: aTable [
	"Answer a table to map each security function."

	aTable name: 'ROLE'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'NAME' type: (platform varChar: 100).
	aTable createFieldNamed: 'ts' type: (platform timestamp)
]

{ #category : #tables }
SICDescriptorSystem >> tableForROLES_BY_USERS: aTable [
	"Answer an association table to map the menu elements in each role."
	
	| roleKey userKey |
	
	userKey := aTable createFieldNamed: 'userid' type: (platform int4).
	aTable addForeignKeyFrom: userKey to: ((self tableNamed: 'sicuser') fieldNamed: 'id').
	roleKey := aTable createFieldNamed: 'roleid' type: (platform int4).
	aTable addForeignKeyFrom: roleKey to: ((self tableNamed: 'role') fieldNamed: 'id') 
]

{ #category : #tables }
SICDescriptorSystem >> tableForSECURITYFUNCTION: aTable [
	"Answer a table to map each security function."

	aTable name: 'SECURITYFUNCTION'.
	(aTable createFieldNamed: 'ID' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'NAME' type: (platform varChar: 100).
	aTable createFieldNamed: 'YAVUOBJECTCLASS' type: (platform varChar: 100).
	aTable createFieldNamed: 'ts' type: (platform timestamp)
]

{ #category : #tables }
SICDescriptorSystem >> tableForSECURITYFUNCTION_BY_ROLE: aTable [
	"Answer an association table to map the security function in each role."
	
	| securityFunctionKey roleKey |
	
	roleKey := aTable createFieldNamed: 'ROLEID' type: (platform int4).
	aTable addForeignKeyFrom: roleKey to: ((self tableNamed: 'ROLE') fieldNamed: 'id').
	securityFunctionKey := aTable createFieldNamed: 'SECURITYFUNCTIONID' type: (platform int4).
	aTable addForeignKeyFrom: securityFunctionKey to: ((self tableNamed: 'SECURITYFUNCTION') fieldNamed: 'id') 
]

{ #category : #tables }
SICDescriptorSystem >> tableForSICUSER: aTable [

	| companyID | 
	aTable name: 'sicuser'.
	(aTable createFieldNamed: 'id' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'name' type: (platform varChar: 100).
	aTable createFieldNamed: 'email' type: (platform varChar: 100).
	aTable createFieldNamed: 'password' type: (platform varChar: 100).
	aTable createFieldNamed: 'fullname' type: (platform varChar: 100).			
	aTable createFieldNamed: 'phonenumber' type: (platform varChar: 100).					
	companyID := aTable createFieldNamed: 'companyid' type: platform int4.
	aTable addForeignKeyFrom: companyID to: ((self tableNamed: 'company') fieldNamed: 'id').
	aTable createFieldNamed: 'ts' type: (platform timestamp)
]

{ #category : #tables }
SICDescriptorSystem >> tableForSYNCHRONIZATIONDATABASE: aTable [
	
	aTable name: 'synchronizationdatabase'.
	(aTable createFieldNamed: 'id' type: platform sequence) bePrimaryKey.
	aTable createFieldNamed: 'entity' type: (platform varchar: 100).
	aTable createFieldNamed: 'date' type: (platform datetime).
	aTable createFieldNamed: 'synchronizationdate' type: (platform datetime).
	aTable createFieldNamed: 'ts' type: (platform timestamp)
	


]

{ #category : #types }
SICDescriptorSystem >> typeResolverForMenuElement [

	^FilteredTypeResolver forRootClass: YavuMenuElement
]

{ #category : #types }
SICDescriptorSystem >> typeResolverForPerson [

	^FilteredTypeResolver forRootClass: YavuPerson
]
