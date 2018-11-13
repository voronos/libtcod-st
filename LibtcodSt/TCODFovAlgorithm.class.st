Class {
	#name : #TCODFovAlgorithm,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'FOV_BASIC',
		'FOV_DIAMOND',
		'FOV_PERMISSIVE_0',
		'FOV_PERMISSIVE_1',
		'FOV_PERMISSIVE_2',
		'FOV_PERMISSIVE_3',
		'FOV_PERMISSIVE_4',
		'FOV_PERMISSIVE_5',
		'FOV_PERMISSIVE_6',
		'FOV_PERMISSIVE_7',
		'FOV_PERMISSIVE_8',
		'FOV_RESTRICTIVE',
		'FOV_SHADOW',
		'NB_FOV_ALGORITHMS'
	],
	#category : #'LibtcodSt-FFI'
}

{ #category : #'as yet unclassified' }
TCODFovAlgorithm class >> defaultFovAlgorithm [
^ FOV_BASIC
]

{ #category : #'enum declaration' }
TCODFovAlgorithm class >> enumDecl [
	^ (#(FOV_BASIC FOV_DIAMOND FOV_SHADOW FOV_PERMISSIVE_0 FOV_PERMISSIVE_1 FOV_PERMISSIVE_2 FOV_PERMISSIVE_3 FOV_PERMISSIVE_4 FOV_PERMISSIVE_5 FOV_PERMISSIVE_6 FOV_PERMISSIVE_7 FOV_PERMISSIVE_8 FOV_RESTRICTIVE NB_FOV_ALGORITHMS)
		collectWithIndex: [ :e :i | e -> (i - 1) ]) asDictionary
]

{ #category : #'class initialization' }
TCODFovAlgorithm class >> initialize [
self initializeEnumeration 
]
