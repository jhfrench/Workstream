
<!--Timekeeping/dsp_express_input.cfm
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
<cfoutput>
<cfform name="form_time_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
<table class="table table-striped table-bordered table-condensed">
	<caption><h2><em>-Express=</em> Time Entry</h2></caption>
	<thead>
		<tr>
			<th>Date</th>
			<th>Hours</th>
			<th><cfif compare(fuseaction, "time_entry")>Project<cfelse>Task</cfif></th>
			<th>Notes</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="4">
				You are currently set to
				<input type="number" name="express_input_rows" id="express_input_rows" value="#session.workstream_express_input_rows#" step="1" min="0" max="30" required="required" class="span1" /> lines of input (max = 30). Your folder box is set to a height of
				<input type="number" name="express_tree_height" id="express_tree_height" value="#session.workstream_express_tree_height#" step="1" min="0" max="100" required="required" class="span1" />.
				Expand express tree to this level:&nbsp;
				<cfoutput>
					<label for="root" class="radio inline">
						<input type="radio" name="expand_tree" id="root" value="yes,no,no"<cfif NOT compare(session.workstream_expand,"yes,no,no")> checked="checked"</cfif> />
						 Root
					</label>
					&nbsp;
					<label for="week" class="radio inline">
						<input type="radio" name="expand_tree" id="week" value="yes,yes,no"<cfif NOT compare(session.workstream_expand,"yes,yes,no")> checked="checked"</cfif> />
						 Week
					</label>
					&nbsp;
					<label for="day" class="radio inline">
						<input type="radio" name="expand_tree" id="day" value="yes,yes,yes"<cfif NOT compare(session.workstream_expand,"yes,yes,yes")> checked="checked"</cfif> />
						 Day
					</label>
				</cfoutput>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<input name="date_locked" type="hidden" value="#get_date_locked.date_locked#" />
				<input name="last_loaded" type="hidden" value="#now()#" />
				<input type="button" value="Submit Time Entry" name="Submit" onclick="check_form('hours')" class="btn btn-primary" />
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop from="1" to="#min(variables.workstream_express_input_rows,30)#" index="variables.input_row_ii">
		<tr>
			<td scope="row">
				<input type="date" name="date" id="date" min="#variables.min_date#" max="#variables.max_date#" value="" maxlength="10" class="span8 date" />
			</td>
			<td>
				<input type="number" name="hours" id="hours" step="0.25" min="0" max="24" class="number span6" />
			</td>
			<td>
				#variables.select_work_item#
			</td>
			<td>
				<textarea rows="1" cols="25" name="notes_#variables.input_row_ii#" wrap="soft" class="span12"></textarea>
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfform>
</cfoutput>
