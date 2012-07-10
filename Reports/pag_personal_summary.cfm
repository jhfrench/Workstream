
<!--Reports/pag_personal_summary.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project and week.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.month" default="#month(now())#">
<cfparam name="attributes.year" default="#year(now())#">
<cfparam name="attributes.emp_id" default="#session.user_account_id#">
</cfsilent>
<cfset variables.show_details_ind=0>
<cfinclude template="qry_leader_hours_by_month.cfm">
<table border="0" cellpadding="0" cellspacing="2" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008080" section_title="Personal Hours Report for #monthasstring(attributes.month)# #attributes.year#" gutter="false" align="center">
	<tr>
		<td valign="top">
			<cfinclude template="dsp_personal_summary_by_code.cfm">
		</td>
		<td valign="top">
			<cfinclude template="dsp_personal_summary_by_week.cfm">
		</td>
	</tr>
</table>

