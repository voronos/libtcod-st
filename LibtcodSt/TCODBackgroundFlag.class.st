Class {
	#name : #TCODBackgroundFlag,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'BackgroundNone',
		'TCOD_BKGND_ADD',
		'TCOD_BKGND_ADDA',
		'TCOD_BKGND_ALPH',
		'TCOD_BKGND_BURN',
		'TCOD_BKGND_COLOR_BURN',
		'TCOD_BKGND_COLOR_DODGE',
		'TCOD_BKGND_DARKEN',
		'TCOD_BKGND_DEFAULT',
		'TCOD_BKGND_LIGHTEN',
		'TCOD_BKGND_MULTIPLY',
		'TCOD_BKGND_NONE',
		'TCOD_BKGND_OVERLAY',
		'TCOD_BKGND_SCREEN',
		'TCOD_BKGND_SET'
	],
	#category : #'LibtcodSt-FFI'
}

{ #category : #'enum declaration' }
TCODBackgroundFlag class >> BackgroundNone [
^ TCOD_BKGND_NONE
]

{ #category : #'enum declaration' }
TCODBackgroundFlag class >> BackgroundSet [
	^ TCOD_BKGND_SET
]

{ #category : #'enum declaration' }
TCODBackgroundFlag class >> enumDecl [
	^ (#(#TCOD_BKGND_NONE TCOD_BKGND_SET TCOD_BKGND_MULTIPLY TCOD_BKGND_LIGHTEN TCOD_BKGND_DARKEN TCOD_BKGND_SCREEN TCOD_BKGND_COLOR_DODGE TCOD_BKGND_COLOR_BURN TCOD_BKGND_ADD TCOD_BKGND_ADDA TCOD_BKGND_BURN TCOD_BKGND_OVERLAY TCOD_BKGND_ALPH TCOD_BKGND_DEFAULT)
		collectWithIndex: [ :e :i | e -> (i -1) ]) asDictionary
]

{ #category : #'enum declaration' }
TCODBackgroundFlag class >> initialize [ 
self initializeEnumeration 
]
