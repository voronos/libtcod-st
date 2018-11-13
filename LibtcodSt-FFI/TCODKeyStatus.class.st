Class {
	#name : #TCODKeyStatus,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'TCOD_KEY_PRESSED',
		'TCOD_KEY_RELEASED'
	],
	#category : #'LibtcodSt-FFI'
}

{ #category : #'enum declaration' }
TCODKeyStatus class >> enumDecl [
^ #(TCOD_KEY_PRESSED 1 TCOD_KEY_RELEASED 2)
]

{ #category : #'class initialization' }
TCODKeyStatus class >> initialize [ 
self initializeEnumeration 
]
