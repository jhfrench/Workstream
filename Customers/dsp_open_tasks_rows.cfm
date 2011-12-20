
<!--Customers/dsp_open_tasks_rows.cfm
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
	--> application.application_specific_settings.image_dir: string that contains main path to the folder where all images are kept
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> date_due: date when task is due
	--> task_id: unique number that identifies task entry
	--> task_name: name or title of the task
	--> task_owner: last name of the person ultimately responsible for succesful task resolution
	--> task_icon: icon specified for the task
	--> task_description: details or description of what is required to complete the task
	--> billing_code: code which task time will be invoiced to
	--> project_name: name of project which corresponds to the task
	--> task_status: current status of the task
	--> task_qa: last name of the person in charge of performing quality analysis on the tasks
	--> time_used: total amount of time recorded towards completion of the task
	--> time_budgeted: amount of time allocated or targeted to complete the task
	--> percent_time_used: number showing the amount of time used divided by the amount of time budgeted, shown only if time was budgeted
	--> task_status: string that indicates the task status
 --->
<cfset variables.quote='"'>
<cfset variables.StatusMsg_replace="',#variables.quote#">
<cfset variables.StatusMsg_replace_with=",">
</cfsilent>
<cfif get_open_tasks.recordcount>
<!--- KEVIN-- this is not the place to include this. This should be included from the pag level. This breaks the search output (Adam included files directly from timekeeping rather than move them to common_files). Please fix --->
<cfoutput query="get_open_tasks">
<cfset StatusMsg=ReplaceList(task_name, variables.StatusMsg_replace, variables.StatusMsg_replace_with)>
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td class="RegText#session.workstream_text_size#">#dateformat(date_due, "mm/dd/yyyy")#</td>
		<td class="RegText#session.workstream_text_size#">#task_id#</td>
		<td class="RegText#session.workstream_text_size#"><a href="javascript:list_to_time('#task_id#');" onmouseover="MM_displayStatusMsg('View time details for #StatusMsg#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#"><cfif listlen(time_used,".") GT 1>#decimalformat(time_used)#<cfelse>#numberformat(time_used)#</cfif><cfif time_budgeted>/#time_budgeted# #numberformat(percent_time_used)#%</cfif></a></td>
		<td class="RegText#session.workstream_text_size#">#task_owner#</td>
		<td class="RegText#session.workstream_text_size#"><a href="javascript:list_to_task('#task_id#');" onmouseover="MM_displayStatusMsg('View task details for #StatusMsg#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#"><img src="#request.dir_level##application.application_specific_settings.image_dir##task_icon#" alt="#ReplaceList(task_description, variables.quote, variables.StatusMsg_replace_with)#" height="16" width="16" border="0">#task_name#</a></td>
		<td class="RegText#session.workstream_text_size#">#project_name#</td>
		<td class="RegText#session.workstream_text_size#"><cfif NOT dateformat(now(), "mm/dd/yyyy") LT dateformat(date_due, "mm/dd/yyyy")><img src="#request.dir_level##application.application_specific_settings.image_dir#<cfif dateformat(now(), "mm/dd/yyyy") EQ dateformat(date_due, "mm/dd/yyyy")>not_started<cfelse>overdue</cfif>.gif" width="17" height="17" alt="" border="0">&nbsp;</cfif>#task_status#</td>
	</tr>
</cfoutput>
<cfelse>
	<tr>
		<td align="center" colspan="7" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">
			You have no tasks that meet your criteria.
		</td>
	</tr>
</cfif>

