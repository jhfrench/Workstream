
<!--Timekeeping/dsp_task_new_col_left.cfm
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
 --->
</cfsilent>
<cfoutput>
<table border="0" cellpadding="0" cellspacing="0">
	<tr bordercolor="##ffffff">
		<td class="SubHeadText" valign="top">
			Owner <img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="See more employees." border="0"  onclick="OpenTeamWindow('task_owner');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"><br /><cfset tabindex=incrementvalue(tabindex)>
			
			<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_owner" tabindex="#tabindex#" class="RegText"><br />
			Team<br /><cfset tabindex=incrementvalue(tabindex)>
			<cfmodule template="../common_files/dsp_team_select.cfm" multi=1 size=6 select_name="task_team" emp_id="0" tabindex="#tabindex#" class="RegText"><br />
			QA <img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="See more employees." border="0"  onclick="OpenTeamWindow('task_qa');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"><br /><cfset tabindex=incrementvalue(tabindex)>
			<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_qa" tabindex="#tabindex#" class="RegText"><br />
		</td>
		<td class="SubHeadText" valign="top">
			Start Date<br /><cfset tabindex=incrementvalue(tabindex)>
			<cfinput type="datefield" name="date_start" value="" required="Yes" validate="date" message="Please enter a properly formatted start date." size="11" tabindex="#tabindex#" class="RegText">
			<br />
			Date Due<br /><cfset tabindex=incrementvalue(tabindex)>
			<cfinput type="datefield" name="due_date" value="" required="Yes" validate="date" message="Please enter a properly formatted due date." size="11" tabindex="#tabindex#" class="RegText"><br />
			Priority<br /><cfset tabindex=incrementvalue(tabindex)>
			<cfselect name="priority_id" query="get_priorities" display="description" value="priority_id" selected="3" tabindex="#tabindex#" class="RegText"></cfselect><br />
			Icon<br /><cfset tabindex=incrementvalue(tabindex)>
			<cfselect query="get_ref_icon" name="icon_id" display="icon_name" value="icon_id" selected="1" tabindex="#tabindex#" class="RegText"></cfselect><br />
			Hours Budgeted<br /><cfset tabindex=incrementvalue(tabindex)>
			<cfinput name="budgeted_hours" required="Yes" validate="float" message="Please enter a number for hours budgeted." size="4" tabindex="#tabindex#" class="RegText"><br />
		</td>
	</tr>
	<tr>
		<td colspan="2" class="SubHeadText">
			Status<br /><cfset tabindex=incrementvalue(tabindex)>
			<cfselect query="get_task_stati" name="task_status" display="status" value="status_id" selected="0" tabindex="#tabindex#" class="RegText"></cfselect><p>
			<input type="button" value="Create New Task" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText" onclick="checkTheDescription('');">
			<input type="button" value="Submit To Inbox" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText" onclick="checkTheDescription('to_inbox');">
			<input type="hidden" name="last_loaded" value="#now()#">
			<input type="hidden" name="to_inbox" value="">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="SubHeadText">
			<input type="hidden" name="to_edit" value="">
			<input type="button" value="Create And Edit" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText" onclick="checkTheDescription('to_edit');">
		</td>
	</tr>
</table>
</cfoutput>

