
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
<fieldset>
<legend style="background-color:##94C9C9" class="">Resolution Entry</legend>
<div class="row-fluid">
	<div class="span6">
		<label for="hours">Hours</label>
		<cfinput type="text" name="hours" id="hours" required="No" validate="float" message="You must enter hours as a number." size="4" class="span6" />
	</div>
	<div class="span6">
		<label for="notes_type_id">Types</label>
		<cfselect name="notes_type_id" id="notes_type_id" query="get_note_types" display="notes_type" value="notes_type_id" selected="#notes_type_selected#" class="span8" />
	</div>
</div>
<div class="row-fluid">
	<div class="span6">
		<label for="notes">Notes</label>
	</div>
	<div class="span6">
		<label for="date">Dates</label>
		<select name="date" id="date" class="span11">
		<cfloop from="0" to="#variables.go_back_to#" index="variables.date_adjust_ii">
			<cfset variables.temp_date=now()-variables.date_adjust_ii>
			<option value="#dateformat(variables.temp_date, 'mm/dd/yy')#">#dateformat(variables.temp_date,"mm/dd/yy (ddd)")#</option>
		</cfloop>
		</select>
	</div>
</div>
<div class="row-fluid">
	<div class="span12">
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