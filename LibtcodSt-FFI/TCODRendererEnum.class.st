Class {
	#name : #TCODRendererEnum,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'TCOD_NB_RENDERERS',
		'TCOD_RENDERER_GLSL',
		'TCOD_RENDERER_GLSL\tTCOD_RENDERER_OPENGL\tTCOD_RENDERER_SDL',
		'TCOD_RENDERER_OPENGL',
		'TCOD_RENDERER_SDL'
	],
	#category : #'LibtcodSt-FFI'
}

{ #category : #'as yet unclassified' }
TCODRendererEnum class >> TCOD_RENDERER_GLSL [
 ^ TCOD_RENDERER_GLSL
]

{ #category : #'as yet unclassified' }
TCODRendererEnum class >> TCOD_RENDERER_SDL [
^ TCOD_RENDERER_SDL 
]

{ #category : #'enum declaration' }
TCODRendererEnum class >> enumDecl [
	^ #(TCOD_RENDERER_GLSL 0	TCOD_RENDERER_OPENGL 1 TCOD_RENDERER_SDL 2 TCOD_NB_RENDERERS 3)
]

{ #category : #'class initialization' }
TCODRendererEnum class >> initialize [ 
self initializeEnumeration

]
