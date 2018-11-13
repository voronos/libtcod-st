Class {
	#name : #TCOD,
	#superclass : #Object,
	#category : #'LibtcodSt-FFI'
}

{ #category : #'as yet unclassified' }
TCOD class >> checkForKeypress: flags [
	^ self
		ffiCall: #(TCODKey TCOD_console_check_for_keypress #(int flags))
		module: LibTCOD 
]

{ #category : #'as yet unclassified' }
TCOD class >> ffiLibraryName [ 
^ LibTCOD
]

{ #category : #'as yet unclassified' }
TCOD class >> flush [
	^ self ffiCall: #(void TCOD_console_flush #(void)) module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCOD class >> initDefaultConsole [
	^ self
		initRootWidth: 80
		height: 50
		title: 'LibTCOD Tutorial - Smalltalk'
		isFullScreen: false
		renderer: TCODRendererEnum TCOD_RENDERER_SDL
]

{ #category : #'as yet unclassified' }
TCOD class >> initRootWidth: width height: height title: title isFullScreen: isFullScreen renderer: renderer [
	^ self
		ffiCall:
			#(void TCOD_console_init_root #(int width , int height , String title , Boolean isFullScreen , TCODRendererEnum renderer))
		module: LibTCOD 
]

{ #category : #'as yet unclassified' }
TCOD class >> isWindowClosed [
	^ self ffiCall: #(bool TCOD_console_is_window_closed #()) module: LibTCOD
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

{ #category : #'as yet unclassified' }
TCOD class >> waitForKeypress: doFlush [
	^ self
		ffiCall: #(TCODKey TCOD_console_wait_for_keypress #(bool doFlush))
		module: LibTCOD
]
