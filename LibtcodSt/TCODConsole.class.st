Class {
	#name : #TCODConsole,
	#superclass : #FFIExternalObject,
	#category : #'LibtcodSt-FFI'
}

{ #category : #accessing }
TCODConsole >> atX: x atY: y putChar: aChar withBackground: aBackgroundFlag [
^ self ffiCall: #(void TCOD_console_put_char #(TCODConsole self , int x , int y , int aChar , TCODBackgroundFlag aBackgroundFlag))
		module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCODConsole >> blitTo: aTcodConsole fromExtent: aRect toPoint: destinationPoint [
	TCOD
		consoleBlit: self
		xSrc: aRect left
		ySrc: aRect top
		width: aRect width
		height: aRect height
		toConsole: aTcodConsole
		xDestination: destinationPoint x
		yDestination: destinationPoint y
		foregroundAlpha: 1.0
		backgroundAlpha: 1.0
]

{ #category : #'as yet unclassified' }
TCODConsole >> putChar: aChar atX: x atY: y [
self atX: x atY: y putChar: aChar withBackground: TCODBackgroundFlag BackgroundNone
]

{ #category : #'as yet unclassified' }
TCODConsole >> putChar: aChar atX: x atY: y withBackground: backgroundFlag [
self atX: x atY:y  putChar: aChar withBackground: backgroundFlag
]

{ #category : #initialization }
TCODConsole >> setCharBackgroundAtX: x y: y toColor: color [

 self
		setCharBackgroundAtX: x
		y: y
		toColor: color asTcodColor
		withFlags: TCODBackgroundFlag BackgroundSet
]

{ #category : #initialization }
TCODConsole >> setCharBackgroundAtX: x y: y toColor: color withFlags: backgroundFlags [
^ self
		ffiCall:
			#(void TCOD_console_set_char_background #(TCODConsole self , int x , int y , TCODColor color , TCODBackgroundFlag backgroundFlags))
		module: LibTCOD.
]

{ #category : #initialization }
TCODConsole >> setDefaultForegroundColor: aColor [
	TCOD consoleSetDefaultForeground: self toColor: aColor asTcodColor 
]
