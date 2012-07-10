
<!--Reports/pag_leader_hours_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.show_details_ind=1>
</cfsilent>
<cfinclude template="qry_leader_hours_by_month.cfm">
<table border="0" cellpadding="0" cellspacing="2" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008080" section_title="Leadership Hours Report for #monthasstring(attributes.month)# #attributes.year#: #Agg_hours_by_week.name#" gutter="false" align="center">
	<tr>
		<td valign="top">
			<cfinclude template="dsp_personal_summary_by_code.cfm">
		</td>
		<td valign="top">
			<cfinclude template="dsp_personal_summary_by_week.cfm">
		</td>
	</tr>
</table>

