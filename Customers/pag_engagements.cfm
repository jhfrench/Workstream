
<!--Customers/pag_engagements.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view engagements page

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="0">
</cfsilent>
<cfmodule template="../common_files/variable_check.cfm" check_variable="attributes.client_code" relocate="Customers.home"/>
<cfinclude template="qry_get_engagements.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="engagement" fuseaction="Customers.edit_engagement" field_name="project_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="open_tasks" fuseaction="Customers.open_tasks" field_name="project_id">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="90%">
	<cfinclude template="dsp_engagements_row_header.cfm">
	<cfinclude template="dsp_engagements_rows.cfm">
</table>

