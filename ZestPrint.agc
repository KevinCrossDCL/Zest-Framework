
foldstart // ZestPrint Widget

type typeZestPrint
	id as integer
	background as integer
	backgroundColor as integer[4]
	bold as integer
	font as integer
	padding as float[2]
	text as integer
	textColor as integer[4]
	textSize as float
	textString as string
endtype

type typeZestPrintDefaults
	anchor as string
	backgroundColor as integer[4]
	bold as integer
	font as integer
	padding as float[2]
	textColor as integer[4]
	textSize as float
endtype

global zestPrintAccumulatedHeight as float : zestPrintAccumulatedHeight = 0

global zestPrintCollection as typeZestPrint[]
zestPrintCollection.length = -1

global zestPrintDefaults as typeZestPrintDefaults
// DEFAULT SETTINGS
zestPrintDefaults.anchor = "topleft"
zestPrintDefaults.backgroundColor[1] = 0
zestPrintDefaults.backgroundColor[2] = 0
zestPrintDefaults.backgroundColor[3] = 0
zestPrintDefaults.backgroundColor[4] = 180
zestPrintDefaults.bold = 0
zestPrintDefaults.font = 0
zestPrintDefaults.textColor[1] = 255
zestPrintDefaults.textColor[2] = 255
zestPrintDefaults.textColor[3] = 255
zestPrintDefaults.textColor[4] = 255
if (GetVirtualWidth() = 100 and GetVirtualHeight() = 100)
	zestPrintDefaults.padding[1] = 0.4
	zestPrintDefaults.padding[2] = 0.1
	zestPrintDefaults.textSize = 3.4
else
	zestPrintDefaults.padding[1] = 4
	zestPrintDefaults.padding[2] = 1
	zestPrintDefaults.textSize = 34
endif

global zestPrintLineCount as integer : zestPrintLineCount = 0

function ZestPrint(zestText as string, zestWidgetParameters as string)
	local zestPrintID as integer
	
	inc zestPrintLineCount
		
	if (zestPrintLineCount > zestPrintCollection.length)
		zestPrintCollection.length = zestPrintCollection.length + 1
		zestPrintID = zestPrintCollection.length
		zestPrintCollection[zestPrintID].id = zestPrintID
		
		zestPrintCollection[zestPrintID].background = CreateSprite(0)
		zestPrintCollection[zestPrintID].text = CreateText(zestText)
		zestPrintCollection[zestPrintID].textString = zestText
	else
		zestPrintID = zestPrintLineCount - 1
		zestPrintCollection[zestPrintID].textString = zestText
	endif
	
	ZestUpdatePrint(zestPrintID, zestWidgetParameters)
endfunction

function ZestUpdatePrint(zestPrintID as integer, zestWidgetParameters as string)
	ZestSetParametersType(zestWidgetParameters)

	if (zestParameters.backgroundColor[1] > -999999 or zestParameters.backgroundColor[2] > -999999 or zestParameters.backgroundColor[3] > -999999)
		zestPrintCollection[zestPrintID].backgroundColor[1] = zestParameters.backgroundColor[1]
		zestPrintCollection[zestPrintID].backgroundColor[2] = zestParameters.backgroundColor[2]
		zestPrintCollection[zestPrintID].backgroundColor[3] = zestParameters.backgroundColor[3]
	else
		zestPrintCollection[zestPrintID].backgroundColor[1] = zestPrintDefaults.backgroundColor[1]
		zestPrintCollection[zestPrintID].backgroundColor[2] = zestPrintDefaults.backgroundColor[2]
		zestPrintCollection[zestPrintID].backgroundColor[3] = zestPrintDefaults.backgroundColor[3]
	endif
	if (zestParameters.backgroundColor[4] > -999999)
		zestPrintCollection[zestPrintID].backgroundColor[4] = zestParameters.backgroundColor[4]
	else
		zestPrintCollection[zestPrintID].backgroundColor[4] = zestPrintDefaults.backgroundColor[4]
	endif
	if (zestParameters.bold > -999999)
		zestPrintCollection[zestPrintID].bold = zestParameters.bold
	else
		zestPrintCollection[zestPrintID].bold = zestPrintDefaults.bold
	endif
	if (zestParameters.font > -999999)
		zestPrintCollection[zestPrintID].font = zestParameters.font
	else
		zestPrintCollection[zestPrintID].font = zestPrintDefaults.font
	endif
	if (zestParameters.padding[1] > -999999 and zestParameters.padding[2] > -999999)
		zestPrintCollection[zestPrintID].padding[1] = zestParameters.padding[1]
		zestPrintCollection[zestPrintID].padding[2] = zestParameters.padding[2]
	else
		zestPrintCollection[zestPrintID].padding[1] = zestPrintDefaults.padding[1]
		zestPrintCollection[zestPrintID].padding[2] = zestPrintDefaults.padding[2]
	endif
	if (zestParameters.textColor[1] > -999999 or zestParameters.textColor[2] > -999999 or zestParameters.textColor[3] > -999999)
		zestPrintCollection[zestPrintID].textColor[1] = zestParameters.textColor[1]
		zestPrintCollection[zestPrintID].textColor[2] = zestParameters.textColor[2]
		zestPrintCollection[zestPrintID].textColor[3] = zestParameters.textColor[3]
	else
		zestPrintCollection[zestPrintID].textColor[1] = zestPrintDefaults.textColor[1]
		zestPrintCollection[zestPrintID].textColor[2] = zestPrintDefaults.textColor[2]
		zestPrintCollection[zestPrintID].textColor[3] = zestPrintDefaults.textColor[3]
	endif
	if (zestParameters.textColor[4] > -999999)
		zestPrintCollection[zestPrintID].textColor[4] = zestParameters.textColor[4]
	else
		zestPrintCollection[zestPrintID].textColor[4] = zestPrintDefaults.textColor[4]
	endif
	if (zestParameters.textSize > -999999)
		zestPrintCollection[zestPrintID].textSize = zestParameters.textSize
	else
		zestPrintCollection[zestPrintID].textSize = zestPrintDefaults.textSize
	endif
endfunction

function ZestUpdatePrintDefaults(zestWidgetParameters as string)
	ZestSetParametersType(zestWidgetParameters)

	if (zestParameters.backgroundColor[1] > -999999 or zestParameters.backgroundColor[2] > -999999 or zestParameters.backgroundColor[3] > -999999)
		zestPrintDefaults.backgroundColor[1] = zestParameters.backgroundColor[1]
		zestPrintDefaults.backgroundColor[2] = zestParameters.backgroundColor[2]
		zestPrintDefaults.backgroundColor[3] = zestParameters.backgroundColor[3]
	endif
	if (zestParameters.backgroundColor[4] > -999999)
		zestPrintDefaults.backgroundColor[4] = zestParameters.backgroundColor[4]
	endif
	if (zestParameters.bold > -999999)
		zestPrintDefaults.bold = zestParameters.bold
	endif
	if (zestParameters.font > -999999)
		zestPrintDefaults.font = zestParameters.font
	endif
	if (zestParameters.padding[1] > -999999 and zestParameters.padding[2] > -999999)
		zestPrintDefaults.padding[1] = zestParameters.padding[1]
		zestPrintDefaults.padding[2] = zestParameters.padding[2]
	endif
	if (zestParameters.printAnchor <> "")
		zestPrintDefaults.anchor = zestParameters.printAnchor
	endif
	if (zestParameters.textColor[1] > -999999 or zestParameters.textColor[2] > -999999 or zestParameters.textColor[3] > -999999)
		zestPrintDefaults.textColor[1] = zestParameters.textColor[1]
		zestPrintDefaults.textColor[2] = zestParameters.textColor[2]
		zestPrintDefaults.textColor[3] = zestParameters.textColor[3]
	endif
	if (zestParameters.textColor[4] > -999999)
		zestPrintDefaults.textColor[4] = zestParameters.textColor[4]
	endif
	if (zestParameters.textSize > -999999)
		zestPrintDefaults.textSize = zestParameters.textSize
	endif
endfunction

function ZestUpdatePrints()
	local zestForI as integer
	
	zestPrintAccumulatedHeight = 0
	
	if (zestPrintDefaults.anchor = "topleft" or zestPrintDefaults.anchor = "topright")
		for zestForI = 0 to zestPrintCollection.length
			if (zestForI < zestPrintLineCount)
				SetTextString(zestPrintCollection[zestForI].text, zestPrintCollection[zestForI].textString)
				SetTextSize(zestPrintCollection[zestForI].text, zestPrintCollection[zestForI].textSize)
				SetTextBold(zestPrintCollection[zestForI].text, zestPrintCollection[zestForI].bold)
				SetTextFont(zestPrintCollection[zestForI].text,  zestPrintCollection[zestForI].font)
				SetTextDepth(zestPrintCollection[zestForI].text, 0)
		        	SetTextColor(zestPrintCollection[zestForI].text, zestPrintCollection[zestForI].textColor[1], zestPrintCollection[zestForI].textColor[2], zestPrintCollection[zestForI].textColor[3], zestPrintCollection[zestForI].textColor[4])
		        	SetSpriteSize(zestPrintCollection[zestForI].background, GetTextTotalWidth(zestPrintCollection[zestForI].text) + (zestPrintCollection[zestForI].padding[1] * 2.0), GetTextTotalHeight(zestPrintCollection[zestForI].text) + (zestPrintCollection[zestForI].padding[2] * 2.0))
				SetSpriteDepth(zestPrintCollection[zestForI].background, 0)
		        	SetSpriteColor(zestPrintCollection[zestForI].background, zestPrintCollection[zestForI].backgroundColor[1], zestPrintCollection[zestForI].backgroundColor[2], zestPrintCollection[zestForI].backgroundColor[3], zestPrintCollection[zestForI].backgroundColor[4])
				if (zestPrintDefaults.anchor = "topleft")
					SetTextAlignment(zestPrintCollection[zestForI].text, 0)
					SetTextPosition(zestPrintCollection[zestForI].text, 0 + zestPrintCollection[zestForI].padding[1], zestPrintAccumulatedHeight + zestPrintCollection[zestForI].padding[2])
		        		SetSpritePosition(zestPrintCollection[zestForI].background, 0, zestPrintAccumulatedHeight)
		        endif
		        if (zestPrintDefaults.anchor = "topright")
					SetTextAlignment(zestPrintCollection[zestForI].text, 2)
					SetTextPosition(zestPrintCollection[zestForI].text, GetVirtualWidth() - zestPrintCollection[zestForI].padding[1], zestPrintAccumulatedHeight + zestPrintCollection[zestForI].padding[2])
		        		SetSpritePosition(zestPrintCollection[zestForI].background, GetVirtualWidth() - GetTextTotalWidth(zestPrintCollection[zestForI].text) - (zestPrintCollection[zestForI].padding[1] * 2.0), zestPrintAccumulatedHeight)
		        endif
		        zestPrintAccumulatedHeight = zestPrintAccumulatedHeight + GetTextTotalHeight(zestPrintCollection[zestForI].text) + (zestPrintCollection[zestForI].padding[2] * 2.0)
	        	else
	        		SetTextColorAlpha(zestPrintCollection[zestForI].text, 0)
	        		SetSpriteColorAlpha(zestPrintCollection[zestForI].background, 0)
	        	endif
	    next
    endif
    if (zestPrintDefaults.anchor = "bottomleft" or zestPrintDefaults.anchor = "bottomright")
		for zestForI = zestPrintCollection.length to 0 step -1
			if (zestForI < zestPrintLineCount)
				zestPrintAccumulatedHeight = zestPrintAccumulatedHeight + GetTextTotalHeight(zestPrintCollection[zestForI].text) + (zestPrintCollection[zestForI].padding[2] * 2.0)
				SetTextString(zestPrintCollection[zestForI].text, zestPrintCollection[zestForI].textString)
				SetTextSize(zestPrintCollection[zestForI].text, zestPrintCollection[zestForI].textSize)
				SetTextBold(zestPrintCollection[zestForI].text, zestPrintCollection[zestForI].bold)
				SetTextFont(zestPrintCollection[zestForI].text,  zestPrintCollection[zestForI].font)
				SetTextDepth(zestPrintCollection[zestForI].text, 0)
		        	SetTextColor(zestPrintCollection[zestForI].text, zestPrintCollection[zestForI].textColor[1], zestPrintCollection[zestForI].textColor[2], zestPrintCollection[zestForI].textColor[3], zestPrintCollection[zestForI].textColor[4])
		        	SetSpriteSize(zestPrintCollection[zestForI].background, GetTextTotalWidth(zestPrintCollection[zestForI].text) + (zestPrintCollection[zestForI].padding[1] * 2.0), GetTextTotalHeight(zestPrintCollection[zestForI].text) + (zestPrintCollection[zestForI].padding[2] * 2.0))
				SetSpriteDepth(zestPrintCollection[zestForI].background, 0)
		        	SetSpriteColor(zestPrintCollection[zestForI].background, zestPrintCollection[zestForI].backgroundColor[1], zestPrintCollection[zestForI].backgroundColor[2], zestPrintCollection[zestForI].backgroundColor[3], zestPrintCollection[zestForI].backgroundColor[4])
				if (zestPrintDefaults.anchor = "bottomleft")
					SetTextAlignment(zestPrintCollection[zestForI].text, 0)
					SetTextPosition(zestPrintCollection[zestForI].text, 0 + zestPrintCollection[zestForI].padding[1], GetVirtualHeight() - zestPrintAccumulatedHeight + zestPrintCollection[zestForI].padding[2])
		        		SetSpritePosition(zestPrintCollection[zestForI].background, 0, GetVirtualHeight() - zestPrintAccumulatedHeight)
		        endif
		        if (zestPrintDefaults.anchor = "bottomright")
					SetTextAlignment(zestPrintCollection[zestForI].text, 2)
					SetTextPosition(zestPrintCollection[zestForI].text, GetVirtualWidth() - zestPrintCollection[zestForI].padding[1],  GetVirtualHeight() - zestPrintAccumulatedHeight + zestPrintCollection[zestForI].padding[2])
		        		SetSpritePosition(zestPrintCollection[zestForI].background, GetVirtualWidth() - GetTextTotalWidth(zestPrintCollection[zestForI].text) - (zestPrintCollection[zestForI].padding[1] * 2.0), GetVirtualHeight() - zestPrintAccumulatedHeight)
		        endif
	        	else
	        		SetTextColorAlpha(zestPrintCollection[zestForI].text, 0)
	        		SetSpriteColorAlpha(zestPrintCollection[zestForI].background, 0)
	        	endif
	    next
    endif
    
	zestPrintLineCount = 0
	zestPrintAccumulatedHeight = 0
endfunction

foldend
