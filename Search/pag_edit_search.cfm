 
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
Revision 1.5  2006/05/16 14:10:48  csy
Task 44329 Modified code to allow filtering on engagement field when search interface is used

Revision 1.4  2006-05-04 15:00:13-04  csy
Task 42743 Added query that pulls date operators from the database.

Revision 1.3  2006-05-03 11:57:48-04  csy
task 42742 Replaced qry_valid_projects.cfm with qry_search_projects.cfm

Revision 1.2  2006-04-28 13:58:06-04  csy
task 42743 Got rid of cfset that was using the old query (qry_project_code.cfm) to set a variable

Revision 1.1  2006-04-28 13:08:59-04  csy
task 42743  I got rid of the javascript code in the cfform tag. I also replaced qry_project_code.cfm with qry_get_valid_projects.cfm as the first one does not  pull a complete list of engagements upon clicking on a customer name. It is worth noting that qry_get_valid_projects.cfm is being successfully used when editing or creating a new task.

Revision 1.0  2006-04-07 13:59:57-04  csy
task 42743 search criteria update form/page

Revision 1.0  2005-02-15 15:58:28-05  daugherty
Initial revision

Revision 1.4  2003-01-08 10:39:28-05  blell
Added new calendar

Revision 1.3  2001-10-17 11:12:06-04  french
Added ability to search tasks based on Prioirty.

Revision 1.2  2001-10-17 10:40:28-04  french
Added the ability to search on notes, date entered, and date due.

Revision 1.1  2001-10-11 10:55:23-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	||
	END FUSEDOC --->
	
	<script language=javascript>
function isEmpty()
	{		
		
			 if(document.input_form.project_id.value == '')
			    {
					 alert("You must select an engagement");
					 return false;
				 }  
			
		  }  
		  
		  return true;
	}	
</script>
</cfsilent>
<!--- <cfinclude template="../common_files/dsp_pop_calendar.cfm"> --->
<cfmodule template="../common_files/act_calendar.cfm" form_name="input_form" field_name="date_entered,due_date">
<cfinclude template="../common_files/qry_get_search_projects.cfm">
<cfinclude template="../common_files/qry_get_date_operator.cfm">
<cfform name="input_form" action="index.cfm?fuseaction=Search.output" method="POST">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="80%">
 	<cfinclude template="dsp_search_header.cfm">
	<cfinclude template="dsp_search_row_top.cfm">
	<cfinclude template="dsp_edit_task_name.cfm">
	<cfinclude template="dsp_edit_task_id.cfm">
	<cfinclude template="dsp_edit_date_entered.cfm">
	<cfinclude template="dsp_edit_due_date.cfm">
 	<cfinclude template="dsp_edit_task_owner.cfm">
	<cfinclude template="dsp_edit_task_source.cfm">
	<cfinclude template="dsp_edit_project_code.cfm">
	<cfinclude template="dsp_edit_priority.cfm">
	<cfinclude template="dsp_edit_task_stati.cfm">
	<cfinclude template="dsp_edit_notes.cfm">
	<cfinclude template="../common_files/dsp_submit_button.cfm">
	<cfoutput>
	<input type="hidden" name="used_by_search" value="1">
	<input type="hidden" name= "project_id_list" value= "#valuelist(get_search_projects.project_id)#">
	
    </cfoutput>
</table>
</cfform>
<br>
<iframe src="../common_files/pop_cal/popcjs.htm" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" scrolling="no" frameborder="0" style="border:ridge;visibility:hidden;position:absolute;z-index:65535"></iframe>

