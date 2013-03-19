
<!--Directory/dsp_employee_details_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the employee details entry and edit form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<fieldset>
	<legend><h3>Personal</h3></legend>
	<div class="control-group">
		<label for="last_name" class="control-label">Last Name</label>
		<div class="controls">
			<cfinput type="text" name="last_name" id="last_name" value="#last_name#" required="yes" message="Please enter a last name." class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="first_name" class="control-label">First Name</label>
		<div class="controls">
			<cfinput type="text" name="first_name" id="first_name" value="#first_name#" required="yes" message="Please enter a first name." class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="middle_initial" class="control-label">Middle Initial</label>
		<div class="controls">
			<input type="text" name="middle_initial" id="middle_initial" value="#middle_initial#" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="credentials" class="control-label">Credentials</label>
		<div class="controls">
			<input type="text" name="credentials" id="credentials" value="#credentials#" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="birth_date" class="control-label">Birthday</label>
		<div class="controls">
			<input type="date" name="birth_date" id="birth_date" min="1911-02-02" max="#dateformat(dateadd('yyyy',now(),-14), 'yyyy-mm-dd')#" value="#dateformat(birth_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
		</div>
	</div>
	<div class="control-group">
		<label for="uupic" class="control-label"><abbr title="Social Security Number">uupic</abbr></label>
		<div class="controls">
			<input type="text" name="uupic" id="uupic" value="#uupic#" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="photo_path" class="control-label">Picture</label>
		<div class="controls">
			<input type="text" name="photo_path" id="photo_path" value="#photo_path#" class="span3" /><!--- $issue$ <input type="file" name="photo_path" size="20" value=""> --->
		</div>
	</div>
	<div class="control-group">
		<label for="biography" class="control-label">Biography</label>
		<div class="controls">
			<textarea name="biography" id="biography" maxlength="4000" wrap="soft" rows="7" class="span3">#stripcr(biography)#</textarea>
		</div>
	</div>
	</fieldset>
	<fieldset>
		<legend><h3>Contact</h3></legend>
		<cfif get_phone_types.recordcount OR get_email_types.recordcount>
			<cfinclude template="dsp_phone_email_column.cfm">
		</cfif>
		<cfif get_locations.recordcount>
			<cfinclude template="dsp_locations_column.cfm">
		</cfif>
	</fieldset>
	<fieldset>
		<legend><h3>General</h3></legend>
	<div class="control-group">
		<label for="employment_position_id" class="control-label">Position Number</label>
		<div class="controls">
		<cfif isdefined("attributes.user_account_id")>
			<span id="employment_position_id">Can't be changed from this screen.</span>
		<cfelse>
			<cfselect name="employment_position_id" id="employment_position_id" query="get_open_positions" value="employment_position_id" display="employment_position_id" required="yes" message="You must select a position number to enter this employee into workstream." class="span3">
					<option value="-1">-1</option>
			</cfselect>
			<p class="help-block">If the position number drop-down is empty, or you can't find the appropriate position number, you need to mark the incumbant as inactive or have a new position approved.</p>
		</cfif>
		</div>
	</div>
	<div class="control-group">
		<label for="hire_date" class="control-label">Hire date</label>
		<div class="controls">
			<input type="date" name="hire_date" id="hire_date" min="#application.application_specific_settings.workstream_start_date#" max="#dateformat(now(), 'yyyy-mm-dd')#" value="#dateformat(hire_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
		</div>
	</div>
	<div class="control-group">
		<label for="company_id" class="control-label">Company</label>
		<div class="controls">
			<cfselect query="get_teams" name="company_id" id="company_id" value="company_id" display="company" selected="#company_id#" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="employee_classification" class="control-label">Employee Classification</label>
		<div class="controls">
			<cfselect name="employee_classification" id="employee_classification" query="get_ref_employee_classification" selected="#employee_classification_id#" value="employee_classification_id" display="employee_classification" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="visable_company" class="control-label">Visible Companies</label>
		<div class="controls">
			<select name="visable_company" id="visable_company" size="#min(get_teams.recordcount,3)#" multiple="multiple" class="span3"><cfloop query="get_teams">
				<option value="#company_id#"<cfif listcontains(visable_company,company_id)> selected="selected"</cfif>>#company#</option></cfloop> 
			</select>
		</div>
	</div>
	<div class="control-group">
		<label for="account_type_id" class="control-label">User Type</label>
		<div class="controls">
			<cfselect name="account_type_id" id="account_type_id" selected="#account_type_id#" query="get_ref_account_type" value="account_type_id" display="description" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="supervisor_id" class="control-label">Supervisor</label>
		<cfif isdefined("attributes.user_account_id")>
			<span id="supervisor_id">Can't be changed from this screen.</span><input type="hidden" name="supervisor_id" value="#supervisor_id#">
		<cfelse>
		<div class="controls">
			<cfmodule template="../common_files/dsp_team_select.cfm" multi="1" valuelist="false" element_name="supervisor_id" selected_value_ind="0" message="Please select a supervisor." user_account_id="#supervisor_id#" class="span3">
		</div>
		</cfif>
	</div>
	<div class="control-group">
		<label for="overtime_elligible_ind" class="control-label">Overtime Paid</label>
		<div class="controls">
			<select name="overtime_elligible_ind" id="overtime_elligible_ind" class="span3">
				<option value="0">No</option>
				<option value="1">Yes</option>
			</select>
		</div>
	</div>
	<div class="control-group">
		<label for="pto_override" class="control-label"><abbr title="Paid Time Off">PTO</abbr> Annual Accrual</label>
		<div class="controls">
			<input type="number" name="pto_override" id="pto_override" min="0" max="204" step="0.1" class="span3" />
			<p class="help-block">If not standard accrual, enter a valid number for PTO Annual Hours Accrued</p>
		</div>
	</div>
	</fieldset>
	<div class="form-actions">
		<input type="hidden" name="user_account_id" value="<cfif isdefined("attributes.user_account_id")>#attributes.user_account_id#</cfif>">
		<input type="submit" name="submit" value="<cfif NOT comparenocase(attributes.fuseaction, "emp_edit")>Update Account<cfelse>Enter Record</cfif>" class="btn btn-primary" />
		<input type="reset" value="Reset" class="btn" />
	</div>
</cfoutput>
