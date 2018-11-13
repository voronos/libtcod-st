Class {
	#name : #TCODColor,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_B',
		'OFFSET_G',
		'OFFSET_R'
	],
	#category : #'LibtcodSt-FFI'
}

{ #category : #'field definition' }
TCODColor class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(uint8 r #';' uint8 g #';' uint8 b)
]

{ #category : #'instance creation' }
TCODColor class >> r: r g: g b: b [
^ (Color r: r g: g b: b range:255) asTcodColor
]

{ #category : #converting }
TCODColor >> asColor [
	^ Color r: self r  g: self g  b: self b range: 255
]

{ #category : #converting }
TCODColor >> asTcodColor [
^ self
]

{ #category : #'accessing structure variables' }
TCODColor >> b [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_B
]

{ #category : #'accessing structure variables' }
TCODColor >> b: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_B put: anObject
]

{ #category : #'accessing structure variables' }
TCODColor >> g [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_G
]

{ #category : #'accessing structure variables' }
TCODColor >> g: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_G put: anObject
]

{ #category : #'accessing structure variables' }
TCODColor >> r [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_R
]

{ #category : #'accessing structure variables' }
TCODColor >> r: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_R put: anObject
]
