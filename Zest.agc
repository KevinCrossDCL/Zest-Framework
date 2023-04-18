/*
 * Zest Framework
 * 
 * Zest which was named by ChatGPT is a light version of the OryUI framework that only manages image buttons, sprites, text, and basic touch tracking.
 * Unlike OryUI, Zest aimed more at game development.
 * Zest is to be used with AGK (AppGameKit)
 * 
 * 	Author	: Kevin Cross
 * 	License	: MIT
 */
 
foldstart

type typeZestCreatedWidgets
	id as integer
	widgetType as string
endtype

type typeZestParameters
	alignment as integer
	angle as float
	bold as integer
	color as float[4]
	depth as integer
	disabledImageID as integer
	enabled as integer
	enabledImageID as integer
	fixToscreen as integer
	font as integer
	group as integer
	hoverImageID as integer
	imageID as integer
	offset as float[2]
	offsetBottomCenter as integer
	offsetBottomLeft as integer
	offsetBottomRight as integer
	offsetCenter as integer
	offsetCenterLeft as integer
	offsetCenterRight as integer
	offsetTopCenter as integer
	offsetTopLeft as integer
	offsetTopRight as integer
	position as float[2]
	shadow as integer
	shadowColor as float[4]
	shadowOffset as float[2]
	shadowOffsetBottomCenter as integer
	shadowOffsetBottomLeft as integer
	shadowOffsetBottomRight as integer
	shadowOffsetCenter as integer
	shadowOffsetCenterLeft as integer
	shadowOffsetCenterRight as integer
	shadowOffsetTopCenter as integer
	shadowOffsetTopLeft as integer
	shadowOffsetTopRight as integer
	size as float[2]
	spriteShader as integer
	text as string
	widget as string
endtype

foldend


foldstart

global zestBlockFlickScroll as integer
global zestBlockScreenScrolling as integer
global zestCreatedWidgets as typeZestCreatedWidgets[]
global zestMaxSyncRate as integer : zestMaxSyncRate = 60.0
global zestParameters as typeZestParameters

foldend


foldstart

function ZestAddCreatedWidget(zestID as integer, zestType as string)
	local zestT as typeZestCreatedWidgets
	
	zestT.widgetType = zestType
	zestT.id = zestID
endfunction zestT

function ZestAddLeadingZeros(zestNumber as string, zestNumberOfZeros as integer)
	local zestForI as integer

	for zestForI = 1 to zestNumberOfZeros
		if (len(zestNumber) < zestNumberOfZeros)
			zestNumber = "0" + zestNumber
		endif
	next
endfunction zestNumber

function ZestConvertBoolean(zestBoolean as string)
	local zestBool as integer
	
	if (lower(zestBoolean) = "true" or lower(zestBoolean) = "y" or lower(zestBoolean) = "yes" or zestBoolean = "1")
		zestBool = 1
	elseif (lower(zestBoolean) = "false" or lower(zestBoolean) = "n" or lower(zestBoolean) = "no" or zestBoolean = "0")
		zestBool = 0
	endif
endfunction zestBool

function ZestConvertColor(zestColor as string)
	local zestCommaCount as integer
	local zestRGBA as float[4] : zestRGBA[1] = 255 : zestRGBA[2] = 255 : zestRGBA[3] = 255 : zestRGBA[4] = 255
	
	zestCommaCount = CountStringTokens(zestColor, ",")
	if (zestCommaCount = 1)
		if (FindString(zestColor, "#") > 0)
			zestColor = ReplaceString(zestColor, "#", "", -1)
			if (len(zestColor) = 3)
				zestRGBA[1] = val(mid(zestColor, 1, 1) + mid(zestColor, 1, 1), 16)
				zestRGBA[2] = val(mid(zestColor, 2, 1) + mid(zestColor, 2, 1), 16)
				zestRGBA[3] = val(mid(zestColor, 3, 1) + mid(zestColor, 3, 1), 16)
			elseif (len(zestColor) = 6)
				zestRGBA[1] = val(mid(zestColor, 1, 2), 16)
				zestRGBA[2] = val(mid(zestColor, 3, 2), 16)
				zestRGBA[3] = val(mid(zestColor, 5, 2), 16)
			endif
		else
			zestRGBA[1] = GetColorRed(val(zestColor))
			zestRGBA[2] = GetColorGreen(val(zestColor))
			zestRGBA[3] = GetColorBlue(val(zestColor))
		endif
	elseif (zestCommaCount >= 3)
		zestRGBA[1] = valFloat(GetStringToken(zestColor, ",", 1))
		zestRGBA[2] = valFloat(GetStringToken(zestColor, ",", 2))
		zestRGBA[3] = valFloat(GetStringToken(zestColor, ",", 3))
		if (zestCommaCount = 4) then zestRGBA[4] = valFloat(GetStringToken(zestColor, ",", 4))
	endif
endfunction zestRGBA

function ZestCreateWidget(zestWidgetParameters as string)
	ZestResetParametersType()

	local zestValue as string
	local zestVariable as string
	local zestWidget as integer
	local zestWidgetEnd as integer
	local zestWidgetParameter as string
	local zestWidgetStart as integer

	zestWidgetStart = FindString(zestWidgetParameters, "widget:", 1, 1)
	zestWidgetEnd = FindString(zestWidgetParameters, ";", 1, zestWidgetStart)
	zestWidgetParameter = Mid(zestWidgetParameters, zestWidgetStart, zestWidgetEnd - zestWidgetStart)
	zestVariable = lower(TrimString(GetStringToken(zestWidgetParameter, ":", 1), " "))
	zestValue = GetStringToken(zestWidgetParameter, ":", 2)
	zestValue = ReplaceString(zestValue, "[colon]", ":", -1)
	zestValue = ReplaceString(zestValue, "[semicolon]", ";", -1)

	if (zestValue = "") then zestValue = "null"
	if (zestVariable = "widget")
		zestParameters.widget = lower(zestValue)
	endif
	
	select zestParameters.widget
		case "imagebutton"
			zestWidget = ZestCreateImageButton(zestWidgetParameters)
		endcase
		case "sprite"
			zestWidget = ZestCreateSprite(zestWidgetParameters)
		endcase
		case "text"
			zestWidget = ZestCreateText(zestWidgetParameters)
		endcase
	endselect
endfunction zestWidget

function ZestDeleteAllWidgets()
	local zestForI as integer
	
	ZestSync()
	for zestForI = 0 to zestCreatedWidgets.length
		select zestCreatedWidgets[zestForI].widgetType
			case "ImageButton"
				ZestDeleteImageButton(zestCreatedWidgets[zestForI].id)
			endcase
			case "Sprite"
				DeleteSprite(zestCreatedWidgets[zestForI].id)
			endcase
			case "Text"
				ZestDeleteText(zestCreatedWidgets[zestForI].id)
			endcase
		endselect
	next
	zestCreatedWidgets.length = -1
endfunction

function ZestLerp(zestMin as float, zestMax as float, zestF as float)
	local zestResult as float
	
	zestResult = zestMin + zestF * (zestMax - zestMin)
endfunction zestResult

function ZestMaxFloat(zestA as float, zestB as float)
	local zestMaxValue as float
	
	if (zestA >= zestB)
		zestMaxValue = zestA
	else
		zestMaxValue = zestB
	endif
endfunction zestMaxValue

function ZestMaxInt(zestA as integer, zestB as integer)
	local zestMaxValue as integer
	
	if (zestA >= zestB)
		zestMaxValue = zestA
	else
		zestMaxValue = zestB
	endif
endfunction zestMaxValue

function ZestMinFloat(zestA as float, zestB as float)
	local zestMinValue as float
	
	if (zestA <= zestB)
		zestMinValue = zestA
	else
		zestMinValue = zestB
	endif
endfunction zestMinValue

function ZestMinInt(zestA as integer, zestB as integer)
	local zestMinValue as integer
	
	if (zestA <= zestB)
		zestMinValue = zestA
	else
		zestMinValue = zestB
	endif
endfunction zestMinValue

function ZestResetParametersType()
	local zestForI as integer
	
	zestParameters.alignment = -999999
	zestParameters.angle = -999999
	zestParameters.bold = -999999
	zestParameters.depth = -999999
	zestParameters.disabledImageID = -999999
	zestParameters.enabled = -999999
	zestParameters.enabledImageID = -999999
	zestParameters.fixToscreen = -999999
	zestParameters.font = -999999
	zestParameters.group = -999999
	zestParameters.hoverImageID = -999999
	zestParameters.imageID = -999999
	zestParameters.offsetBottomCenter = -999999
	zestParameters.offsetBottomLeft = -999999
	zestParameters.offsetBottomRight = -999999
	zestParameters.offsetCenter = -999999
	zestParameters.offsetCenterLeft = -999999
	zestParameters.offsetCenterRight = -999999
	zestParameters.offsetTopCenter = -999999
	zestParameters.offsetTopLeft = -999999
	zestParameters.offsetTopRight = -999999
	zestParameters.shadow = -999999
	zestParameters.shadowOffsetBottomCenter = -999999
	zestParameters.shadowOffsetBottomLeft = -999999
	zestParameters.shadowOffsetBottomRight = -999999
	zestParameters.shadowOffsetCenter = -999999
	zestParameters.shadowOffsetCenterLeft = -999999
	zestParameters.shadowOffsetCenterRight = -999999
	zestParameters.shadowOffsetTopCenter = -999999
	zestParameters.shadowOffsetTopLeft = -999999
	zestParameters.shadowOffsetTopRight = -999999
	zestParameters.spriteShader = -999999
	zestParameters.text = ""
	zestParameters.widget = ""
	for zestForI = 1 to 4
		if (zestForI < 3)
			zestParameters.offset[zestForI] = -999999
			zestParameters.position[zestForI] = -999999
			zestParameters.shadowOffset[zestForI] = -999999
			zestParameters.size[zestForI] = -999999
		endif
		zestParameters.color[zestForI] = -999999
		zestParameters.shadowColor[zestForI] = -999999
	next
endfunction

function ZestSetParametersType(zestWidgetParameters as string)
	ZestResetParametersType()
	
	local zestWidgetParameter as string
	local zestForI as integer
	local zestValue as string
	local zestVariable as string
	
	for zestForI = 1 to CountStringTokens(zestWidgetParameters, ";")
		zestWidgetParameter = GetStringToken(zestWidgetParameters, ";", zestForI)
		zestVariable = lower(TrimString(GetStringToken(zestWidgetParameter, ":", 1), " "))
		zestValue = GetStringToken(zestWidgetParameter, ":", 2)
		zestValue = ReplaceString(zestValue, "[colon]", ":", -1)
		zestValue = ReplaceString(zestValue, "[semicolon]", ";", -1)
		if (zestValue = "") then zestValue = "null"
		if (zestVariable = "alignment")
			if (lower(zestValue) = "left")
				zestParameters.alignment = 0
			elseif (lower(zestValue) = "center" or lower(zestValue) = "centre")
				zestParameters.alignment = 1
			elseif (lower(zestValue) = "right")
				zestParameters.alignment = 2
			endif
		elseif (zestVariable = "alpha")
			zestParameters.color[4] = valFloat(zestValue)
		elseif (zestVariable = "angle")
			zestParameters.angle = valFloat(zestValue)
		elseif (zestVariable = "bold")
			zestParameters.bold = ZestConvertBoolean(zestValue)
		elseif (zestVariable = "color" or zestVariable = "colorid")
			zestParameters.color = ZestConvertColor(zestValue)
		elseif (zestVariable = "depth")
			zestParameters.depth = val(zestValue)
		elseif (zestVariable = "disabledimage")
			zestParameters.disabledImageID = val(zestValue)
		elseif (zestVariable = "enabled")
			zestParameters.enabled = ZestConvertBoolean(zestValue)
		elseif (zestVariable = "enabledimage")
			zestParameters.enabledImageID = val(zestValue)
		elseif (zestVariable = "fixtoscreen")
			zestParameters.fixToScreen = ZestConvertBoolean(zestValue)
		elseif (zestVariable = "font")
			zestParameters.font = val(zestValue)
		elseif (zestVariable = "group")
			zestParameters.group = val(zestValue)
		elseif (zestVariable = "height")
			zestParameters.size[2] = valFloat(zestValue)
		elseif (zestVariable = "hoverimage")
			zestParameters.hoverImageID = val(zestValue)
		elseif (zestVariable = "image")
			zestParameters.imageID = val(zestValue)
		elseif (zestVariable = "offset")
			if (lower(zestValue) = "topleft")
				zestParameters.offsetTopLeft = 1
			elseif (lower(zestValue) = "topcenter" or lower(zestValue) = "topcentre")
				zestParameters.offsetTopCenter = 1
			elseif (lower(zestValue) = "topright")
				zestParameters.offsetTopRight = 1
			elseif (lower(zestValue) = "centerleft" or lower(zestValue) = "centreleft" or lower(zestValue) = "middleleft")
				zestParameters.offsetCenterLeft = 1
			elseif (lower(zestValue) = "center" or lower(zestValue) = "centre" or lower(zestValue) = "middle")
				zestParameters.offsetCenter = 1
			elseif (lower(zestValue) = "centerright" or lower(zestValue) = "centreright" or lower(zestValue) = "middleright")
				zestParameters.offsetCenterRight = 1
			elseif (lower(zestValue) = "bottomleft")
				zestParameters.offsetBottomLeft = 1
			elseif (lower(zestValue) = "bottomcenter" or lower(zestValue) = "bottomcentre")
				zestParameters.offsetBottomCenter = 1
			elseif (lower(zestValue) = "bottomright")
				zestParameters.offsetBottomRight = 1
			else
				zestParameters.offset[1] = valFloat(GetStringToken(zestValue, ",", 1))
				zestParameters.offset[2] = valFloat(GetStringToken(zestValue, ",", 2))
			endif
		elseif (zestVariable = "position")
			zestParameters.position[1] = valFloat(GetStringToken(zestValue, ",", 1))
			zestParameters.position[2] = valFloat(GetStringToken(zestValue, ",", 2))
		elseif (zestVariable = "shadow")
			zestParameters.shadow = ZestConvertBoolean(zestValue)
		elseif (zestVariable = "shadowcolor" or zestVariable = "shadowcolorid")
			zestParameters.shadowColor = ZestConvertColor(zestValue)
		elseif (zestVariable = "shadowoffset")
			if (lower(zestValue) = "topleft")
				zestParameters.shadowOffsetTopLeft = 1
			elseif (lower(zestValue) = "topcenter" or lower(zestValue) = "topcentre")
				zestParameters.shadowOffsetTopCenter = 1
			elseif (lower(zestValue) = "topright")
				zestParameters.shadowOffsetTopRight = 1
			elseif (lower(zestValue) = "centerleft" or lower(zestValue) = "centreleft" or lower(zestValue) = "middleleft")
				zestParameters.shadowOffsetCenterLeft = 1
			elseif (lower(zestValue) = "center" or lower(zestValue) = "centre" or lower(zestValue) = "middle")
				zestParameters.shadowOffsetCenter = 1
			elseif (lower(zestValue) = "centerright" or lower(zestValue) = "centreright" or lower(zestValue) = "middleright")
				zestParameters.shadowOffsetCenterRight = 1
			elseif (lower(zestValue) = "bottomleft")
				zestParameters.shadowOffsetBottomLeft = 1
			elseif (lower(zestValue) = "bottomcenter" or lower(zestValue) = "bottomcentre")
				zestParameters.shadowOffsetBottomCenter = 1
			elseif (lower(zestValue) = "bottomright")
				zestParameters.shadowOffsetBottomRight = 1
			else
				zestParameters.shadowOffset[1] = valFloat(GetStringToken(zestValue, ",", 1))
				zestParameters.shadowOffset[2] = valFloat(GetStringToken(zestValue, ",", 2))
			endif
		elseif (zestVariable = "size")
			zestParameters.size[1] = valFloat(GetStringToken(zestValue, ",", 1))
			zestParameters.size[2] = valFloat(GetStringToken(zestValue, ",", 2))
		elseif (zestVariable = "spriteshader")
			zestParameters.spriteShader = val(zestValue)
		elseif (zestVariable = "text")
			zestParameters.text = zestValue
		elseif (zestVariable = "width")
			zestParameters.size[1] = valFloat(zestValue)
		endif
	next	
endfunction

function ZestSetSyncRate(zestSyncRate as float, zestMode as integer)
	SetSyncRate(zestSyncRate, zestMode)
	zestSyncRate = zestSyncRate
endfunction

function ZestSync()
	ZestEndTrackingTouch()
	UpdateAllTweens(GetFrameTime())
	Sync()
	ZestStartTrackingTouch()
endfunction

foldend
