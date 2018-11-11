Class {
	#name : #TCODGame,
	#superclass : #Object,
	#instVars : [
		'objects',
		'map',
		'actionMap',
		'screenWidth',
		'screenHeight'
	],
	#category : #'LibtcodSt-Tutorial'
}

{ #category : #drawing }
TCODGame >> drawOn: aTcodConsole [
map drawOn: aTcodConsole .
objects do: [ :o | o drawOn: aTcodConsole  ].

aTcodConsole blitTo: TCODConsole null fromExtent: (0@0 extent: screenWidth@screenHeight) toPoint: 0@0.
TCOD consoleFlush.
objects do: [ :o | o clearOn: aTcodConsole  ].
]

{ #category : #accessing }
TCODGame >> handleKeys [
|key|
	key := TCOD consoleWaitForKeypress: true.
	
	actionMap at: key vk ifPresent: [ :action | 
		action value ].
	"use this as last to return true or false"
	^ key vk = TCODKeycode TCODK_ESCAPE 
]

{ #category : #initialization }
TCODGame >> initialize [
	| player npc |
	screenWidth := 80.
	screenHeight := 50.
	player := TCODObject new
		char: $@;
		color: Color white.
	map := TCODMap
		randomNewWidth: TCODMap defaultWidth
		andHeight: TCODMap defaultHeight
		withPlayer: player.
	npc := TCODObject new
		x: 10;
		y: 10;
		char: $@;
		color: Color yellow.
	objects := {player.
	npc}.
	actionMap := {(TCODKeycode TCODK_DOWN -> [ player moveOnMap: map byX: 0 andY: 1 ]).
	(TCODKeycode TCODK_LEFT -> [ player moveOnMap: map byX: -1 andY: 0 ]).
	(TCODKeycode TCODK_RIGHT -> [ player moveOnMap: map byX: 1 andY: 0 ]).
	(TCODKeycode TCODK_UP -> [ player moveOnMap: map byX: 0 andY: -1 ])} asDictionary
]

{ #category : #playing }
TCODGame >> play [
	| con |
	TCOD consoleInitRootWidth: screenWidth height: screenHeight title: 'libtcod - smalltalk' isFullScreen: false renderer: TCODRendererEnum TCOD_RENDERER_SDL .
	con := TCOD newConsoleWithWidth: screenWidth andHeight: screenHeight.
	con setDefaultForegroundColor: Color white.
	[ self drawOn: con.
	self handleKeys ] whileFalse.
	TCOD quit
]
