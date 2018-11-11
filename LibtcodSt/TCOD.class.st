Class {
	#name : #TCOD,
	#superclass : #Object,
	#category : #'LibtcodSt-FFI'
}

{ #category : #'as yet unclassified' }
TCOD class >> consoleBlit: aTcodConsole xSrc: xSrc ySrc: ySrc width: width height: height toConsole: destConsole xDestination: xDest yDestination: yDest foregroundAlpha: falpha backgroundAlpha: balpha [
	^ self
		ffiCall:
			#(void TCOD_console_blit #(TCODConsole aTcodConsole , int xSrc , int ySrc , int width , int height , TCODConsole destConsole , int xDest , int yDest , float falpha , float balpha))
		module: LibTCOD 
]

{ #category : #'as yet unclassified' }
TCOD class >> consoleCheckForKeypress: flags [
	^ self
		ffiCall: #(TCODKey TCOD_console_check_for_keypress #(int flags))
		module: LibTCOD 
]

{ #category : #'as yet unclassified' }
TCOD class >> consoleFlush [
	^ self ffiCall: #(void TCOD_console_flush #(void)) module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCOD class >> consoleInitRootWidth: width height: height title: title isFullScreen: isFullScreen renderer: renderer [
	^ self
		ffiCall:
			#(void TCOD_console_init_root #(int width , int height , String title , Boolean isFullScreen , TCODRendererEnum renderer))
		module: LibTCOD 
]

{ #category : #'as yet unclassified' }
TCOD class >> consoleIsWindowClosed [
	^ self ffiCall: #(bool TCOD_console_is_window_closed #()) module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCOD class >> consoleSetDefaultForeground: aConsole toColor: tcodColor [
	^ self
		ffiCall: #(void TCOD_console_set_default_foreground #(TCODConsole aConsole , TCODColor tcodColor))
		module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCOD class >> consoleWaitForKeypress: doFlush [
	^ self
		ffiCall: #(TCODKey TCOD_console_wait_for_keypress #(bool doFlush))
		module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCOD class >> ffiLibraryName [ 
^ LibTCOD
]

{ #category : #'as yet unclassified' }
TCOD class >> initDefaultConsole [
	^ self
		consoleInitRootWidth: 80
		height: 50
		title: 'LibTCOD Tutorial - Smalltalk'
		isFullScreen: false
		renderer: TCODRendererEnum TCOD_RENDERER_SDL
]

{ #category : #'instance creation' }
TCOD class >> newConsoleWithWidth: aWidth andHeight: aHeight [
	^ self
		ffiCall: #(TCODConsole TCOD_console_new #(int aWidth , int aHeight))
		module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCOD class >> quit [
	^ self ffiCall: #(void TCOD_sys_shutdown #(void))
]

{ #category : #'as yet unclassified' }
TCOD class >> quit: aMessage [
	^ self ffiCall: #(void TCOD_fatal #(String aMessage))
]

{ #category : #'instance creation' }
TCOD class >> randomIntFrom: min to: max [
	^ self ffiCall: #(int TCOD_random_get_int #(0 , int min , int max))
]
