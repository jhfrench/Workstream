
<!--Timekeeping/pag_express_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the Timekeeping express entry page, and possibly include the act template that uploads the data to the database.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:22:38  stetzer
<>

Revision 1.3  2001-12-12 10:59:42-05  long
added an include with the javascript to validate the hours field

Revision 1.2  2001-11-07 15:50:30-05  long
Moved the express task list query to the index page so that this template can be called from the custom directory with the custom query driving it.

Revision 1.1  2001-10-11 10:54:58-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
 --->
</cfsilent>
<cfinclude template="act_validate_hours_js.cfm">
<cfif isdefined("attributes.hours") AND listlen(attributes.hours) AND session.workstream_last_loaded NEQ attributes.last_loaded>
	<cfinclude template="act_upload_entries.cfm">
</cfif>
<cfinclude template="../common_files/act_client_vars.cfm">
<cfinclude template="qry_express_time_entries.cfm">

<cfinclude template="../common_files/qry_express_check_date.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfif isdefined("notnumeric")>
		<cfinclude template="dsp_express_not_numeric.cfm">
	</cfif>
	<cfinclude template="dsp_express_cftree.cfm">
<cfform name="myform" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
	<cfinclude template="dsp_express_input_rows_label.cfm">
	<cfinclude template="dsp_express_input_rows.cfm">
	<cfinclude template="dsp_express_entry_options.cfm">
</cfform>
</table>

