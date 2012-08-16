
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
		<tr valign="top">
			<td class="SubHeadText">&nbsp;Personal</td>
			<td colspan="2">
				<font color=red>Last Name</font>: <cfinput type="text" name="lname" value="#lname#" required="yes" message="Please enter a last name." size="15">&nbsp;
				<font color=red>First Name</font>: <cfinput type="text" name="name" required="yes" value="#name#" message="Please enter a first name." size="15">&nbsp;
				Middle Initial: <cfinput type="text" name="mi" required="no" value="#mi#" size="2">&nbsp;
				Credentials: <cfinput type="text" name="credentials" value="#credentials#" size="10">
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2">
				<font color=red>Birthday</font>: 
				<input type="date" name="dob" id="dob" min="1911-02-02" max="#dateformat(dateadd('yyyy',now(),-14), 'yyyy-mm-dd')#" value="#dateformat(dob, 'yyyy-mm-dd')#"  maxlength="10" required="required" class="span6 date" />&nbsp;
			<!-- USE CF to create client validation <cfinput type="text" name="dob"required="yes" validate="date" message="Please enter a properly formatted birthdate." size="11"> -->
				<font color=red>SSN</font>: <cfinput type="text" name="ssn" value="#ssn#" required="yes" validate="social_security_number" message="Please enter a properly formatted SSN." size="11">&nbsp;
				<font color=red>Pin:</font> <cfinput type="text" name="pin" value="#pin#" required="yes" message="Please enter a pin." size="6">&nbsp;
				Picture: <input type="text" name="photo" size="10" value="#photo#"><!--- <input type="file" name="photo" size="20" value=""> --->
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2">
				Biography<br />
				<textarea name="biography" maxlength="4000" wrap="soft" rows="7" cols="110">#stripcr(biography)#</textarea>
			</td>
		</tr>
		<tr valign="top">
			<td class="SubHeadText">&nbsp;Contact</td>
			<td>
				<cfif get_phone_types.recordcount OR get_email_types.recordcount>
					<cfinclude template="dsp_phone_email_column.cfm">
				</cfif>
			</td>
			<td>
				<cfif get_locations.recordcount>
					<cfinclude template="dsp_locations_column.cfm">
				</cfif>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<table border="0">

					<tr valign="top">
						<td class="SubHeadText" colspan="3">
							&nbsp;General
						</td>
					</tr>
								<tr>
						<td class="SubHeadText">&nbsp;</td>
						<td align="right"><font color=red>Position Num</font>:</td>
						<td align="left" colspan=100%>
						<cfif isdefined("attributes.emp_id")>
						Can't be changed from this screen.
						<cfelse>
						<cfselect name="position_id" query="get_position_numbers" value="position_ID" display="position_id" required="yes" message="You must select a position number to enter this employee into workstream.">
						<option value="-1">-1</option>
</cfselect> **
						</cfif>

</td>
	
					</tr>



					<tr>
						<td class="SubHeadText">&nbsp;</td>
						<td align="right">Hire date: </td>
						<td align="left">
							<input type="date" name="hire_date" id="hire_date" min="#application.application_specific_settings_workstream_start_date#" max="#dateformat(now(), 'yyyy-mm-dd')#" value="#dateformat(hire_date, 'yyyy-mm-dd')#"  maxlength="10" required="required" class="span6 date" />
							<!-- Use CF to create client validation <cfinput type="text" name="hire_date" value="#dateformat(hire_date, 'm/d/yyyy')#" required="yes" validate="date" message="Please enter a properly formatted hire date." size="11"> -->
						</td>
						<td align="right"><font color=red>Company: </td>
						<td align="left"><cfselect query="get_teams" name="company_id" value="company_id" display="company" selected="#company_id#"></cfselect></td>
					</tr>
					<tr>
						<td class="SubHeadText">&nbsp;</td>
						<td align="right">Manager/Non:<br />Employee Classification:</td>
						<td align="left"><select name="manager_non_id">
							<option value="1"<cfif manager_non_id EQ "1"> selected="selected"</cfif>>Manager</option>
							<option value="0"<cfif manager_non_id EQ "0"> selected="selected"</cfif>>Non-Manager</option>
						</select><br /><cfselect name="employee_classification" query="get_employee_classification" selected="#employee_classification_id#" value="employee_classification_id" display="employee_classification"></cfselect></td>
						<td align="right" valign="top">Visible Companies:</td>
						<td>
				<select name="visable_company" size="#min(get_teams.recordcount,3)#" multiple="multiple">
</cfoutput>
							<cfoutput query="get_teams">
								<option value="#company_id#"<cfif listcontains(visable_company,company_id)> selected="selected"</cfif>>#company#</option>
							</cfoutput> 
				        </select>
						</td>
					</tr>
<cfoutput>
					<tr>
						<td class="SubHeadText">&nbsp;</td>
						<td align="right">User Type:<br />Employee Type:</td>
						<td align="left"><cfselect name="emp_contact_type"  selected="#emp_contact_type#" query="get_user_type" value="emp_contact_id" display="emp_contact_type"></cfselect><br /><cfselect name="employee_type"  selected="#employee_type_id#" query="qry_get_employee_type" value="employee_type_id" display="employee_type"></cfselect></td>
						<td align="right" valign="top"><font color=red>Supervisor</font>: </td>
						<td align="left" valign="top">
<cfif isdefined("attributes.emp_id")>
	Can't be changed from this screen.<input type="hidden" name="supervisor_id" value="#supervisor_id#">
<cfelse>
	<cfmodule template="../common_files/dsp_team_select.cfm" multi="1" valuelist="false" element_name="supervisor_id" selected_flag="0" message="Please select a supervisor." emp_id="#supervisor_id#" size="3">
</cfif>
						</td>
					</tr>
					<cfif isdefined("attributes.emp_id")>
					<tr>
						<td class="SubHeadText">&nbsp;</td>
						<td align="right">Date Change Effective: </td>
						<td align="left">
							<input type="date" name="effective_from" id="effective_from" value="#dateformat(now(),'yyyy-mm-dd')#" min="#application.application_specific_settings_workstream_start_date#" maxlength="10" required="required" class="span3 date" />
						</td>
						<td align="right">&nbsp;</td>
						<td align="left">&nbsp;</td>
					</tr>
					</cfif>
					<tr>
						<td class="SubHeadText">&nbsp;</td>
						<td align="right">Overtime Paid:</td>
						<td align="left"><select name="overtime">
							<option value="0">No</option>
							<option value="1">Yes</option>
						</select></td>
						<td align="right">PTO Annual Accrual (if not standard accrual): </td>
						<td align="left"><cfinput type="text" name="PTO_override" value="" required="no"  size="3" validate="float" message="Please enter a valid number for PTO Annual Hours Accrued.">
<input type="hidden" name="emp_id" value="<cfif isdefined("attributes.emp_id")>#attributes.emp_id#</cfif>"></td>
					</tr>
				<tr>
				<td colspan="100%" align="left"><i>** If the position number drop-down is empty, or you can't find the appropriate position number, you need to mark the incumbant as inactive or have a new position approved.</i> </td>
				</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td colspan="3" align="center">
				<hr color="##970000" size="1">
				<input type="reset" value="Reset Record"> | <input type="submit" value="<cfif attributes.fuseaction EQ "emp_edit">Update Account<cfelse>Enter Record</cfif>">
			</td>
		</tr>
		</cfoutput>
