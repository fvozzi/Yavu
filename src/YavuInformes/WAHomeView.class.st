Class {
	#name : #WAHomeView,
	#superclass : #WAComponentWithStyle,
	#instVars : [
		'deudoresPorMes',
		'reportEmissionsLastMonths'
	],
	#category : #'YavuInformes-View'
}

{ #category : #accessing }
WAHomeView >> computeDeudoresPorMes [

 	| fromDate toDate situationsByDate |
	
	deudoresPorMes := Dictionary new.
	fromDate := (Date today addMonths: -8) beginOfMonth.
	toDate := Date today beginOfMonth.
	situationsByDate := (FinancialSituationsByCommerce instancesFrom: fromDate to: toDate forCompany: self session company) groupedBy: [:each | each date].
	situationsByDate keysAndValuesDo: [:month :situations | 
		deudoresPorMes at: month put: (situations inject: 0 into: [:accum :each | accum + each amountOfFinancialSituations])
		]
]

{ #category : #accessing }
WAHomeView >> deudoresPorMes [ 

	deudoresPorMes isNil ifTrue: [self computeDeudoresPorMes].
	^deudoresPorMes 
]

{ #category : #'initialize-release' }
WAHomeView >> initializeReportEmissionsLastMonths [

	| fromDate toDate  |
	
	fromDate := (Date today addMonths: -6) beginOfMonth.
	toDate := Date today endOfMonth.
	reportEmissionsLastMonths := ReportEmission instancesFrom: fromDate to: toDate entities: self session yavuSystem allowedCommerces
]

{ #category : #accessing }
WAHomeView >> literalArrayOf: aDictionaryOfValues [

	| literal sortedAsociations |
	
	literal := String new.
	sortedAsociations := OrderedCollection new.
	aDictionaryOfValues keysAndValuesDo: [:month :deudores | sortedAsociations add: (month -> deudores)].
	sortedAsociations := sortedAsociations asSortedCollection: [:a :b | a key < b key].
	sortedAsociations do: [:each |
		literal := literal, '[''', each key monthAbbreviation, '/', each key year asString, ''',', each value asString, '],'	
		].
	literal isEmpty ifFalse: [literal := (literal copyFrom: 1 to: literal size - 1)].
	^'[', literal, ']'
]

{ #category : #updating }
WAHomeView >> openBasicFinancialReport [

	self parent content: WABasicFinancialReportView new
]

{ #category : #updating }
WAHomeView >> openBasicPlusFinancialReport [

	self parent content: WABasicPlusFinancialReportView new
]

{ #category : #updating }
WAHomeView >> openPremiumFinancialReport [

	self parent content: WAPremiumFinancialReportView new
]

{ #category : #rendering }
WAHomeView >> renderCharts: html [

	html
		script:
			'$(document).ready(function(){
 			 var line1 = ', (self literalArrayOf: self deudoresPorMes), ';
 
 			 var plot1 = $.jqplot(''home-right-top'', [line1], {
    				title: ''Base de deudores'',
    				
   				 axesDefaults: {
       			 	 labelRenderer: $.jqplot.CanvasAxisLabelRenderer
    				},
    axes: {
      xaxis: {
        renderer: $.jqplot.CategoryAxisRenderer
      },
	yaxis: {
          			label: "Deudores"
       		 }
    }
  });
});' 
]

{ #category : #rendering }
WAHomeView >> renderContentOn: html [
	"Renderiza la página de inicio del receptor."

	html div id: 'home'; with: [ 
		html div id: 'home-left'; with: [self renderInformesSelectionOn: html].
		html div id: 'home-right'; with: [
			html div id: 'home-right-top'; with: [self renderCharts: html].
			html div id: 'home-right-botton'; with: [self renderLogos: html].
			].
		html div id: 'home-botton'; with: [self renderQuotedMarkedOn: html]
		]
			
]

{ #category : #rendering }
WAHomeView >> renderInformesSelectionOn: html [
	html div
		class: 'itemTitle';
		with: [ html text: 'Nuestros Informes' ].
	html div
		class: 'item';
		with: [ 
					html anchor
						callback: [ self openBasicFinancialReport ];
						with: [ html image resourceUrl: 'img/basico.png' ] ].
	html div
		class: 'item';
		with: [ 
					html anchor
						callback: [ self openBasicPlusFinancialReport ];
						with: [ html image resourceUrl: 'img/basicoPlus.png' ] ].
	html div
		class: 'item';
		with: [ 
					html anchor
						callback: [ self openPremiumFinancialReport ];
						with: [ html image resourceUrl: 'img/premium.png' ] ]
]

{ #category : #rendering }
WAHomeView >> renderLogos: html [

	html script: '$(document).ready(function(){
    // Can specify a custom tick Array.
    // Ticks should match up one for each y value (category) in the series.
    var basicos = ', (self literalArrayOf: (self reportEmissionsPerMonthOfKind: 'Basico')), ';
	var plus = ', (self literalArrayOf: (self reportEmissionsPerMonthOfKind: 'Basico Plus')), ';
     
    var plot1 = $.jqplot(''home-right-botton'', [basicos, plus], {
        // The "seriesDefaults" option is an options object that will
        // be applied to all series in the chart.
	 title: ''Emisiones mensuales'',
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            rendererOptions: {fillToZero: true}
        },
        // Custom labels for the series are specified with the "label"
        // option on the series option.  Here a series option object
        // is specified for each series.
        series:[
            {label:''Básico''},
            {label:''Plus''}
        ],
        // Show the legend and put it outside the grid, but inside the
        // plot container, shrinking the grid to accomodate the legend.
        // A value of "outside" would not shrink the grid and allow
        // the legend to overflow the container.
        legend: {
            show: true,
            placement: ''outsideGrid''
        },
        axes: {
            // Use a category axis on the x axis and use our custom ticks.
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer
            },
            // Pad the y axis just a little so bars can get close to, but
            // not touch, the grid boundaries.  1.2 is the default padding.
            yaxis: {
                 labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
		label: ''Emisiones''
            }
        }
    });
});'
]

{ #category : #rendering }
WAHomeView >> renderQuotedMarkedOn: html [

	html div
		class: 'itemTitle';
		with: [ html text: 'Mercado de Cotizaciones' ].
	html render: WAQuotedMarketDataComponent new
		

]

{ #category : #accessing }
WAHomeView >> reportEmissionsLastMonths [

 	reportEmissionsLastMonths ifNil: [self initializeReportEmissionsLastMonths].
	^reportEmissionsLastMonths 
]

{ #category : #accessing }
WAHomeView >> reportEmissionsPerMonthOfKind: aReportKind [

 	| emissionsByDate result |
	
	result := Dictionary new.
	emissionsByDate := (self reportEmissionsLastMonths select: [:each | each reportKind = aReportKind]).
	emissionsByDate := emissionsByDate groupedBy: [:each | each date asDate beginOfMonth ].
	emissionsByDate keysAndValuesDo: [:month :emissions | 
		result at: month put: emissions size
		].
	^result
]

{ #category : #updating }
WAHomeView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
    	anHtmlRoot stylesheet 
		resourceUrl: 'home.css'.
	anHtmlRoot stylesheet 
		resourceUrl: 'css/jquery.jqplot.css'.
	anHtmlRoot stylesheet 
		resourceUrl: 'css/quotedMarket.css'
]
