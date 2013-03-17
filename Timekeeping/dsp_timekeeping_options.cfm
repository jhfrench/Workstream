
<!--Admin/dsp_timekeeping_options.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the timekeeping options.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfoutput>
	<input type="hidden" name="evaluate_task_options">
	<tr>
		<td colspan="2">
			<label for="show_on_hold"><input type="checkbox" name="show_on_hold" id="show_on_hold"<cfif isdefined("session.workstream_show_on_hold") AND session.workstream_show_on_hold> checked="checked"</cfif>> Show Tasks On Hold</label>
		</td>
	</tr>
	<tr>
		<td>
			<label for="show_closed"><input type="checkbox" name="show_closed" id="show_closed"<cfif isdefined("session.workstream_show_closed") AND session.workstream_show_closed> checked="checked"</cfif>> Show Completed Tasks</label>
		</td>
		<td>
			<label for="show_closed_project_ind"><input type="checkbox" name="show_closed_project_ind" id="show_closed_project_ind"<cfif isdefined("session.workstream_show_closed_project_ind") AND session.workstream_show_closed_project_ind> checked="checked"</cfif>> Show Closed Projects</label>
		</td>
	</tr>
	<tr>
		<td>
			<label for="show_team"><input type="checkbox" name="show_team" id="show_team"<cfif isdefined("session.workstream_show_team") AND session.workstream_show_team> checked="checked"</cfif>> Show Team Tasks</label>
		</td>
	</tr>
	<tr valign="top">
		<cfparam name="session.workstream_expand" default="yes,yes,no">
		<td colspan="2">
			Expand express tree to this level:<br />
			&nbsp;<label for="root"><input type="radio" name="expand_tree" id="root" value="yes,no,no"<cfif NOT compare(session.workstream_expand,"yes,no,no")> checked="checked"</cfif>> Root</label>&nbsp;|&nbsp;<label for="week"><input type="radio" name="expand_tree" id="week" value="yes,yes,no"<cfif NOT compare(session.workstream_expand,"yes,yes,no")> checked="checked"</cfif>> Week</label>&nbsp;|&nbsp;<label for="day"><input type="radio" name="expand_tree" id="day" value="yes,yes,yes"<cfif NOT compare(session.workstream_expand,"yes,yes,yes")> checked="checked"</cfif>> Day</label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="number" name="express_input_rows" id="express_input_rows" value="#session.workstream_express_input_rows#" step="1" min="0" max="100" required="required" class="span5" /> lines per page load for express input
		</td>
		<td>
			<input type="number" name="express_notes_width" id="express_notes_width" value="#session.workstream_express_notes_width#" step="1" min="0" max="100" required="required" class="span5" /> width of the express input text box
		</td>
	</tr>
	<tr>
		<td>
			<input type="number" name="express_notes_height" id="express_notes_height" value="#session.workstream_express_notes_height#" step="1" min="0" max="500" required="required" class="span5" /> height of the express input text box
		</td>
		<td>
			<input type="number" name="express_tree_height" id="express_tree_height" value="#session.workstream_express_tree_height#" step="1" min="0" max="500" required="required" class="span5" /> height of the express input folder box
		</td>
	</tr>
</cfoutput>

