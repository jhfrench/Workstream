
<!--Reports/pag_Mgr_Indiv_Hours_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the manager individual hours report input page.

	||
	Edits:
	$Log$
	||
	
	END FUSEDOC --->
<cfparam name="attributes.all_employees" default="1">
</cfsilent>
<cfoutput>
<cfform action="index.cfm?fuseaction=Reports.Manager_individual_hours" name="ind_hours">
<table border="0" cellpadding="2" cellspacing="0" align="center" width="40%">
<tr>
	<td>
		<cfmodule template="dsp_from_through_date_no_form.cfm" report_name="Manager Individual Hours Report" required="yes" form_name="ind_hours">
	</td>
</tr>
<tr>
	<td align="center" valign="top">
		Name:
		<cfmodule template="../common_files/dsp_team_select.cfm" all_employees="#attributes.all_employees#" onchange="">
	</td>
</tr>
<tr>
	<td align="center" valign="top">
		<input type="submit" value="Enter Dates">
	</td>
</tr>
</table>
</cfform>
</cfoutput>