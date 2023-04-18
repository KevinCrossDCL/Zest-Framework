
#option_explicit

SetErrorMode(2)

SetWindowTitle("Zest Framework")
SetWindowAllowResize(1)
SetOrientationAllowed(1, 1, 1, 1)
SetSyncRate(60, 0)
SetScissor(0, 0, 0, 0)
UseNewDefaultFonts(1)

#insert "Zest.agc"
#insert "ZestImageButton.agc"
#insert "ZestSprite.agc"
#insert "ZestText.agc"
#insert "ZestTouch.agc"

do
	
	ZestSync()
loop
