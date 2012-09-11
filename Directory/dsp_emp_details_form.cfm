
<!--Directory/dsp_emp_details_form.cfm
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
		<label for="lname">Last Name</label>
		<div class="controls">
			<cfinput type="text" name="lname" id="lname" value="#lname#" required="yes" message="Please enter a last name." class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="name">First Name</label>
		<div class="controls">
			<cfinput type="text" name="name" id="name" value="#name#" required="yes" message="Please enter a first name." class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="mi">Middle Initial</label>
		<div class="controls">
			<input type="text" name="mi" id="mi" value="#mi#" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="credentials">Credentials</label>
		<div class="controls">
			<input type="text" name="credentials" id="credentials" value="#credentials#" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="dob">Birthday</label>
		<div class="controls">
			<input type="date" name="dob" id="dob" min="1911-02-02" max="#dateformat(dateadd('yyyy',now(),-14), 'yyyy-mm-dd')#" value="#dateformat(dob, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
			<!-- USE CF to create client validation <cfinput type="text" name="dob"required="yes" validate="date" message="Please enter a properly formatted birthdate." size="11"> -->
		</div>
	</div>
	<div class="control-group">
		<label for="ssn"><abbr title="Social Security Number">SSN</abbr></label>
		<div class="controls">
			<cfinput type="text" name="ssn" id="ssn" value="#ssn#" required="yes" validate="social_security_number" message="Please enter a properly formatted SSN." class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="photo">Picture</label>
		<div class="controls">
			<input type="text" name="photo" id="photo" value="#photo#" class="span3" /><!--- $issue$ <input type="file" name="photo" size="20" value=""> --->
		</div>
	</div>
	<div class="control-group">
		<label for="biography">Biography</label>
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
		<label for="position_id">Position Number</label>
		<div class="controls">
		<cfif isdefined("attributes.emp_id")>
			<span id="position_id">Can't be changed from this screen.</span>
		<cfelse>
			<cfselect name="position_id" id="position_id" query="get_position_numbers" value="position_ID" display="position_id" required="yes" message="You must select a position number to enter this employee into workstream." class="span3">
					<option value="-1">-1</option>
			</cfselect>
			<p class="help-block">If the position number drop-down is empty, or you can't find the appropriate position number, you need to mark the incumbant as inactive or have a new position approved.</p>
		</cfif>
		</div>
	</div>
	<div class="control-group">
		<label for="hire_date">Hire date</label>
		<div class="controls">
			<input type="date" name="hire_date" id="hire_date" min="#application.application_specific_settings.workstream_start_date#" max="#dateformat(now(), 'yyyy-mm-dd')#" value="#dateformat(hire_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
			<!-- Use CF to create client validation <cfinput type="text" name="hire_date" value="#dateformat(hire_date, 'm/d/yyyy')#" required="yes" validate="date" message="Please enter a properly formatted hire date." size="11"> -->
		</div>
	</div>
	<div class="control-group">
		<label for="company_id">Company</label>
		<div class="controls">
			<cfselect query="get_teams" name="company_id" id="company_id" value="company_id" display="company" selected="#company_id#" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="manager_non_id">Manager/Non</label>
		<div class="controls">
			<select name="manager_non_id" id="manager_non_id" class="span3">
				<option value="1"<cfif manager_non_id EQ "1"> selected="selected"</cfif>>Manager</option>
				<option value="0"<cfif manager_non_id EQ "0"> selected="selected"</cfif>>Non-Manager</option>
			</select>
		</div>
	</div>
	<div class="control-group">
		<label for="employee_classification">Employee Classification</label>
		<div class="controls">
			<cfselect name="employee_classification" id="employee_classification" query="get_employee_classification" selected="#employee_classification_id#" value="employee_classification_id" display="employee_classification" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="visable_company">Visible Companies</label>
		<div class="controls">
			<select name="visable_company" id="visable_company" size="#min(get_teams.recordcount,3)#" multiple="multiple" class="span3"><cfloop query="get_teams">
				<option value="#company_id#"<cfif listcontains(visable_company,company_id)> selected="selected"</cfif>>#company#</option></cfloop> 
			</select>
		</div>
	</div>
	<div class="control-group">
		<label for="emp_contact_type">User Type</label>
		<div class="controls">
			<cfselect name="emp_contact_type" id="emp_contact_type" selected="#emp_contact_type#" query="get_user_type" value="emp_contact_id" display="emp_contact_type" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="employee_type">Employee Type</label>
		<div class="controls">
			<cfselect name="employee_type" id="employee_type" selected="#employee_type_id#" query="qry_get_employee_type" value="employee_type_id" display="employee_type" class="span3" />
		</div>
	</div>
	<div class="control-group">
		<label for="supervisor_id">Supervisor</label>
		<cfif isdefined("attributes.emp_id")>
			<span id="supervisor_id">Can't be changed from this screen.</span><input type="hidden" name="supervisor_id" value="#supervisor_id#">
		<cfelse>
		<div class="controls">
			<cfmodule template="../common_files/dsp_team_select.cfm" multi="1" valuelist="false" element_name="supervisor_id" selected_flag="0" message="Please select a supervisor." emp_id="#supervisor_id#" class="span3">
		</div>
		</cfif>
	</div>
	<cfif isdefined("attributes.emp_id")>
	<div class="control-group">
		<label for="effective_from">Date Change Effective</label>
		<div class="controls">
			<input type="date" name="effective_from" id="effective_from" value="#dateformat(now(),'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
		</div>
	</div>
	</cfif>
	<div class="control-group">
		<label for="overtime">Overtime Paid</label>
		<div class="controls">
			<select name="overtime" id="overtime" class="span3">
				<option value="0">No</option>
				<option value="1">Yes</option>
			</select>
		</div>
	</div>
	<div class="control-group">
		<label for="pto_override">PTO Annual Accrual</label>
		<div class="controls">
			<input type="number" name="pto_override" id="pto_override" min="0" max="204" step="0.1" class="span3" />
			<p class="help-block">If not standard accrual, enter a valid number for PTO Annual Hours Accrued</p>
		</div>
	</div>
	</fieldset>
	<div class="form-actions">
		<input type="hidden" name="emp_id" value="<cfif isdefined("attributes.emp_id")>#attributes.emp_id#</cfif>">
		<input type="submit" name="submit" value="<cfif NOT comparenocase(attributes.fuseaction, "emp_edit")>Update Account<cfelse>Enter Record</cfif>" class="btn btn-primary" />
		<input type="reset" value="Reset" class="btn" />
	</div>
</cfoutput>
