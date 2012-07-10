
<!--- Reports/dsp_employee_info_report_excel_formatting.cfm
	Author: Joshua Peters  --->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the report formatting displayed in the HR excel report.
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
assign_sheet.Columns("A:AZ").EntireColumn.AutoFit

With wb.ActiveSheet.PageSetup
        .LeftMargin = .75
        .RightMargin = .75
        .TopMargin = 1
        .BottomMargin = 1
        .HeaderMargin = .5
        .FooterMargin = .5
        .Orientation = 2
        .Zoom = 100
		.PrintTitleRows = "$1:$1"
		.CenterFooter = "&P"		
End With

	