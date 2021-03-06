
<!--Directory/dsp_salary_entry_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the salary entry form.
	||
	Name: Jeromy French
	||
	Edits:
$Log:


	 ||
 --->
</cfsilent>
<cfoutput>
<cfform name="form_salary_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="form form-horizontal">
	<fieldset>
		<legend>Salary Entry Form</legend>
	</fieldset>
	<div class="control-group">
		<label class="control-label" for="date">Date Implemented:</label>
		<div class="controls">
			<input type="date" name="date" id="date" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="salary">Salary</label>
		<div class="controls">
			<div class="input-prepend">
				<span class="add-on">&##36;</span>
				<input type="number" name="salary" id="salary" step="1" min="0" max="9999999999" required="required" class="span5 number" />
			</div>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="salary_change_type">Salary Change Type</label>
		<div class="controls">
			<cfselect name="salary_change_type" id="salary_change_type" size="1" message="Please select the type of salary change." query="get_salary_change_types" value="salary_change_type_id" display="description" required="yes" class="span3" />
		</div>
	</div>
	<div class="form-actions">
		<input type="hidden" name="user_account_id" value="#attributes.user_account_id#">
		<input type="submit" name="submit" value="Submit Salary" class="btn btn-primary" />
		<input type="reset" value="Reset" class="btn" />
	</div>
</cfform>
</cfoutput>