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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfif listlen(get_task_details.hours_used,".") GT 1 AND listgetat(get_task_details.hours_used,2,".") GT 0>
	<cfset variables.hours_used=decimalformat(get_task_details.hours_used)>
<cfelse>
	<cfset variables.hours_used=numberformat(get_task_details.hours_used)>
</cfif>

<cfset width=min(numberformat(get_task_details.image_width,"______"),variables.var1)>
<cfset width2=variables.var1-width>
<cfset alt="Time used for #get_task_details.task_name#: #variables.hours_used# out of #get_task_details.budgeted_hours# hours (#decimalformat(get_task_details.percent_used)#%)">

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
<table border="1" cellpadding="0" cellspacing="0" bordercolor="##ffffff">
	<tr bordercolor="##ffffff">
		<td class="SubHeadText#session.workstream_text_size#" valign="top">
			Owner <img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="See more projects." border="0"  onclick="OpenTeamWindow('task_owner');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"><br>
			<cfset tabindex=incrementvalue(tabindex)><cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_owner" emp_id="#task_owner#" tabindex="#tabindex#" class="RegText#session.workstream_text_size#"><br>
			Team<br>
			<cfset tabindex=incrementvalue(tabindex)><cfmodule template="../common_files/dsp_team_select.cfm" multi=1 size=8 select_name="task_team" emp_id="#task_team#" tabindex="#tabindex#" class="RegText#session.workstream_text_size#"><br>
			QA <img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="See more projects." border="0"  onclick="OpenTeamWindow('task_qa');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"><br>
			<cfset tabindex=incrementvalue(tabindex)><cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_qa" emp_id="#task_qa#" tabindex="#tabindex#" class="RegText#session.workstream_text_size#">
		</td>
		<td class="SubHeadText#session.workstream_text_size#" valign="top">
			Source<br>
			<span class="RegText#session.workstream_text_size#">#get_task_details.source_name#</span><br>
			Date Assigned<br>
			<span class="RegText#session.workstream_text_size#">#DateFormat(get_task_details.date_assigned,"mm/dd/yy")#</span><br>
			Date Due<br>
			<cfset tabindex=incrementvalue(tabindex)><cfinput type="datefield" name="due_date" value="#DateFormat(get_task_details.due_date,'mm/dd/yy')#" required="Yes" validate="date" message="Please enter a properly formatted date" size="11" tabindex="#tabindex#" class="RegText#session.workstream_text_size#"><br>
			Date Completed<br>
			<span class="RegText#session.workstream_text_size#"><cfif len(get_task_details.complete_date) AND get_task_details.status_id EQ 11>#DateFormat(get_task_details.complete_date,"mm/dd/yy")#<cfelse>Not yet completed</cfif></span><br>
			</cfoutput>Priority<br>

	<cfset tabindex=incrementvalue(tabindex)><cfselect name="priority_id" query="get_priorities" display="description" value="priority_id" selected="#get_task_details.priority#" tabindex="#tabindex#" class="RegText#session.workstream_text_size#"></cfselect>
<!---<cfelse>
	<cfoutput query="get_priorities"><cfif priority_id EQ get_task_details.priority><span class="RegText#session.workstream_text_size#">#description#</span></cfif></cfoutput></cfif>---><br>
			<cfoutput>
			Icon<br>
			<cfset tabindex=incrementvalue(tabindex)><cfselect query="get_ref_icon" name="icon_id" display="icon_name" value="icon_id" selected="#get_task_details.icon_id#" tabindex="#tabindex#" class="RegText#session.workstream_text_size#">
			</cfselect>
		</td>
	</tr>
	<tr bordercolor="##ffffff">
		<td colspan="2" class="SubHeadText#session.workstream_text_size#">
			Status<br>
			<cfset tabindex=incrementvalue(tabindex)><cfselect query="get_task_stati" name="task_status" display="status" value="status_id" selected="#get_task_details.status_id#" tabindex="#tabindex#" class="RegText#session.workstream_text_size#">
			</cfselect>
		</td>
	</tr>
	<cfinclude template="dsp_task_detail_notes_entry.cfm">
	<cfif listfind("1,5", session.workstream_emp_contact_type) OR session.workstream_show_hours_data_ind EQ 1><!--- show time data to employees or customers if their company is set up to view hours---><tr bordercolor="##ffffff">
		<td colspan="2" class="SubHeadText#session.workstream_text_size#">
			Time Used&nbsp;<br>
			<span class="RegText#session.workstream_text_size#">#variables.hours_used#<cfif get_task_details.budgeted_hours> out of #get_task_details.budgeted_hours# budgeted hours (#decimalformat(get_task_details.percent_used)#%)</cfif></span>

		</td>
	</tr>
	<cfif get_task_details.budgeted_hours>
	<tr bordercolor="##ffffff">
		<td colspan="2">
			<table border="1" cellpadding="0" cellspacing="0" bordercolor="##000000">
				<tr>
					<td valign="middle">
						<cfif width><a href="javascript:list_to_time('#task_id#');"><img src="#request.dir_level##application.application_specific_settings.image_dir#bar_<cfif get_task_details.percent_used GT 75>1<cfelseif get_task_details.percent_used GT 50>3<cfelse>7</cfif>.gif" width="#width#" height="20" alt="#alt#" border="0"></a></cfif><cfif width2><img src="#request.dir_level##application.application_specific_settings.image_dir#blank.gif" width="#width2#" height="20" alt="#alt#" border="0"></cfif></td>
				</tr>
			</table>
		</td>
	</tr></cfif>
	<cfelse><tr bordercolor="##ffffff">
		<td colspan="2" class="SubHeadText#session.workstream_text_size#">
			Hours Budgeted:&nbsp;<span class="RegText#session.workstream_text_size#">#get_task_details.budgeted_hours#</span>
		</td>
	</tr>
	</cfif>
</cfoutput>
</table>

