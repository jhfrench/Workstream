
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
	Revision 1.1  2005/03/09 18:04:04  stetzer
	<>

	Revision 1.1  2001-10-11 12:57:58-04  long
	Added FuseDoc

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
