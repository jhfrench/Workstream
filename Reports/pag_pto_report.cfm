
<!--Reports/pag_pto_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Lewisco Version Of the PTO report

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_pto_hours_report.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" fuseaction="PTO" Function_name="drill_down" Field_name="drill_down">
<table align="center" width="60%" cellpadding="2" cellspacing="0">
<cfif isdefined("attributes.drill_down")>
	<cfinclude template="dsp_pto_report_header.cfm">
	<cfloop query="get_pto_hours_report">
		<cfset remaining=get_pto_hours_report.Pto_Type_Indicator>
		<cfinclude template="qry_pto_indiv.cfm">
		<cfinclude template="dsp_pto_col_header.cfm">
		<cfinclude template="dsp_pto_indiv_rows.cfm">
	</cfloop>
<cfelse>
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText">Name</td>
		<td align="right" class="SubHeadText">Starting</td>
		<td align="right" class="SubHeadText">Used PTO</td>
		<td align="right" class="SubHeadText">Remaining Hours</td>
	</tr>
</cfoutput>
<cfoutput query="get_pto_hours_report">
	<tr<cfif (currentrow MOD 1)> bgcolor="##E1E1E1"</cfif>>
		<td><a href="javascript:drill_down('#emp_id#');">#name# #lname#</a></td>
		<td align="right"><a href="javascript:drill_down('#emp_id#');">#pto_type_indicator#</a></td>
		<td class="RegText number"><a href="javascript:drill_down('#emp_id#');">#used_hours#</a></td>
		<td class="RegText number"><a href="javascript:drill_down('#emp_id#');">#pto_type_indicator-used_hours#</a></td>
	</tr>
</cfoutput>
</cfif>
</table>

