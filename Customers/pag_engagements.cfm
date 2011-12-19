
<!--Customers/pag_engagements.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view engagements page

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:46:00  daugherty
	Initial revision

	Revision 1.2  2002-04-09 09:51:52-04  french
	Added ability to drill down to list of open tasks for a given engagement.

	Revision 1.1  2001-10-11 10:56:24-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	(KL | 9/14/2001) added logic to make the access to the edit function database driven.
	||
	END FUSEDOC --->
<cfparam name="attributes.inactive" default="0">
</cfsilent>
<cfmodule template="../common_files/variable_check.cfm" check_variable="attributes.client_code" relocate="Customers.home"/>
<cfinclude template="qry_get_engagements.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="engagement" fuseaction="Customers.edit_engagement" field_name="project_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="open_tasks" fuseaction="Customers.open_tasks" field_name="project_id">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="90%">
	<cfinclude template="dsp_engagements_row_header.cfm">
	<cfinclude template="dsp_engagements_rows.cfm">
</table>

