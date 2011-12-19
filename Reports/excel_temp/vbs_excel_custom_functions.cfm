
<!-- Reports\excel_temp\vbs_excel_custom_functions.cfm
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
	Revision 1.1  2005/03/09 18:10:11  stetzer
	<>

	Revision 1.1  2001-10-11 13:06:05-04  long
	Added FuseDoc

	||
	Variables:
	
	END FUSEDOC --->
</cfsilent><!--- vbs_excel_custom_functions.cfm --->
Function FillFormatCell(sheet,cRange,cText,cWidth,rHeight,fSize)
	With sheet.Range(cRange)
		
		<!--- I'm checking the values to verify the user wants to change the value --->
		If (cWidth <> 0) Then
			.ColumnWidth = cWidth 							
		End If

		.Value = cText 			
		
		If (fSize <> 0) Then
			.Font.Size = fSize 		
		End If
		
		If (rHeight <> 0) Then
			.RowHeight = rHeight 	
		End If
		
	End With
End Function

Function format_cell_borders(sheet,cell_range,borderNum,color,weight,style,fSize,bgColor)

	sheet.Range(cell_range).Borders.Item(borderNum).Weight = weight
	sheet.Range(cell_range).Borders.Item(borderNum).LineStyle = style
	sheet.Range(cell_range).Borders.Item(borderNum).ColorIndex = color
	sheet.Range(cell_range).Interior.ColorIndex = bgColor
	sheet.Range(cell_range).Font.Size = fSize
	<!--- Bottom=9, L=7, R=10, top=8, Hor=12, Vert=11 --->
	
End Function