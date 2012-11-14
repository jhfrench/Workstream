
<!--Directory/dsp_supervisor_entry_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the supervisor entry form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log:
	 || 
 --->
</cfsilent>
<cfoutput>
<cfform name="form_supervisor_entry" action="act_supervisor_submit.cfm" method="POST" class="form-horizontal">
	<fieldset>
		<legend><h2>Supervisor Entry Form</h2></legend>
		<div class="control-group">
			<label for="date_start" class="control-label">Date Implemented</label>
			<div class="controls">
				<input type="date" name="date_start" id="date_start" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
			</div>
		</div>
		<div class="control-group">
			<label for="supervisor_id" class="control-label">Supervisor</label>
			<div class="controls">
				<cfmodule template="../common_files/dsp_team_select.cfm" element_name="supervisor_id" selected_flag="0" message="Please select a supervisor." class="span3">
			</div>
		</div>
	</fieldset>
<cfif get_present_supervisor.recordcount>
	<fieldset>
		<legend><h3>Current Supervisor</h3></legend>
		<cfloop query="get_present_supervisor">
		<div class="control-group">
			<label for="end_date_#get_present_supervisor.supervisor_id#" class="control-label">#get_present_supervisor.sup_name#</label>
			<div class="controls">
				<input type="date" name="end_date_#get_present_supervisor.supervisor_id#" id="end_date_#get_present_supervisor.supervisor_id#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" class="span3 date" />
				<p class="help-block">If provided, this date will be used to mark the end of this supervisor relationship.</p>
			</div>
		</div>
		</cfloop>
	</fieldset>
</cfif>
		<div class="form-actions">
			<input type="hidden" name="user_account_id" value="#user_account_id#" />
			<input type="hidden" name="present_supervisor_id" value="#valuelist(get_present_supervisor.supervisor_id)#" />
			<input type="submit" value="Submit Supervisor" class="btn btn-primary" />
			<input type="button" onclick="javascript:window.close();" value="Cancel" class="btn" />
		</div>
</cfform>
</cfoutput>
