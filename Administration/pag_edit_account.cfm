
<!--Admin/pag_edit_account.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.2  2006/09/15 22:28:04  csy
	<>

	Revision 1.0  2006-08-16 09:32:07-04  csy
	Initial revision

	Revision 1.1  2006-07-05 13:27:54-04  french
	Added ability to edit auciliary attributes of an account.

	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfif isdefined("make_changes")>
	<cfinclude template="act_edit_account.cfm">
</cfif>
<cfinclude template="qry_get_all_modules_and_reports.cfm">
<cfinclude template="qry_get_user_details.cfm">
<cfform action="index.cfm?fuseaction=edit_account" name="timekeeping_options" method="POST">
<table align="center" bgcolor="#cccccc" border="0" cellpadding="0" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Account Edit (#get_user_details.lname#, #get_user_details.name#)" section_color="808080" colspan="5" gutter=0 title_class="HeadText#session.workstream_text_size#">
	<cfinclude template="dsp_edit_account.cfm">
	<cfmodule template="dsp_submit_options.cfm" include_reset="1" reset_value="Reset Options" submit_value="Save Settings">
</table>
</cfform>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_employee" directory_action="../directory/" field_name="emp_id" fuseaction="emp_edit">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_auxiliary" field_name="emp_id" fuseaction="edit_auxiliary">
