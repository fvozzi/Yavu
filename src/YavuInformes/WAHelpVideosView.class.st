Class {
	#name : #WAHelpVideosView,
	#superclass : #WAComponentWithStyle,
	#category : #'YavuInformes-View'
}

{ #category : #'as yet unclassified' }
WAHelpVideosView >> renderContentOn: html [
	
	html div class: 'videoLeft'; with: [ 
		html div class: 'videoTitle'; class: 'itemTitle'; with: [html text: 'Emisión informe básico'].
		html iframe url: 'http://player.vimeo.com/video/71065269'].
	html div class: 'videoMiddle'; with: [ 
		html div class: 'videoTitle'; with: [html text: 'Emisión informe Plus'].
		html iframe url: 'http://player.vimeo.com/video/71166782'].
	html div class: 'videoRight'; with: [ 
		html div class: 'videoTitle'; with: [html text: 'Análisis de Informe'].
		html iframe url: 'http://player.vimeo.com/video/71167748']
	
	

	

	"<iframe width=420 height=345
src=http://www.youtube.com/embed/XGSy3_Czz8k>
</iframe>"

"<iframe src=http://player.vimeo.com/video/70905974 width=500 height=352 frameborder=0 webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe> <p><a href=http://vimeo.com/70905974>WebSic - Inicio de sesión</a> from <a href=http://vimeo.com/user19692945>Websic</a> on <a href=https://vimeo.com>Vimeo</a>.</p>"
]

{ #category : #'as yet unclassified' }
WAHelpVideosView >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.  
	anHtmlRoot stylesheet 
		resourceUrl: 'css/helpVideos.css'
]
