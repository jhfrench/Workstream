
<!-- Reports\act_set_excel_print_format.cfm
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

<!--- act_set_excel_print_format.cfm --->

With assign_sheet
	.PageSetup.Orientation = xlsLandscaped
	.PageSetup.LeftMargin = 1
	.PageSetup.RightMargin = 1
	.PageSetup.TopMargin = 1
	.PageSetup.PrintTitleRows = "A8:H8"
	.PageSetup.CenterFooter = "&P"
End With
