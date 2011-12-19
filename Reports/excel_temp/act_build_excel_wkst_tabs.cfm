
<!-- Reports\excel_temp\act_build_excel_wkst_tabs.cfm
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
	Revision 1.1  2005/03/09 18:09:58  stetzer
	<>

	Revision 1.1  2001-10-11 13:02:48-04  long
	Added FuseDoc

	||
	Variables:
	
	END FUSEDOC --->
</cfsilent>
<!--- act_excel_add_wksts_template.cfm --->

<cfif tab_names_list is not "">
<cfoutput>

	<!--- GET NUMBER OF NEEDED WORKSHEETS --->
	<cfset num_of_tabs = "#ListLen(tab_names_list ,",")#">	
	<cfset delete_start_tab = num_of_tabs + 1>
	<cfset num_of_tabs = (num_of_tabs - 3)><!--- SUBTRACT 3 TO ACCOUNT FOR THE 3 DEFAULT WKSTS --->
	
	<!--- ADD TABS IF WE NEED MORE THAN 3 --->
	<cfif num_of_tabs GT 0>	
		<cfloop index="sheetid" from="1" to="#num_of_tabs#">
		 	MyExcelChart.Sheets.Add
		</cfloop>		
	</cfif>
	
</cfoutput>
 
<!--- NOW THAT WE HAVE THE CORRECT NUMBER OF TABS, NAME THEM VIA THE LIST PASSED --->	
<CFLOOP INDEX="current_wkst_name" LIST="#tab_names_list#" DELIMITERS=",">
	
	<!--- Loop over the list of names and set the wkst names to the values --->		
	<cfoutput>
		set assign_sheet = MyExcelChart.Sheets(#curr_sheet#)
		assign_sheet.name = "#current_wkst_name#" 
	</cfoutput>

	<!--- Increment to the next sheet --->		
	<cfoutput>
		<cfset curr_sheet = curr_sheet + 1>
	</cfoutput>
	
</CFLOOP>
	


<cfoutput>	
	<!--- Reassign the sheet so vbscript will begin adding code to the very first wkst --->
	<cfset curr_sheet = 1>	
</cfoutput>
</cfif>