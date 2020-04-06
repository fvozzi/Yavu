Class {
	#name : #TBSMagritteReportChooser,
	#superclass : #GRObject,
	#instVars : [
		'bordered',
		'stiped',
		'condensed',
		'showBatchFirstLast',
		'hover'
	],
	#category : #'YavuCommon-Bootstrap-Magritte-Examples'
}

{ #category : #accessing }
TBSMagritteReportChooser >> bordered [
	^ bordered
]

{ #category : #accessing }
TBSMagritteReportChooser >> bordered: anObject [
	bordered := anObject
]

{ #category : #'magrittes-descriptions' }
TBSMagritteReportChooser >> borderedDescription [
	<magritteDescription>
	^ MABooleanDescription new 
		label: 'Bordered';
		group: 'Bootstrap options' ;
		accessor: #bordered;
		comment: 'Rounds corners and adds outer border';
		default: false;
		componentClass: TBSMagritteCheckboxComponent ;
		yourself
]

{ #category : #accessing }
TBSMagritteReportChooser >> condensed [
	^ condensed
]

{ #category : #accessing }
TBSMagritteReportChooser >> condensed: anObject [
	condensed := anObject
]

{ #category : #'magrittes-descriptions' }
TBSMagritteReportChooser >> condensedDescription [
	<magritteDescription>
	^ MABooleanDescription new 
		label: 'Condensed';
		group: 'Bootstrap options' ;
		accessor: #condensed;
		comment: 'Cuts vertical padding in half';
		default: false;
		componentClass: TBSMagritteCheckboxComponent ;
		yourself
]

{ #category : #'magrittes-descriptions' }
TBSMagritteReportChooser >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: TBSMagritteFormRenderer;
		yourself
]

{ #category : #accessing }
TBSMagritteReportChooser >> hover [
	^ hover
]

{ #category : #accessing }
TBSMagritteReportChooser >> hover: anObject [
	hover := anObject
]

{ #category : #'magrittes-descriptions' }
TBSMagritteReportChooser >> hoverDescription [
	<magritteDescription>
	^ MABooleanDescription new 
		label: 'Hover';
		group: 'Bootstrap options' ;
		accessor: #hover;
		comment: 'Highlights when the cursor hovers over a row';
		default: false;
		componentClass: TBSMagritteCheckboxComponent ;
		yourself
]

{ #category : #accessing }
TBSMagritteReportChooser >> showBatchFirstLast [
	^ showBatchFirstLast
]

{ #category : #accessing }
TBSMagritteReportChooser >> showBatchFirstLast: anObject [
	showBatchFirstLast := anObject
]

{ #category : #'magrittes-descriptions' }
TBSMagritteReportChooser >> showBatchFirstLastDescription [
	<magritteDescription>
	^ MABooleanDescription new 
		label: 'Show first/last';
		accessor: #showBatchFirstLast;
		default: false;
		componentClass: TBSMagritteCheckboxComponent ;
		yourself
]

{ #category : #accessing }
TBSMagritteReportChooser >> striped [
	^ stiped
]

{ #category : #accessing }
TBSMagritteReportChooser >> striped: anObject [
	stiped := anObject
]

{ #category : #'magrittes-descriptions' }
TBSMagritteReportChooser >> stripedDescription [
	<magritteDescription>
	^ MABooleanDescription new 
		label: 'Striped';
		accessor: #striped;
		comment: 'Adds light gray background color to odd rows';
		default: false;
		componentClass: TBSMagritteCheckboxComponent ;
		yourself
]
