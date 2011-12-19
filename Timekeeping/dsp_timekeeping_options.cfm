
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
<cfoutput>
	<input type="hidden" name="evaluate_task_options">
	<tr class="RegText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#" width="30%">
			<label for="show_on_hold"><input type="checkbox" name="show_on_hold" id="show_on_hold"<cfif isdefined("session.workstream_show_on_hold") AND session.workstream_show_on_hold> checked</cfif>> Show Tasks On Hold</label>
		</td>
		<td class="RegText#session.workstream_text_size#">
			<label for="show_options"><input type="checkbox" name="show_options" id="show_options"<cfif isdefined("session.workstream_show_options") AND session.workstream_show_options> checked</cfif>> Show Task Options on the Task List page</label>
		</td>
	</tr>
	<tr class="RegText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			<label for="show_closed"><input type="checkbox" name="show_closed" id="show_closed"<cfif isdefined("session.workstream_show_closed") AND session.workstream_show_closed> checked</cfif>> Show Completed Tasks</label>
		</td>
		<td class="RegText#session.workstream_text_size#">
			<label for="show_closed_engagements"><input type="checkbox" name="show_closed_engagements" id="show_closed_engagements"<cfif isdefined("session.workstream_show_closed_engagements") AND session.workstream_show_closed_engagements> checked</cfif>> Show Closed Projects</label>
		</td>
	</tr>
	<tr>
		<td class="RegText#session.workstream_text_size#">
			<label for="show_team"><input type="checkbox" name="show_team" id="show_team"<cfif isdefined("session.workstream_show_team") AND session.workstream_show_team> checked</cfif>> Show Team Tasks</label>
		</td>
	</tr>
	<tr valign="top">
		<cfparam name="session.workstream_notes_display_sort" default="2">
		<td class="RegText#session.workstream_text_size#">
			Inside task details, sort notes by:<br>
			&nbsp;<label for="notes_display_sort_worked"><input type="radio" name="notes_display_sort" id="notes_display_sort_worked" value="1"<cfif session.workstream_notes_display_sort EQ 1> checked</cfif> class="RegText#session.workstream_text_size#"> Work completed date</label>&nbsp;|&nbsp;<label for="notes_display_sort_entry"><input type="radio" name="notes_display_sort" id="notes_display_sort_entry" value="2"<cfif session.workstream_notes_display_sort EQ 2> checked</cfif> class="RegText#session.workstream_text_size#"> Entry date</label>
		</td>
		<cfparam name="session.workstream_expand" default="yes,yes,no">
		<td class="RegText#session.workstream_text_size#">
			Expand express tree to this level:<br>
			&nbsp;<label for="root"><input type="radio" name="expand_tree" id="root" value="yes,no,no"<cfif NOT compare(session.workstream_expand,"yes,no,no")> checked</cfif> class="RegText#session.workstream_text_size#"> Root</label>&nbsp;|&nbsp;<label for="week"><input type="radio" name="expand_tree" id="week" value="yes,yes,no"<cfif NOT compare(session.workstream_expand,"yes,yes,no")> checked</cfif> class="RegText#session.workstream_text_size#"> Week</label>&nbsp;|&nbsp;<label for="day"><input type="radio" name="expand_tree" id="day" value="yes,yes,yes"<cfif NOT compare(session.workstream_expand,"yes,yes,yes")> checked</cfif> class="RegText#session.workstream_text_size#"> Day</label>
		</td>
	</tr>
	<tr>
		<td class="RegText#session.workstream_text_size#">
			<cfinput type="text" name="express_input_rows" value="#session.workstream_express_input_rows#" size="1" maxlength="2" required="Yes" validate="integer" message="Please enter the number of lines you wish to input." class="RegText#session.workstream_text_size#"> lines per page load for express input
		</td>
		<td class="RegText#session.workstream_text_size#">
			<cfinput type="text" name="express_notes_width" value="#session.workstream_express_notes_width#" size="2" required="Yes" validate="integer" message="Please enter a number for the notes box width." class="RegText#session.workstream_text_size#"> width of the express input text box
		</td>
	</tr>
	<tr>
		<td class="RegText#session.workstream_text_size#">
			<cfinput type="text" name="express_notes_height" value="#session.workstream_express_notes_height#" size="1" required="Yes" validate="integer" message="Please enter the number of rows for the notes box." class="RegText#session.workstream_text_size#"> height of the express input text box
		</td>
		<td class="RegText#session.workstream_text_size#">
			<cfinput type="text" name="express_tree_height" value="#session.workstream_express_tree_height#" size="3" required="Yes" validate="integer" message="Please enter a number for the height of the folder box." class="RegText#session.workstream_text_size#"> height of the express input folder box
		</td>
	</tr>
</cfoutput>

