 
<!--Search/pag_search.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the search input screen for workstream.
	||
	Name: 
	||
	Edits:
	$Log$
	Revision 1.6  2006/05/16 14:10:26  csy
	Task 44329 Modified code to allow filtering on engagement field when search interface is used

	Revision 1.5  2006-05-04 14:52:33-04  csy
	task 42743 Dynimically populate the date operator drop down list

	Revision 1.4  2006-05-03 11:52:50-04  csy
	task42742 Replaced qry_valid_projects.cfm with qry_search_projects.cfm

	Revision 1.3  2006-04-28 13:08:38-04  csy
	task 42743  I got rid of the javascript code in the cfform tag. I also replaced qry_project_code.cfm with qry_get_valid_projects.cfm as the first one does not  pull a complete list of engagements upon clicking on a customer name. It is worth noting that qry_get_valid_projects.cfm is being successfully used when editing or creating a new task.

	Revision 1.2  2006-04-27 02:55:29-04  french
	Task 42742: No need for customer_id_list.

	Revision 1.1  2006-04-07 12:50:14-04  csy
	task42742 Added two hidden fields to reinforce security in query Search\qry_search.cfm
	
	Revision 1.0  2005-02-15 15:58:28-05  daugherty
	Initial revision
	||
	END FUSEDOC --->
</cfsilent>
<!--- <cfinclude template="../common_files/dsp_pop_calendar.cfm"> --->
<cfmodule template="../common_files/act_calendar.cfm" form_name="input_form" field_name="date_entered,due_date">
<cfinclude template="../common_files/qry_get_search_projects.cfm">
<cfinclude template="../common_files/qry_get_date_operator.cfm">
<cfform name="input_form" action="index.cfm?fuseaction=output" method="POST">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="80%">
 	<cfinclude template="dsp_search_header.cfm">
	<cfinclude template="dsp_search_row_top.cfm">
	<cfinclude template="dsp_task_name.cfm">
	<cfinclude template="dsp_task_id.cfm">
	<cfinclude template="dsp_date_entered.cfm">
	<cfinclude template="dsp_due_date.cfm">
 	<cfinclude template="dsp_task_owner.cfm">
	<cfinclude template="dsp_task_source.cfm">
	<cfinclude template="dsp_project_code.cfm">
	<cfinclude template="dsp_priority.cfm">
	<cfinclude template="dsp_task_stati.cfm">
	<cfinclude template="dsp_notes.cfm">
	<cfinclude template="../common_files/dsp_submit_button.cfm">
	<input type="hidden" name="used_by_search" value="1">
	<input type="hidden" name= "project_id_list" value= "<cfoutput>#valuelist(get_search_projects.project_id)#</cfoutput>">
</table>
</cfform>
<br>
<iframe src="../common_files/pop_cal/popcjs.htm" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" scrolling="no" frameborder="0" style="border:ridge;visibility:hidden;position:absolute;z-index:65535"></iframe>
