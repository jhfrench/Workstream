
<!--Timekeeping/dsp_express_entry_options.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the .
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cfparam name="session.workstream_expand" default="yes,yes,no">
<cfoutput>
	<tr>
		<td colspan="4">
			You are currently set to
			<input type="number" name="express_input_rows" id="express_input_rows" value="#session.workstream_express_input_rows#" step="1" min="0" max="100" required="required" class="span1" /> lines of input (max = 30), a width of
			<input type="number" name="express_notes_width" id="express_notes_width" value="#session.workstream_express_notes_width#" step="1" min="0" max="100" required="required" class="span1" /> columns for the notes box and
			<input type="number" name="express_notes_height" id="express_notes_height" value="#session.workstream_express_notes_height#" step="1" min="0" max="100" required="required" class="span1" /> row(s). Your folder box is set to a height of
			<input type="number" name="express_tree_height" id="express_tree_height" value="#session.workstream_express_tree_height#" step="1" min="0" max="100" required="required" class="span1" />
			. Expand express tree to this level:&nbsp;<cfoutput><label for="root"><input type="radio" name="expand_tree" id="root" value="yes,no,no"<cfif NOT compare(session.workstream_expand,"yes,no,no")> checked="checked"</cfif> class="SelectText"> Root</label>&nbsp;<label for="week"><input type="radio" name="expand_tree" id="week" value="yes,yes,no"<cfif NOT compare(session.workstream_expand,"yes,yes,no")> checked="checked"</cfif> class="SelectText"> Week</label>&nbsp;<label for="day"><input type="radio" name="expand_tree" id="day" value="yes,yes,yes"<cfif NOT compare(session.workstream_expand,"yes,yes,yes")> checked="checked"</cfif> class="SelectText"> Day</label></cfoutput>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<input name="date_locked" type="hidden" value="#get_date_locked.date_locked#" />
			<input name="last_loaded" type="hidden" value="#now()#" />
			<input type="button" value="Submit Time Entry" name="Submit" onclick="check_form('hours')" class="btn btn-primary" />
		</td>
	</tr>
</cfoutput>
