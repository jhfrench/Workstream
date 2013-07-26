<!--Timekeeping/dsp_time_entry_edit.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a page that lets the user edit or delete an existing time entry and its note.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	<-> attributes.referer: string that incidicates which fuseaction to pursue.
	<-- attributes.notes_id: number that corresponds to the identity column of the Notes table
	<-- attributes.time_entry_id: number that corresponds to the identity column of the Time_Entry table, set at pag_time_entry_edit.cfm.
	--> [attributes.given_referer]: string that incidicates which fuseaction to pursue.
	--> get_time_entry_edit.customer_description: string that identifies the customer for a particular task
	--> get_time_entry_edit.date: date of when the work was done for a particular task
	--> get_time_entry_edit.hours: number of hours completed for a particular timekeeping entry
	--> get_time_entry_edit.note: string, sometimes large, that contains the task description notes
	--> get_time_entry_edit.notes_id: number that corresponds to the identity column of the Notes table
	--> get_time_entry_edit.project_description: string that identifies the project for a particular task
	--> get_time_entry_edit.task_name: string that identifies the task name for a particular task
 --->
<cfif isdefined("attributes.given_referer")>
	<cfset attributes.referer=attributes.given_referer>
<cfelse>
	<cfset attributes.referer="Timekeeping.express_entry">
</cfif>
<cfset variables.go_back_to=datediff("d",get_date_locked.date_locked,now())-1>
</cfsilent>
<cfoutput>
<form action="index.cfm?fuseaction=Timekeeping.time_entry_edit" name="time_entry_edit" method="POST" class="form-horizontal">
	<fieldset>
		<legend><h2>Update #get_time_entry_edit.completed_by#'s Time Entry</h2></legend>
		<dl class="dl-horizontal">
			<dt>Customer</dt>
			<dd>#get_time_entry_edit.customer_description#</dd>
			<dt>Project</dt>
			<dd>#replace(get_time_entry_edit.project_description,"#get_time_entry_edit.customer_description#-","")#</dd>
			<dt>Task Name</dt>
			<dd>#get_time_entry_edit.task_name# <a href="javascript:note_to_task('#get_time_entry_edit.task_id#');" class="btn">View this task</a></dd>
		</dl>
		<div class="control-group">
			<label for="hours" class="control-label">Hours</label>
			<div class="controls">
				<input type="number" name="hours" id="hours" step="0.25" min="0" max="24" value="#decimalformat(get_time_entry_edit.hours)#" class="span3" />
				<span class="help-block">How many hours of work were performed?</span>
			</div>
		</div>
		<div class="control-group">
			<label for="notes_type_id" class="control-label">Type</label>
			<div class="controls">
				<select name="notes_type_id" id="notes_type_id" class="span11">
				<cfloop query="get_ref_notes_type">
					<option value="#get_ref_notes_type.notes_type_id#"<cfif get_ref_notes_type.notes_type_id EQ get_time_entry_edit.notes_type_id> selected="selected"</cfif>>#notes_type#</option>
				</cfloop>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label for="work_date" class="control-label">Date</label>
			<div class="controls">
				<input type="date" name="work_date" id="work_date" min="#dateformat(get_date_locked.date_locked, 'yyyy-mm-dd')#" max="#dateformat(now(), 'yyyy-mm-dd')#" value="#dateformat(get_time_entry_edit.work_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
			</div>
		</div>
		<div class="control-group">
			<label for="note" class="control-label">Notes</label>
			<div class="controls">
				<textarea name="note" id="note" cols="100" rows="4" wrap="soft" class="span8">#stripcr(get_time_entry_edit.note)#</textarea>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="notes_id" value="#get_time_entry_edit.notes_id#" />
			<input type="hidden" name="referer" value="#attributes.referer#" />
			<input type="hidden" name="time_entry_id" value="#attributes.time_entry_id#" />
			<div class="btn-group">
				<input type="submit" name="method" value="Save changes" class="btn btn-primary" />
				<a href="index.cfm?fuseaction=#attributes.referer#" class="btn">Return without saving</a>
				<cfif get_time_entry_edit.work_date GT dateformat(now()-variables.go_back_to,"m/d/yyyy")><input type="submit" name="method" value="Delete this entry" class="btn btn-danger" /></cfif>
			</div>
		</div>
	</fieldset>
</form>
</cfoutput>
