
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
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfif isdefined("make_changes")>
	<cfinclude template="act_edit_account.cfm">
</cfif>
<cfinclude template="qry_get_all_modules_and_reports.cfm">
<cfinclude template="qry_get_user_details.cfm">
<cfform action="index.cfm?fuseaction=Administration.edit_account" name="timekeeping_options" method="POST">
<table align="center" bgcolor="#cccccc" border="0" cellpadding="0" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Account Edit (#get_user_details.lname#, #get_user_details.name#)" section_color="808080" colspan="5" gutter=0 title_class="HeadText">
	<cfinclude template="dsp_edit_account.cfm">
	<cfmodule template="../common_files/dsp_submit_options.cfm" include_reset="1" reset_value="Reset Options" submit_value="Save Settings">
</table>
</cfform>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_employee" field_name="emp_id" fuseaction="Directory.emp_edit">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_auxiliary" field_name="emp_id" fuseaction="edit_auxiliary">
