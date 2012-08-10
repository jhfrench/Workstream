
<!--Timekeeping/dsp_time_entry_edit_row.cfm
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
	--> request.time_entry_id: number that corresponds to the identity column of the Time_Entry table, set at pag_time_entry_edit.cfm.
	--> time_entry_edit.customer_description: string that identifies the customer for a particular task
	--> time_entry_edit.date: date of when the work was done for a particular task
	--> time_entry_edit.hours: number of hours completed for a particular timekeeping entry
	--> time_entry_edit.note: string, sometimes large, that contains the task description notes
	--> time_entry_edit.notes_id: number that corresponds to the identity column of the Notes table
	--> time_entry_edit.project_description: string that identifies the project for a particular task
	--> time_entry_edit.task_name: string that identifies the task name for a particular task
 --->
<cfif isdefined("attributes.given_referer")>
	<cfset attributes.referer=attributes.given_referer>
<cfelse>
	<cfset attributes.referer="Timekeeping.express_entry">
</cfif>
<cfset variables.go_back_to=datediff("d",express_check_date.date_locked,now())-1>
</cfsilent>
<cfoutput>
<cfform action="index.cfm?fuseaction=Timekeeping.time_entry_edit" name="time_entry_edit" method="POST" class="form-horizontal">
	<fieldset>
		<legend><h2>#time_entry_edit.task_name#<a href="javascript:note_to_task('#time_entry_edit.task_id#');" class="btn">View this task</a></h2></legend>
		<div class="control-group">
			<label for="customer_id">Customer</label>
			<div class="controls">
				<p id="customer_id">#time_entry_edit.customer_description#</p>
			</div>
		</div>
		<div class="control-group">
			<label for="project_id">Project</label>
			<div class="controls">
			<cfif NOT variables.entry_type>
				<select name="project_id" id="project_id" size="1" class="span8">
					<cfloop query="get_valid_projects">
						<option value="#project_id#"<cfif time_entry_edit.project_id EQ get_valid_projects.project_id> selected="selected"</cfif>>#display#</option>
					</cfloop>
				</select>
			<cfelse>
				<p id="project_id">#replace(time_entry_edit.project_description,"#time_entry_edit.customer_description#-","")#</p>
			</cfif>
			</div>
		</div>
		<div class="control-group">
			<label for="date">Date</label>
			<div class="controls">
				<input type="date" name="date" id="date" min="#dateformat(express_check_date.date_locked, 'yyyy-mm-dd')#" max="#dateformat(now(), 'yyyy-mm-dd')#" value="#dateformat(time_entry_edit.date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
				<!-- LET CF create the validation JS <cfinput type="DateField" name="date" required="yes" message="Please enter a valid date for this task"> -->
			</div>
		</div>
		<div class="control-group">
			<label for="hours">Hours Worked</label>
			<div class="controls">
				<input type="number" name="hours" id="hours" step="0.25" min="0" max="24" value="#decimalformat(time_entry_edit.hours)#" class="span3" />
				<!-- let CF create the JavaScript: <cfinput type="text" name="hours" id="hours" required="yes" validate="float" message="You must enter hours, as a number, for a time keeping entry. If you wish to delete a task, mark the delete checkbox." /> -->
			</div>
		</div>
		<div class="control-group">
			<label for="">Notes</label>
			<div class="controls">
				<textarea name="note" cols="100" rows="4" wrap="soft" class="span8">#stripcr(time_entry_edit.note)#</textarea>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="notes_id" value="#time_entry_edit.notes_id#" />
			<input type="hidden" name="referer" value="<cfif variables.entry_type>#attributes.referer#<cfelse>time_entry</cfif>" />
			<input type="hidden" name="time_entry_id" value="#request.time_entry_id#" />
			<div class="btn-group">
				<input type="submit" name="method" value="Save changes" class="btn btn-primary" />
				<a href="index.cfm?fuseaction=#attributes.referer#" class="btn">Return without saving</a>
				<cfif time_entry_edit.date GT dateformat(now()-variables.go_back_to,"mm/dd/yy")><input type="submit" name="method" value="Delete this entry" class="btn btn-danger" /></cfif>
			</div>
		</div>
	</fieldset>
</cfform>
</cfoutput>
