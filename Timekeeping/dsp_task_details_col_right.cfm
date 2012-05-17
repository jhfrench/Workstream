
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
<div class="row-fluid">
	<div class="span6">
		<label for="task_name">Task Name</label>
		<input type="text" name="task_name" id="task_name" value="#htmleditformat(get_task_details.task_name)#"  valign="top" size="#variables.cols#" maxlength="255" class="span11">
	</div>
	<div classs="offset3 span3">
		<br />
		<a href="javascript:printable('#attributes.task_id#');" title="'View a printable version of this task." class="btn btn-mini"><i class="icon-print"></i>Printable task sheet</a>
	</div>
</div>
<div class="row-fluid">
	<div classs="span12">
		<p>Customer: #get_task_details.customer_name#&nbsp;Project: #replace(get_task_details.project_name,"#get_task_details.customer_name#-","")#&nbsp;<img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" width="14" height="12" alt="See more projects." border="0" onclick="OpenProjectWindow('project_id');"></p>
		<label for="task_name">Description</label>
		<textarea name="task_details" id="task_details" cols="#variables.cols-2#" rows="#variables.descrip_rows#" wrap="soft" class="span11">#replaceList(ParagraphFormat(get_task_details.description),'<P>,"',",")#</textarea><br />
		<label for="notes">Progress Notes</label>
		<cfif time_entry_details.recordcount>
			<div id="notes" style="height:#variables.resolution_rows*28#px;" class="faux-textarea span11">
				<cfloop query="time_entry_details"><span class="RegText<cfif notes_type_id EQ 2>Red</cfif>">(#initials# #dateformat(date,"m/d/yy")#) - #trim(note)#&nbsp;&nbsp;</span><br /></cfloop>
			</div>
		<cfelse>
			<div id="notes" class="alert span11">Resolution notes not yet entered for this task.</div>
		</cfif>
	</div>
</div>
<div class="row-fluid">
	<div classs="span12">
		<cfinclude template="dsp_associated_files.cfm">
	</div>
</div>
<div class="row-fluid">
	<div classs="span12">
		<cfinclude template="dsp_associated_tasks.cfm">
	</div>
</div>
<cfif get_user_fields.recordcount>
<div class="row-fluid">
	<div classs="span12">
		<cfinclude template="dsp_custom_fields.cfm">
	</div>
</div>
</cfif>
</cfoutput>