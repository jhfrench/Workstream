
<!-- Reports\excel_temp\excel_constants.cfm
	Author: Josh P-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Name: Josh Peters
	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
</cfsilent>Const xlsLandscaped = 2
Const xlsPortrait = 1

Const xlBox = 0
Const xlPyramidToPoint = 1
Const xlPyramidToMax = 2
Const xlCylinder = 3
Const xlConeToPoint = 4
Const xlConeToMax = 5

Const xlColumnClustered = 51
Const xlColumnStacked = 52
Const xlColumnStacked100 = 53
Const xl3DColumnClustered = 54
Const xl3DColumnStacked = 55
Const xl3DColumnStacked100 = 56
Const xl3DColumn = -4100

Const xlBarClustered = 57
Const xlBarStacked = 58
Const xlBarStacked100 = 59
Const xl3DBarClustered = 60
Const xl3DBarStacked = 61
Const xl3DBarStacked100 = 62

Const xlLine = 4
Const xlLineStacked = 63  
Const xlLineStacked100 = 64  
Const xlLineMarkers = 65
Const xlLineMarkersStacked = 66 
Const xlLineMarkersStacked100 = 67 
Const xl3DLine = -4101
  
Const xlPie = 5
Const xlPieOfPie = 68
Const xlPieExploded = 69
Const xl3DPie = -4102
Const xl3DPieExploded = 70
Const xlBarOfPie = 71

Const xlXYScatter = -4169
Const xlXYScatterSmooth = 72
Const xlXYScatterSmoothNoMarkers = 73
Const xlXYScatterLines = 74
Const xlXYScatterLinesNoMarkers = 75
  
Const xlAreaStacked = 76
Const xlAreaStacked100 = 77
Const xl3DAreaStacked = 78
Const xl3DAreaStacked100 = 79

Const xlArea = 1
Const xl3DArea = -4098

Const xlDoughnutExploded = 80
Const xlDoughnut = -4120
Const xlRadarMarkers = 81
Const xlRadarFilled = 82
Const xlRadar = -4151
  
Const xlSurface = 83
Const xlSurfaceWireFrame = 84
Const xlSurfaceTopView = 85
Const xlSurfaceTopViewWireFrame = 86

Const xlBubble = 15
Const xlBubble3DEffect = 87

Const xlStockHLC = 88
Const xlStockOHLC = 89
Const xlStockVHLC = 90
Const xlStockVOHLC = 91
  
Const xlCylinderColClustered = 92
Const xlCylinderColStacked = 93
Const xlCylinderColStacked100 = 94
Const xlCylinderBarClustered = 95
Const xlCylinderBarStacked = 96
Const xlCylinderBarStacked100 = 97
Const xlCylinderCol = 98
  
Const xlConeColClustered = 99
Const xlConeColStacked = 100
Const xlConeColStacked100 = 101
Const xlConeBarClustered = 102
Const xlConeBarStacked = 103
Const xlConeBarStacked100 = 104
  
Const xlConeCol = 105
Const xlPyramidColClustered = 106
Const xlPyramidColStacked = 107
Const xlPyramidColStacked100 = 108
Const xlPyramidBarClustered = 109
Const xlPyramidBarStacked = 110
Const xlPyramidBarStacked100 = 111
Const xlPyramidCol = 112

Const  msoGradientEarlySunset = 1
Const  msoGradientLateSunset = 2
Const  msoGradientNightfall = 3
Const  msoGradientDaybreak = 4
Const  msoGradientHorizon = 5
Const  msoGradientDesert = 6
Const  msoGradientOcean = 7
Const  msoGradientCalmWater = 8
Const  msoGradientFire = 9
Const  msoGradientFog = 10
Const  msoGradientMoss = 11
Const  msoGradientPeacock = 12
Const  msoGradientWheat = 13
Const  msoGradientParchment = 14
Const  msoGradientMahogany = 15
Const  msoGradientRainbow = 16
Const  msoGradientRainbowII = 17
Const  msoGradientGold = 18
Const  msoGradientGoldII = 19
Const  msoGradientBrass = 20
Const  msoGradientChrome = 21
Const  msoGradientChromeII = 22
Const  msoGradientSilver = 23
Const  msoGradientSapphire = 24
Const  msoPresetGradientMixed = -2

<!------------------------->
<!------------------------->
<!------------------------->
<!----- FORMATTING CONSTANTS --->
<!--- ' Constants for Horizontal Alignment --->

Const hAlign_General = 1
Const hAlign_Left = 2
Const hAlign_Center = 3
Const hAlign_Right = 4
Const hAlign_Fill = 5
Const hAlign_Justify = 6
Const hAlign_CenterAcross = 7

<!--- ' Constants for Vertical Alignment --->

Const vAlign_Top = 1
Const vAlign_Center = 2
Const vAlign_Bottom = 3
Const vAlign_Justify = 4

<!--- ' Constants for Borders.Weight --->

Const borderWeight_none = 0
Const borderWeight_dashed = 1
Const borderWeight_solid = 2
Const borderWeight_bold = 3

<!--- ' Constants for Borders.LineStyle --->

Const borderLine_none = 0
Const borderLine_solid = 1  
Const borderLine_dots = 2  
Const borderLine_sDashes = 3
Const borderLine_lsDashes = 4 
Const borderLine_lssslDashes = 5 
Const borderLine_bilsDashes = 6
Const borderLine_Dashes = 8
Const borderLine_dblLines = 9
Const borderLine_lDashes = 12
  
<!--- ' Constants for Font --->

Const font_bold_on = true
Const font_bold_off = false

<!--- ' Constants for Cell Formatting --->

Const wrap_text_on = true
Const wrap_text_off = false

<!--- ' Constants for Interior.ColorIndex --->

Const color_none = 0
Const color_black = 1
Const color_white = 2
Const color_red = 3
Const color_green = 4
Const color_blue = 5
Const color_yellow = 6
Const color_magenta = 7
Const color_aqua = 8
Const color_maroon = 9
Const color_olive = 10
Const color_dark_blue = 11
Const color_brown = 12
Const color_plum = 13
Const color_teal = 14
Const color_light_gray = 15
Const color_gray = 16
Const color_lilac = 17
Const color_deep_rose = 18
Const color_cream = 19
Const color_light_blue = 20
Const color_dark_purple = 21
Const color_coral = 22
Const color_periwinkle = 23
Const color_light_purple = 24
Const color_navy = 25
Const color_pink = 26
Const color_gold = 27
Const color_aqua2 = 28
Const color_dark_plum = 29

<!--- ' Predefined Color Constants --->

<!--- <!--- 'Constant	Value		Description --->
'----------------------------------
'vbBlack	&h00		Black
'vbRed		&hFF		Red
'vbGreen	&hFF00		Green
'vbYellow	&hFFFF		Yellow
'vbBlue		&hFF0000	Blue
'vbMagenta	&hFF00FF	Magenta
'vbCyan		&hFFFF00	Cyan
'vbWhite	&hFFFFFF	White --->
