Class {
	#name : #TCODFovMap,
	#superclass : #FFIExternalObject,
	#category : #'LibtcodSt-FFI'
}

{ #category : #'instance creation' }
TCODFovMap class >> newWidth: width height: height [
	^ self ffiCall: #(#TCODFovMap TCOD_map_new #(int width , int height)) module: LibTCOD
]

{ #category : #'as yet unclassified' }
TCODFovMap >> computeFovAtX: x atY: y torchRadius: torchRadius doComputeLightWalls: aBool withAlgorithm: aTcodFovAlgorithm [
self ffiCall: #(void TCOD_map_compute_fov (#TCODFovMap self, int x, int y, int torchRadius, bool aBool, TCODFovAlgorithm aTcodFovAlgorithm)) module: LibTCOD 
]

{ #category : #testing }
TCODFovMap >> ifVisibleAtX: x atY: y do: aBlock [
	(self isVisibleAtX: x atY: y)		ifTrue: aBlock
]

{ #category : #testing }
TCODFovMap >> isVisibleAtX: x atY: y [
^ self ffiCall: #(bool TCOD_map_is_in_fov #(#TCODFovMap self, int x, int y)) module: LibTCOD .
]

{ #category : #initialization }
TCODFovMap >> setIsTransparent: isTransparent isWalkable: isWalkable atX: x atY: y [
	self
		ffiCall: #(void TCOD_map_set_properties #(#TCODFovMap self , int x , int y , bool isTransparent , bool isWalkable))
		module: LibTCOD
]
