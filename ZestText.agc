
foldstart // ZestText Widget

type typeZestText
	id as integer
	shadow as integer
	shadowOffset as float[2]
	shadowText as integer
	text as integer
endtype

global zestTextCollection as typeZestText[]
zestTextCollection.length = 1

function ZestCreateText(zestWidgetParameters as string)
	local zestTextID as integer
	
	zestTextCollection.length = zestTextCollection.length + 1
	zestTextID = zestTextCollection.length
	zestTextCollection[zestTextID].id = zestTextID

	zestCreatedWidgets.insert(ZestAddCreatedWidget(zestTextID, "Text"))
	
	// DEFAULT SETTINGS
	zestTextCollection[zestTextID].shadow = 0
	zestTextCollection[zestTextID].shadowOffset[1] = 0
	zestTextCollection[zestTextID].shadowOffset[2] = 0
	
	zestTextCollection[zestTextID].shadowText = CreateText("")
	SetTextColorAlpha(zestTextCollection[zestTextID].shadowText, 0)
	zestTextCollection[zestTextID].text = CreateText("")

	if (zestWidgetParameters <> "") then ZestUpdateText(zestTextID, zestWidgetParameters)
endfunction zestTextID

function ZestDeleteText(zestTextID as integer)
	DeleteText(zestTextCollection[zestTextID].shadowText)
	DeleteText(zestTextCollection[zestTextID].text)
endfunction

function ZestGetTextHeight(zestTextID as integer)
	local zestTextHeight as float
	
	zestTextHeight = GetTextTotalHeight(zestTextCollection[zestTextID].text)
endfunction zestTextHeight

function ZestGetTextWidth(zestTextID as integer)
	local zestTextWidth as float
	
	zestTextWidth = GetTextTotalWidth(zestTextCollection[zestTextID].text)
endfunction zestTextWidth

function ZestGetTextX(zestTextID as integer)
	local zestTextX as float
	
	zestTextX = GetTextX(zestTextCollection[zestTextID].text)
endfunction zestTextX

function ZestGetTextY(zestTextID as integer)
	local zestTextY as float
	
	zestTextY = GetTextY(zestTextCollection[zestTextID].text)
endfunction zestTextY

function ZestPinTextToBottomCenterOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinTextToBottomCentreOfSprite(zestTextA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinTextToBottomCentreOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetTextExists(zestTextCollection[zestTextA].text) and GetSpriteExists(zestSpriteB))
		SetTextPosition(zestTextCollection[zestTextA].text, GetSpriteX(zestSpriteB) + (GetSpriteWidth(zestSpriteB) / 2.0) + zestOffsetX, ((GetSpriteY(zestSpriteB) + GetSpriteHeight(zestSpriteB)) - GetTextTotalHeight(zestTextCollection[zestTextA].text)) + zestOffsetY)
		SetTextAlignment(zestTextCollection[zestTextA].shadowText, 1)
		SetTextAlignment(zestTextCollection[zestTextA].text, 1)
		ZestUpdateTextShadow(zestTextA)
	endif
endfunction

function ZestPinTextToBottomLeftOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetTextExists(zestTextCollection[zestTextA].text) and GetSpriteExists(zestSpriteB))
		SetTextPosition(zestTextCollection[zestTextA].text, GetSpriteX(zestSpriteB) + zestOffsetX, ((GetSpriteY(zestSpriteB) + GetSpriteHeight(zestSpriteB)) - GetTextTotalHeight(zestTextCollection[zestTextA].text)) + zestOffsetY)
		SetTextAlignment(zestTextCollection[zestTextA].shadowText, 0)
		SetTextAlignment(zestTextCollection[zestTextA].text, 0)
		ZestUpdateTextShadow(zestTextA)
	endif
endfunction

function ZestPinTextToBottomRightOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetTextExists(zestTextCollection[zestTextA].text) and GetSpriteExists(zestSpriteB))
		SetTextPosition(zestTextCollection[zestTextA].text, GetSpriteX(zestSpriteB) + GetSpriteWidth(zestSpriteB) + zestOffsetX, ((GetSpriteY(zestSpriteB) + GetSpriteHeight(zestSpriteB)) - GetTextTotalHeight(zestTextCollection[zestTextA].text)) + zestOffsetY)
		SetTextAlignment(zestTextCollection[zestTextA].shadowText, 2)
		SetTextAlignment(zestTextCollection[zestTextA].text, 2)
		ZestUpdateTextShadow(zestTextA)
	endif
endfunction

function ZestPinTextToCenterLeftOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinTextToCentreLeftOfSprite(zestTextA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinTextToCenterOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinTextToCentreOfSprite(zestTextA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinTextToCenterRightOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinTextToCentreRightOfSprite(zestTextA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinTextToCentreLeftOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetTextExists(zestTextCollection[zestTextA].text) and GetSpriteExists(zestSpriteB))
		SetTextPosition(zestTextCollection[zestTextA].text, GetSpriteX(zestSpriteB) + zestOffsetX, ((GetSpriteY(zestSpriteB) + (GetSpriteHeight(zestSpriteB) / 2.0)) - (GetTextTotalHeight(zestTextCollection[zestTextA].text) / 2.0)) + zestOffsetY)
		SetTextAlignment(zestTextCollection[zestTextA].shadowText, 0)
		SetTextAlignment(zestTextCollection[zestTextA].text, 0)
		ZestUpdateTextShadow(zestTextA)
	endif
endfunction

function ZestPinTextToCentreOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetTextExists(zestTextCollection[zestTextA].text) and GetSpriteExists(zestSpriteB))
		SetTextPosition(zestTextCollection[zestTextA].text, GetSpriteX(zestSpriteB) + (GetSpriteWidth(zestSpriteB) / 2.0) + zestOffsetX, ((GetSpriteY(zestSpriteB) + (GetSpriteHeight(zestSpriteB) / 2.0)) - (GetTextTotalHeight(zestTextCollection[zestTextA].text) / 2.0)) + zestOffsetY)
		SetTextAlignment(zestTextCollection[zestTextA].text, 1)
		ZestUpdateTextShadow(zestTextA)
	endif
endfunction

function ZestPinTextToCentreRightOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetTextExists(zestTextCollection[zestTextA].text) and GetSpriteExists(zestSpriteB))
		SetTextPosition(zestTextCollection[zestTextA].text, GetSpriteX(zestSpriteB) + GetSpriteWidth(zestSpriteB) + zestOffsetX, ((GetSpriteY(zestSpriteB) + (GetSpriteHeight(zestSpriteB) / 2.0)) - (GetTextTotalHeight(zestTextCollection[zestTextA].text) / 2.0)) + zestOffsetY)
		SetTextAlignment(zestTextCollection[zestTextA].shadowText, 2)
		SetTextAlignment(zestTextCollection[zestTextA].text, 2)
		ZestUpdateTextShadow(zestTextA)
	endif
endfunction

function ZestPinTextToTopCenterOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	ZestPinTextToTopCentreOfSprite(zestTextA, zestSpriteB, zestOffsetX, zestOffsetY)
endfunction

function ZestPinTextToTopCentreOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetTextExists(zestTextCollection[zestTextA].text) and GetSpriteExists(zestSpriteB))
		SetTextPosition(zestTextCollection[zestTextA].text, GetSpriteX(zestSpriteB) + (GetSpriteWidth(zestSpriteB) / 2.0) + zestOffsetX, GetSpriteY(zestSpriteB) + zestOffsetY)
		SetTextAlignment(zestTextCollection[zestTextA].shadowText, 1)
		SetTextAlignment(zestTextCollection[zestTextA].text, 1)
		ZestUpdateTextShadow(zestTextA)
	endif
endfunction

function ZestPinTextToTopLeftOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetTextExists(zestTextCollection[zestTextA].text) and GetSpriteExists(zestSpriteB))
		SetTextPosition(zestTextCollection[zestTextA].text, GetSpriteX(zestSpriteB) + zestOffsetX, GetSpriteY(zestSpriteB) + zestOffsetY)
		SetTextAlignment(zestTextCollection[zestTextA].shadowText, 0)
		SetTextAlignment(zestTextCollection[zestTextA].text, 0)
		ZestUpdateTextShadow(zestTextA)
	endif
endfunction

function ZestPinTextToTopRightOfSprite(zestTextA as integer, zestSpriteB as integer, zestOffsetX as float, zestOffsetY as float)
	if (GetTextExists(zestTextCollection[zestTextA].text) and GetSpriteExists(zestSpriteB))
		SetTextPosition(zestTextCollection[zestTextA].text, GetSpriteX(zestSpriteB) + GetSpriteWidth(zestSpriteB) + zestOffsetX, GetSpriteY(zestSpriteB) + zestOffsetY)
		SetTextAlignment(zestTextCollection[zestTextA].shadowText, 2)
		SetTextAlignment(zestTextCollection[zestTextA].text, 2)
		ZestUpdateTextShadow(zestTextA)
	endif
endfunction

function ZestUpdateText(zestTextID as integer, zestWidgetParameters as string)
	ZestSetParametersType(zestWidgetParameters)

	if (GetTextExists(zestTextCollection[zestTextID].text))
		if (zestParameters.alignment > -999999)
			SetTextAlignment(zestTextCollection[zestTextID].shadowText, zestParameters.alignment)
			SetTextAlignment(zestTextCollection[zestTextID].text, zestParameters.alignment)
		endif
		if (zestParameters.angle > -999999)
			SetTextAngle(zestTextCollection[zestTextID].shadowText, zestParameters.angle)
			SetTextAngle(zestTextCollection[zestTextID].text, zestParameters.angle)
		endif
		if (zestParameters.bold > -999999)
			SetTextBold(zestTextCollection[zestTextID].shadowText, zestParameters.bold)
			SetTextBold(zestTextCollection[zestTextID].text, zestParameters.bold)
		endif
		if (zestParameters.color[1] > -999999 or zestParameters.color[2] > -999999 or zestParameters.color[3] > -999999)
			SetTextColor(zestTextCollection[zestTextID].text, zestParameters.color[1], zestParameters.color[2], zestParameters.color[3], GetTextColorAlpha(zestTextCollection[zestTextID].text))
		endif
		if (zestParameters.color[4] > -999999)
			SetTextColorAlpha(zestTextCollection[zestTextID].text, zestParameters.color[4])
		endif
		if (zestParameters.depth > -999999)
			SetTextDepth(zestTextCollection[zestTextID].shadowText, zestParameters.depth)
			SetTextDepth(zestTextCollection[zestTextID].text, zestParameters.depth)
		endif
		if (zestParameters.fixToScreen = 1)
			FixTextToScreen(zestTextCollection[zestTextID].shadowText, 1)
			FixTextToScreen(zestTextCollection[zestTextID].text, 1)
		endif
		if (zestParameters.font > -999999)
			SetTextFont(zestTextCollection[zestTextID].shadowText, zestParameters.font)
			SetTextFont(zestTextCollection[zestTextID].text, zestParameters.font)
		endif
		if (zestParameters.position[1] > -999999 and zestParameters.position[2] > -999999)
			SetTextPosition(zestTextCollection[zestTextID].text, zestParameters.position[1], zestParameters.position[2])
		elseif (zestParameters.position[1] > -999999 and zestParameters.position[2] = -999999)
			SetTextPosition(zestTextCollection[zestTextID].text, zestParameters.position[1], GetTextY(zestTextCollection[zestTextID].text))
		elseif (zestParameters.position[1] = -999999 and zestParameters.position[2] > -999999)
			SetTextPosition(zestTextCollection[zestTextID].text, GetTextX(zestTextCollection[zestTextID].text), zestParameters.position[2])
		endif
		if (zestParameters.shadow > -999999)
			zestTextCollection[zestTextID].shadow = zestParameters.shadow
		endif
		if (zestParameters.shadowColor[1] > -999999 or zestParameters.shadowColor[2] > -999999 or zestParameters.shadowColor[3] > -999999)
			SetTextColor(zestTextCollection[zestTextID].shadowText, zestParameters.shadowColor[1], zestParameters.shadowColor[2], zestParameters.shadowColor[3], GetTextColorAlpha(zestTextCollection[zestTextID].shadowText))
		endif
		if (zestParameters.shadowColor[4] > -999999)
			SetTextColorAlpha(zestTextCollection[zestTextID].shadowText, zestParameters.shadowColor[4])
		endif
		
		if (zestParameters.shadowOffsetTopLeft = 1)
			zestTextCollection[zestTextID].shadowOffset[1] = 0
			zestTextCollection[zestTextID].shadowOffset[2] = 0
		elseif (zestParameters.shadowOffsetTopCenter = 1)
			zestTextCollection[zestTextID].shadowOffset[1] = GetTextTotalWidth(zestTextCollection[zestTextID].text) / 2.0
			zestTextCollection[zestTextID].shadowOffset[2] = 0
		elseif (zestParameters.shadowOffsetTopRight = 1)
			zestTextCollection[zestTextID].shadowOffset[1] = GetTextTotalWidth(zestTextCollection[zestTextID].text)
			zestTextCollection[zestTextID].shadowOffset[2] = 0
		elseif (zestParameters.shadowOffsetCenterLeft = 1)
			zestTextCollection[zestTextID].shadowOffset[1] = 0
			zestTextCollection[zestTextID].shadowOffset[2] = GetTextTotalHeight(zestTextCollection[zestTextID].text) / 2.0
		elseif (zestParameters.shadowOffsetCenter = 1)
			zestTextCollection[zestTextID].shadowOffset[1] = GetTextTotalWidth(zestTextCollection[zestTextID].text) / 2.0
			zestTextCollection[zestTextID].shadowOffset[2] = GetTextTotalHeight(zestTextCollection[zestTextID].text) / 2.0
		elseif (zestParameters.shadowOffsetCenterRight = 1)
			zestTextCollection[zestTextID].shadowOffset[1] = GetTextTotalWidth(zestTextCollection[zestTextID].text)
			zestTextCollection[zestTextID].shadowOffset[2] = GetTextTotalHeight(zestTextCollection[zestTextID].text) / 2.0
		elseif (zestParameters.shadowOffsetBottomLeft = 1)
			zestTextCollection[zestTextID].shadowOffset[1] = 0
			zestTextCollection[zestTextID].shadowOffset[2] = GetTextTotalHeight(zestTextCollection[zestTextID].text)
		elseif (zestParameters.shadowOffsetBottomCenter = 1)
			zestTextCollection[zestTextID].shadowOffset[1] = GetTextTotalWidth(zestTextCollection[zestTextID].text) / 2.0
			zestTextCollection[zestTextID].shadowOffset[2] = GetTextTotalHeight(zestTextCollection[zestTextID].text)
		elseif (zestParameters.shadowOffsetBottomRight = 1)
			zestTextCollection[zestTextID].shadowOffset[1] = GetTextTotalWidth(zestTextCollection[zestTextID].text)
			zestTextCollection[zestTextID].shadowOffset[2] = GetTextTotalHeight(zestTextCollection[zestTextID].text)
		else
			if (zestParameters.shadowOffset[1] > -999999 or zestParameters.shadowOffset[2] > -999999)
				zestTextCollection[zestTextID].shadowOffset[1] = zestParameters.shadowOffset[1]
				zestTextCollection[zestTextID].shadowOffset[2] = zestParameters.shadowOffset[2]
			endif
		endif
		if (zestParameters.size[1] > -999999)
			SetTextSize(zestTextCollection[zestTextID].shadowText, zestParameters.size[1])
			SetTextSize(zestTextCollection[zestTextID].text, zestParameters.size[1])
		endif
		if (zestParameters.text <> "")
			if (lower(zestParameters.text) = "null") then zestParameters.text = ""
			SetTextString(zestTextCollection[zestTextID].shadowText, zestParameters.text)
			SetTextString(zestTextCollection[zestTextID].text, zestParameters.text)
		endif
		
		ZestUpdateTextShadow(zestTextID)
	endif
endfunction

function ZestUpdateTextShadow(zestTextID as integer)
	
	SetTextPosition(zestTextCollection[zestTextID].shadowText, GetTextX(zestTextCollection[zestTextID].text) + zestTextCollection[zestTextID].shadowOffset[1], GetTextY(zestTextCollection[zestTextID].text) + zestTextCollection[zestTextID].shadowOffset[2])
endfunction

function ZestWrapText(zestText as string, zestSize as float, zestMaxWidth as float)
	local zestFinalText as string
	local zestForI as integer
	local zestLength as integer
	local zestSpace as integer
	local zestTmpText as integer
	local zestTmpText2 as integer
	
	zestTmpText = CreateText(zestText)
	SetTextSize(zestTmpText, zestSize)
	SetTextPosition(zestTmpText, -10000, -10000)
	if (GetTextTotalWidth(zestTmpText) >= zestMaxWidth)
		while (GetTextTotalWidth(zestTmpText) >= zestMaxWidth)
			zestLength = len(zestText)
			zestSpace = 0
			for zestForI = 1 to zestLength
				if (mid(zestText, zestForI, 1) = " ") then zestSpace = zestForI
				zestTmpText2 = CreateText(left(zestText, zestForI))
				SetTextSize(zestTmpText2, zestSize)
				SetTextPosition(zestTmpText2, -10000, -10000)
				if (GetTextTotalWidth(zestTmpText2) > zestMaxWidth)
					DeleteText(zestTmpText2)
					exit
				endif
				DeleteText(zestTmpText2)
			next
			zestFinalText = zestFinalText + left(zestText, (zestSpace - 1)) + chr(10)
			zestText = right(zestText, (len(zestText) - zestSpace))
			DeleteText(zestTmpText)
			zestTmpText = CreateText(zestText)
			SetTextSize(zestTmpText, zestSize)
			SetTextPosition(zestTmpText, -10000, -10000)
			if (zestSpace = 0) then exit
		endwhile
		if (len(zestText) > 0) then zestFinalText = zestFinalText + zestText
	else
		zestFinalText = zestText
	endif
	DeleteText(zestTmpText)
endfunction zestFinalText

foldend
