Class {
	#name : #LibTCOD,
	#superclass : #FFILibrary,
	#category : #'LibtcodSt-Libraries'
}

{ #category : #'accessing platform' }
LibTCOD >> macModuleName [
	^ 'libtcod.dylib'
]

{ #category : #'accessing platform' }
LibTCOD >> unixModuleName [
	"Kept for backward compatibility. 
	 Users should use unix32* or unix64*"

	^ 'libtcod.so.0'
]

{ #category : #'accessing platform' }
LibTCOD >> win32ModuleName [
	^ 'libtcod.dll'
]
