
<!--Reports/pag_gross_hours_input_ytd.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the form for the gross hours YTD report input page
	||
	Name: Joshua Peters
	||
	Edits:
	 
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_office_select.cfm">
<cfinclude template="qry_team_select_by_company.cfm">
<cfinclude template="act_gross_hours_ytd_js.cfm">
<cfinclude template="dsp_gross_hours_input_ytd.cfm">
