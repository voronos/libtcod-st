Class {
	#name : #TCODKey,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_C',
		'OFFSET_LALT',
		'OFFSET_LMETA',
		'OFFSET_LTCRL',
		'OFFSET_PRESSED',
		'OFFSET_RALT',
		'OFFSET_RCTRL',
		'OFFSET_RMETA',
		'OFFSET_SHIFT',
		'OFFSET_TEXT',
		'OFFSET_VK'
	],
	#category : #'LibtcodSt-FFI'
}

{ #category : #'field definition' }
TCODKey class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(TCODKeycode vk #';' char c #';' String text #';' bool pressed #';' bool lalt #';' bool ltcrl #';' bool lmeta #';' bool ralt #';' bool rctrl #';' bool rmeta #';' bool shift)
]

{ #category : #'accessing structure variables' }
TCODKey >> c [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_C
]

{ #category : #'accessing structure variables' }
TCODKey >> c: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_C put: anObject
]

{ #category : #'accessing structure variables' }
TCODKey >> lalt [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_LALT
]

{ #category : #'accessing structure variables' }
TCODKey >> lalt: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_LALT put: anObject
]

{ #category : #'accessing structure variables' }
TCODKey >> lmeta [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_LMETA
]

{ #category : #'accessing structure variables' }
TCODKey >> lmeta: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_LMETA put: anObject
]

{ #category : #'accessing structure variables' }
TCODKey >> ltcrl [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_LTCRL
]

{ #category : #'accessing structure variables' }
TCODKey >> ltcrl: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_LTCRL put: anObject
]

{ #category : #'accessing structure variables' }
TCODKey >> pressed [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_PRESSED
]

{ #category : #'accessing structure variables' }
TCODKey >> pressed: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_PRESSED put: anObject
]

{ #category : #'accessing structure variables' }
TCODKey >> ralt [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_RALT
]

{ #category : #'accessing structure variables' }
TCODKey >> ralt: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_RALT put: anObject
]

{ #category : #'accessing structure variables' }
TCODKey >> rctrl [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_RCTRL
]

{ #category : #'accessing structure variables' }
TCODKey >> rctrl: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_RCTRL put: anObject
]

{ #category : #'accessing structure variables' }
TCODKey >> rmeta [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_RMETA
]

{ #category : #'accessing structure variables' }
TCODKey >> rmeta: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_RMETA put: anObject
]

{ #category : #'accessing structure variables' }
TCODKey >> shift [
	"This method was automatically generated"
	^handle booleanAt: OFFSET_SHIFT
]

{ #category : #'accessing structure variables' }
TCODKey >> shift: anObject [
	"This method was automatically generated"
	handle booleanAt: OFFSET_SHIFT put: anObject
]

{ #category : #'accessing structure variables' }
TCODKey >> text [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TEXT) type: ExternalType char asPointerType
]

{ #category : #'accessing structure variables' }
TCODKey >> text: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
TCODKey >> vk [
	"This method was automatically generated"
	^TCODKeycode fromInteger: (handle unsignedLongAt: OFFSET_VK)
]

{ #category : #'accessing structure variables' }
TCODKey >> vk: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_VK put: anObject value
]
