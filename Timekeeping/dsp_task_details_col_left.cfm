<!--Timekeeping/dsp_task_details_col_left.cfm
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
<cfif listlen(get_task_details.hours_used,".") GT 1 AND listgetat(get_task_details.hours_used,2,".") GT 0>
	<cfset variables.hours_used=decimalformat(get_task_details.hours_used)>
<cfelse>
	<cfset variables.hours_used=numberformat(get_task_details.hours_used)>
</cfif>

<cfset variables.width=min(numberformat(get_task_details.image_width,"______"),variables.var1)>
<cfset variables.width2=variables.var1-variables.width>

<cfif get_task_details.qa_id EQ session.user_account_id AND get_task_details.status_id EQ 4>
	<cfset notes_type_selected=2>
<cfelseif get_task_details.owner_id EQ session.user_account_id>
	<cfset notes_type_selected=1>
<cfelseif get_task_details.task_read>
	<cfset notes_type_selected=3>
<cfelse>
	<cfset notes_type_selected=0>
</cfif>
</cfsilent>
<cfoutput>
<table cellpadding="0" cellspacing="0">
	<tr bordercolor="##ffffff">
		<td class="SubHeadText" valign="top">
			Owner <img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="See more projects." border="0"  onclick="OpenTeamWindow('task_owner');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"><br />
			<cfset tabindex=incrementvalue(tabindex)><cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_owner" emp_id="#task_owner#" tabindex="#tabindex#" class="RegText"><br />
			Team<br />
			<cfset tabindex=incrementvalue(tabindex)><cfmodule template="../common_files/dsp_team_select.cfm" multi="1" size="4" select_name="task_team" emp_id="#task_team#" tabindex="#tabindex#" class="RegText"><br />
			QA <img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="See more projects." border="0"  onclick="OpenTeamWindow('task_qa');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"><br />
			<cfset tabindex=incrementvalue(tabindex)><cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_qa" emp_id="#task_qa#" tabindex="#tabindex#" class="RegText"><br />
			Status<br />
			<cfset tabindex=incrementvalue(tabindex)><cfselect query="get_task_stati" name="task_status" display="status" value="status_id" selected="#get_task_details.status_id#" tabindex="#tabindex#" class="RegText">
			</cfselect>
		</td>
		<td class="SubHeadText" valign="top">
			Source<br />
			<span class="RegText">#get_task_details.source_name#</span><br />
			Date Assigned<br />
			<span class="RegText">#dateformat(get_task_details.date_assigned,"mm/dd/yy")#</span><br />
			Date Due<br />
			<cfset tabindex=incrementvalue(tabindex)><cfinput type="datefield" name="due_date" value="#dateformat(get_task_details.due_date,'mm/dd/yy')#" required="Yes" validate="date" message="Please enter a properly formatted date" size="11" tabindex="#tabindex#" class="RegText"><br />
			Date&nbsp;Completed<br />
			<span class="RegText"><cfif len(get_task_details.complete_date) AND get_task_details.status_id EQ 11>#dateformat(get_task_details.complete_date,"mm/dd/yy")#<cfelse>Not yet completed</cfif></span><br />
			</cfoutput>Priority<br />

	<cfset tabindex=incrementvalue(tabindex)><cfselect name="priority_id" query="get_priorities" display="description" value="priority_id" selected="#get_task_details.priority#" tabindex="#tabindex#" class="RegText"></cfselect>
<!---<cfelse>
	<cfoutput query="get_priorities"><cfif priority_id EQ get_task_details.priority><span class="RegText">#description#</span></cfif></cfoutput></cfif>---><br />
			<cfoutput>
			Icon<br />
			<cfset tabindex=incrementvalue(tabindex)><cfselect query="get_ref_icon" name="icon_id" display="icon_name" value="icon_id" selected="#get_task_details.icon_id#" tabindex="#tabindex#" class="RegText" />
		</td>
	</tr>
	<cfinclude template="dsp_task_detail_notes_entry.cfm">
	<cfif listfind("1,5", session.workstream_emp_contact_type) OR session.workstream_show_hours_data_ind EQ 1><!--- show time data to employees or customers if their company is set up to view hours---><tr bordercolor="##ffffff">
		<td colspan="2" class="SubHeadText">
			Time Used&nbsp;<br />
			<span class="RegText">#variables.hours_used#<cfif get_task_details.budgeted_hours> out of #get_task_details.budgeted_hours# budgeted hours (#decimalformat(get_task_details.percent_used)#%)</cfif></span>

		</td>
	</tr>
	<cfif get_task_details.budgeted_hours>
	<tr bordercolor="##ffffff">
		<td colspan="2">
			<div style="height:20px; width:198px; border:1px solid;" title="Time used for '#get_task_details.task_name#': #variables.hours_used# out of #get_task_details.budgeted_hours# hours (#decimalformat(get_task_details.percent_used)#%). Follow link to reassign hours.">
			<cfif width><a href="javascript:list_to_time('#task_id#');"><img src="#request.dir_level##application.application_specific_settings.image_dir#bar_<cfif get_task_details.percent_used GT 75>1<cfelseif get_task_details.percent_used GT 50>3<cfelse>7</cfif>.gif" width="#variables.width#" height="20" alt="Percent of time used." border="0" /></a></cfif><cfif width2><img src="#request.dir_level##application.application_specific_settings.image_dir#blank.gif" width="#variables.width2#" height="20" alt="Percent of time left." border="0" /></cfif>
			</div>
		</td>
	</tr></cfif>
	<cfelse><tr bordercolor="##ffffff">
		<td colspan="2" class="SubHeadText">
			Hours Budgeted:&nbsp;<span class="RegText">#get_task_details.budgeted_hours#</span>
		</td>
	</tr>
	</cfif>
</cfoutput>
</table>

