
<!-- Timekeeping/dsp_task_detail_notes_entry.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the notes entry section of the dask details screen.

	||
	Edits:
	$Log$
	||
	Variables:
	 || 
	END FUSEDOC --->
<cfset variables.go_back_to=datediff("d", express_check_date.date_locked, now())-1>
</cfsilent>
<cfoutput>
<fieldset class="well">
<legend class="h4">Resolution Entry</legend>
<div class="row-fluid">
	<div id="task_details_resolution_entry_hours" class="span5">
		<label for="hours">Hours</label>
		<input type="number" name="hours" id="hours" step="0.25" min="0" max="24" class="span5" />
	</div>
	<div class="span3">
		<label for="notes_type_id">Type</label>
			<select name="notes_type_id" id="notes_type_id" class="span11">
			<cfloop query="get_note_types">
				<option value="#notes_type_id#"<cfif notes_type_id EQ variables.notes_type_selected> selected="selected"</cfif>>#notes_type#</option>
			</cfloop>
			</select><!--- 
		<cfselect name="notes_type_id" id="notes_type_id" query="get_note_types" display="notes_type" value="notes_type_id" selected="#variables.notes_type_selected#" class="span8" /> --->
	</div>
	<div class="span4">
		<label for="date">Date</label>
		<input type="date" name="date" id="date" min="#dateformat(express_check_date.date_locked, 'yyyy-mm-dd')#" max="#dateformat(now(), 'yyyy-mm-dd')#" value="#dateformat(now(), 'yyyy-mm-dd')#" maxlength="10" class="span8 date" />
	</div>
</div>
<div class="row-fluid">
	<div class="span12">
		<label for="notes">Notes</label>
		<textarea name="notes" id="notes" wrap="soft" rows="#max(entry_rows,3)#" class="span12"></textarea>
	</div>
</div>
<div class="row-fluid">
	<div class="btn-group" style="margin-left:auto; margin-right:auto;">
		<input type="submit" name="to_inbox" value="Submit To Inbox" title="submit changes to this task and redirect me to my inbox" class="btn btn-primary" />
		<input type="submit" name="update" value="Update" title="submit changes to this task and reload this task" class="btn" />
	</div>
</div>
</fieldset>
</cfoutput>