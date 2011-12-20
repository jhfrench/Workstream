
<!--Timekeeping/dsp_task_details_col_right.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task. If a task is not specified I display the form to set task details/create a new task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> customer_name: string that identifies the customer for whom the task is created
	--> project_name: string that contains the name of the project or engagement the task is assigned to
 --->
<!--- (JF | 11/12/1) THIS SHOULD GO INTO A REF TABLE SOME DAY --->
<cfset variables.valid_files="cfm,doc,gif,htm,jpg,msg,pdf,ppt,sql,vsd,xls,zip">
</cfsilent>
<cfoutput>
<table border="0" cellpadding="0" cellspacing="2">
	<tr>
		<td class="SubHeadText#session.workstream_text_size#" valign="top">
			Task Name<br>
		</td>
		<cfinclude template="dsp_print_task.cfm">
	</tr>
	<tr>
		<td colspan="2" class="SubHeadText#session.workstream_text_size#" valign="top">
			<input type="text" name="task_name" value="#htmleditformat(get_task_details.task_name)#"  valign="top" size="#variables.cols#" maxlength="255" class="RegText#session.workstream_text_size#"><br>
			Customer: <span class="RegText#session.workstream_text_size#">#get_task_details.customer_name#</span>&nbsp;Project: <span class="RegText#session.workstream_text_size#">#replace(get_task_details.project_name,"#get_task_details.customer_name#-","")#</span>&nbsp;<img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="See more projects." border="0"  onclick="OpenProjectWindow('project_id');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"><br>
			Description<!--- <cfif variables.edit><cfset tabindex=incrementvalue(tabindex)> <img src="#request.dir_level##application.application_specific_settings.image_dir#check.gif" valign="bottom" width="15" height="15" alt="Check spelling for the task details." border="0" onclick="OpenWLWindow('task_details');" tabindex="#tabindex#"></cfif> ---><br>
			<textarea name="task_details" cols="#variables.cols#" rows="#variables.descrip_rows#"  tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" wrap="soft" class="RegText#session.workstream_text_size#">#ReplaceList(ParagraphFormat(get_task_details.description),'<P>,"',",")#</textarea><br><!---<cfif NOT listfind("#valuelist(get_editing_priveleges.editing_priveleges)#,0",session.user_account_id)> onfocus="blur()" readonly</cfif>---> 
	</cfoutput>
			Resolution Notes<br>
			<cfif time_entry_details.recordcount>
				<cfset tabindex=incrementvalue(tabindex)>
<cfset prev_status_id = "">
				<cfoutput><textarea name="time_entry_details" cols="#variables.cols#" rows="#variables.resolution_rows#" tabindex="#tabindex#" wrap="soft"<!---  onfocus="blur()" ---> readonly class="RegText#session.workstream_text_size#"></cfoutput><cfoutput query="time_entry_details"><cfif notes_type_id EQ 1>(#initials# #dateformat(date,"m/d")#) - </cfif><cfif notes_type_id NEQ 2>#trim(note)#&nbsp;&nbsp;</cfif></cfoutput></textarea><cfelse><span class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">Resolution notes not yet entered for this task.</span>
			</cfif><br>
			QA Notes<br>
			<cfif qa_entry_details.recordcount>
<cfset prev_status_id = "">
				<textarea name="qa_entry_details" <cfoutput>cols="#variables.cols#" rows="#qa_rows#"  tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" wrap="soft"<!---  onfocus="blur()" ---> readonly class="RegText#session.workstream_text_size#</cfoutput>"><cfoutput query="qa_entry_details">(#initials# #dateformat(date,"m/d")#) - #note#&nbsp;&nbsp;</cfoutput></textarea>
			<cfelse>
				<span class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">QA notes not yet entered for this task.</span>
			</cfif>
			<br>
			<cfinclude template="dsp_associated_files.cfm"><br>
			<cfinclude template="dsp_associated_tasks.cfm">
		</td>
	</tr>
<cfif get_user_fields.recordcount>
	<cfinclude template="dsp_custom_fields.cfm">
</cfif>
</table>
