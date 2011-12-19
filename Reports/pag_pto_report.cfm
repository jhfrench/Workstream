
<!--Reports/pag_pto_report.cfm
	Author: Jeromy F  -->
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
	<cfloop query="GetEmpDetails">
		<cfset remaining=GetEmpDetails.Pto_Type_Indicator>
		<cfinclude template="qry_pto_indiv.cfm">
		<cfinclude template="dsp_pto_col_header.cfm">
		<cfinclude template="dsp_pto_indiv_rows.cfm">
	</cfloop>
<cfelse>
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText#session.workstream_text_size#">Name</td>
		<td align="right" class="SubHeadText#session.workstream_text_size#">Starting</td>
		<td align="right" class="SubHeadText#session.workstream_text_size#">Used PTO</td>
		<td align="right" class="SubHeadText#session.workstream_text_size#">Remaining Hours</td>
	</tr>
</cfoutput>
<cfoutput query="GetEmpDetails">
	<tr<cfif (currentrow MOD 1)> bgcolor="##E1E1E1"</cfif>>
		<td class="RegText#session.workstream_text_size#"><a href="javascript:drill_down('#pin#');">#name# #lname#</a></td>
		<td align="right" class="RegText#session.workstream_text_size#"><a href="javascript:drill_down('#pin#');">#pto_type_indicator#</a></td>
		<td align="right" class="RegText#session.workstream_text_size#"><a href="javascript:drill_down('#pin#');">#used_hours#</a></td>
		<td align="right" class="RegText#session.workstream_text_size#"><cfset temp_var=Pto_Type_Indicator-Used_hours><a href="javascript:drill_down('#pin#');">#temp_var#</a></td>
	</tr>
</cfoutput>
</cfif>
</table>

