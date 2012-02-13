
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
	--> customer_name: string that identifies the customer for whom the task is created
	--> project_name: string that contains the name of the project or engagement the task is assigned to
 --->
<!--- (JF | 11/12/1) THIS SHOULD GO INTO A REF TABLE SOME DAY --->
<cfset variables.valid_files="cfm,doc,gif,htm,jpg,msg,pdf,ppt,sql,vsd,xls,zip">
</cfsilent>
<cfoutput>
<table border="0" cellpadding="0" cellspacing="2">
	<tr>
		<td class="SubHeadText" valign="top">
			Task Name<br>
		</td>
		<cfinclude template="dsp_print_task.cfm">
	</tr>
	<tr>
		<td colspan="2" class="SubHeadText" valign="top">
			<input type="text" name="task_name" value="#htmleditformat(get_task_details.task_name)#"  valign="top" size="#variables.cols#" maxlength="255" class="RegText"><br>
			Customer: <span class="RegText">#get_task_details.customer_name#</span>&nbsp;Project: <span class="RegText">#replace(get_task_details.project_name,"#get_task_details.customer_name#-","")#</span>&nbsp;<img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="See more projects." border="0"  onclick="OpenProjectWindow('project_id');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"><br>
			Description<!--- <cfif variables.edit><cfset tabindex=incrementvalue(tabindex)> <img src="#request.dir_level##application.application_specific_settings.image_dir#check.gif" valign="bottom" width="15" height="15" alt="Check spelling for the task details." border="0" onclick="OpenWLWindow('task_details');" tabindex="#tabindex#"></cfif> ---><br>
			<textarea name="task_details" cols="#variables.cols-2#" rows="#variables.descrip_rows#"  tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" wrap="soft" class="RegText">#ReplaceList(ParagraphFormat(get_task_details.description),'<P>,"',",")#</textarea><br><!---<cfif NOT listfind("#valuelist(get_editing_priveleges.editing_priveleges)#,0",session.user_account_id)> onfocus="blur()" readonly</cfif>---> 
			Progress Notes<br>
			<cfif time_entry_details.recordcount>
				<div style="width:600px; height:#variables.resolution_rows*28#px; overflow:auto; border:1px solid ##c0c0c0; padding:2px;">
					<cfloop query="time_entry_details"><span class="RegText<cfif notes_type_id EQ 2>Red</cfif>">(#initials# #dateformat(date,"m/d/yy")#) - #trim(note)#&nbsp;&nbsp;</span><br /></cfloop>
				</div>
			<cfelse>
				<span class="Note">Resolution notes not yet entered for this task.</span>
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
</cfoutput>