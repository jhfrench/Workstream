
<!--Reports/pag_deadline_management.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Deadline Management Report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.admin_month" default="#month(now())#">
<cfparam name="attributes.admin_year" default="#year(now())#">
</cfsilent>
<cfinclude template="../common_files/qry_get_subordinates.cfm">
<cfif get_subordinates.recordcount>
	<cfinclude template="act_change_month.cfm">
	<cfinclude template="qry_deadline_management_main.cfm">
	<cfinclude template="qry_deadline_management_sub.cfm">
</cfif>
<cfoutput>
<form name="admin_planning" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="98%">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="008080" section_title="Deadline Management" title_class="HeadTextWhite">
	<tr bgcolor="##5F5F5F">
		<td colspan="2" class="SubHeadTextWhite"><label for="hide_supervisor"><input type="checkbox"<cfif isdefined("attributes.hide_supervisor")> checked="checked"</cfif> name="hide_supervisor" value="1" onclick="javascript:document.admin_planning.submit();" id="hide_supervisor" class="SubHeadTextWhite"> Remove your data</label></td>
	</tr>
<cfif get_subordinates.recordcount>
	<tr>
		<td valign="top">
			<cfinclude template="dsp_deadline_management_chart.cfm">
		</td>
		<td align="center" valign="top" class="SubHeadText">
			<br />
			<cfinclude template="dsp_deadline_management_graph.cfm">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<cfinclude template="dsp_deadline_management_sub.cfm">
		</td>
	</tr>
<cfelse>
	<tr>
		<td align="center" class="Note">
			Your search returned no records.
		</td>
	</tr>
</cfif>
</cfoutput>
</table>
</form>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_employee" field_name="emp_id" fuseaction="Directory.employee_details">

