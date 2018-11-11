Extension { #name : #Color }

{ #category : #'*LibtcodSt' }
Color >> asTcodColor [
	^ TCODColor externalNew
		r: (self red * 255) asInteger;
		g: (self green * 255) asInteger;
		b: (self blue * 255) asInteger;
		yourself
]
