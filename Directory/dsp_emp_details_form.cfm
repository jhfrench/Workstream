
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
Revision 1.3  2006/04/17 22:42:35  stetzer
Added -1 option for Pos Num for contractors and non-LCG people

Revision 1.2  2006-01-30 12:11:44-05  stetzer
Made pos number non-editable on emp_edit path

Revision 1.1  2006-01-10 15:49:03-05  stetzer
Added Position Number as a required field

Revision 1.0  2005-02-15 15:46:34-05  daugherty
Initial revision

Revision 1.5  2002-04-15 15:52:57-04  lee
added overtime and PTO Bank Hours entries

Revision 1.4  2002-03-08 16:22:32-05  long
changed to accomidate new data fields, and added the ability to prepopulate the form with data, so as to make this an edit form also

Revision 1.3  2001-11-06 16:37:14-05  long
added code to allow the selection of whether or not the -----#company_name#-----caption returns the list of employees or not.

Revision 1.2  2001-10-16 17:07:28-04  french
Finishing first implementation of employee entry function.

Revision 1.1  2001-10-11 10:56:12-04  long
Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
</cfsilent>
		<cfoutput>
		<tr valign="top">
			<td class="SubHeadText#session.workstream_text_size#">&nbsp;Personal</td>
			<td colspan="2" class="RegText#session.workstream_text_size#">
				<font color=red>Last Name</font>: <cfinput type="text" name="lname" value="#lname#" required="yes" message="Please enter a last name." size="15" class="RegText#session.workstream_text_size#">&nbsp;
				<font color=red>First Name</font>: <cfinput type="text" name="name" required="yes" value="#name#" message="Please enter a first name." size="15" class="RegText#session.workstream_text_size#">&nbsp;
				Middle Initial: <cfinput type="text" name="mi" required="no" value="#mi#" size="2" class="RegText#session.workstream_text_size#">&nbsp;
				Credentials: <cfinput type="text" name="credentials" value="#credentials#" size="10" class="RegText#session.workstream_text_size#">
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" class="RegText#session.workstream_text_size#">
				<font color=red>Birthday</font>: <cfinput type="text" name="dob" value="#dateformat(dob, 'mm/dd/yyyy')#" required="Yes" validate="date" message="Please enter a properly formatted birthdate." size="11" class="RegText#session.workstream_text_size#">&nbsp;
				<font color=red>SSN</font>: <cfinput type="text" name="ssn" value="#ssn#" required="Yes" validate="social_security_number" message="Please enter a properly formatted SSN." size="11" class="RegText#session.workstream_text_size#">&nbsp;
				<font color=red>Pin:</font> <cfinput type="text" name="pin" value="#pin#" required="Yes" message="Please enter a pin." size="6" class="RegText#session.workstream_text_size#">&nbsp;
				Picture: <input type="text" Name="photo" size="10" value="#photo#" class="RegText#session.workstream_text_size#"><!--- <input type="file" name="photo" size="20" value="" class="RegText#session.workstream_text_size#"> --->
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2" class="RegText#session.workstream_text_size#">
				Biography<br>
				<textarea name="biography" maxlength="4000" wrap="soft" rows="7" cols="110" class="RegText#session.workstream_text_size#">#StripCR(biography)#</textarea>
			</td>
		</tr>
		<tr valign="top">
			<td class="SubHeadText#session.workstream_text_size#">&nbsp;Contact</td>
			<td class="RegText#session.workstream_text_size#">
				<cfif get_phone_types.recordcount OR get_email_types.recordcount>
					<cfinclude template="dsp_phone_email_column.cfm">
				</cfif>
			</td>
			<td class="RegText#session.workstream_text_size#">
				<cfif get_locations.recordcount>
					<cfinclude template="dsp_locations_column.cfm">
				</cfif>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<table border="0">
					
					<tr valign="top">
						<td class="SubHeadText#session.workstream_text_size#" colspan="3">
							&nbsp;General
						</td>
					</tr>
								<tr>
						<td class="SubHeadText#session.workstream_text_size#">&nbsp;</td>
						<td class="RegText#session.workstream_text_size#" align="right"><font color=red>Position Num</font>:</td>
						<td class="RegText#session.workstream_text_size#" align="left" colspan=100%>
						<cfif isdefined("attributes.emp_id")>
						Can't be changed from this screen.
						<cfelse>			
						<cfselect name="Position_ID" class="RegText#session.workstream_text_size#" query="get_position_numbers" value="position_ID" display="position_id" required="Yes" message="You must select a position number to enter this employee into workstream.">
						<option value="-1">-1</option>
</cfselect> **
						</cfif>
			
</td>
						
					</tr>
					
					
					
					<tr>
						<td class="SubHeadText#session.workstream_text_size#">&nbsp;</td>
						<td class="RegText#session.workstream_text_size#" align="right">Hire date: </td>
						<td class="RegText#session.workstream_text_size#" align="left"><cfinput type="text" name="hire_date" value="#DateFormat(hire_date, 'mm/dd/yyyy')#" required="Yes" validate="date" message="Please enter a properly formatted hire date." size="11" class="RegText#session.workstream_text_size#"></td>
						<td class="RegText#session.workstream_text_size#" align="right"><font color=red>Company: </td>
						<td class="RegText#session.workstream_text_size#" align="left"><cfselect query="get_teams" name="company_id" value="company_id" display="company" selected="#company_id#" class="RegText#session.workstream_text_size#"></cfselect></td>
					</tr>
					<tr>
						<td class="SubHeadText#session.workstream_text_size#">&nbsp;</td>
						<td class="RegText#session.workstream_text_size#" align="right">Manager/Non:<br>Employee Classification:</td>
						<td class="RegText#session.workstream_text_size#" align="left"><select name="manager_non_id" class="RegText#session.workstream_text_size#">
							<option value="1"<cfif manager_non_id EQ "1">Selected</cfif>>Manager</option>
							<option value="0"<cfif manager_non_id EQ "0">Selected</cfif>>Non-Manager</option>
						</select><br><cfselect name="employee_classification" query="get_employee_classification" selected="#employee_classification_id#" value="employee_classification_id" display="employee_classification" class="RegText#session.workstream_text_size#"></cfselect></td>
						<td class="RegText#session.workstream_text_size#" align="right" valign="top">Visible Companies:</td>
						<td class="RegText#session.workstream_text_size#">
				<select name="visable_company" size="#min(get_teams.recordcount,3)#" multiple class="RegText#session.workstream_text_size#">
</cfoutput>
							<cfoutput query="get_teams">
								<option value="#company_id#"<cfif listcontains(visable_company,company_id)> selected</cfif>>#company#</option>
							</cfoutput> 
				        </select>
						</td>
					</tr>
<cfoutput>
					<tr>
						<td class="SubHeadText#session.workstream_text_size#">&nbsp;</td>
						<td class="RegText#session.workstream_text_size#" align="right">User Type:<br>Employee Type:</td>
						<td class="RegText#session.workstream_text_size#" align="left"><cfselect name="emp_contact_type"  selected="#emp_contact_type#" query="get_user_type" value="emp_contact_id" display="emp_contact_type" class="RegText#session.workstream_text_size#"></cfselect><br><cfselect name="employee_type"  selected="#employee_type_id#" query="qry_get_employee_type" value="employee_type_id" display="employee_type" class="RegText#session.workstream_text_size#"></cfselect></td>
						<td class="RegText#session.workstream_text_size#" align="right" valign="top"><font color=red>Supervisor</font>: </td>
						<td class="RegText#session.workstream_text_size#" align="left" valign="top">
<cfif isdefined("attributes.emp_id")>
	Can't be changed from this screen.<input type="hidden" name="supervisor_id" value="#supervisor_id#">
<cfelse>
	<cfmodule template="../common_files/dsp_team_select.cfm" multi="1" valuelist="false" element_name="supervisor_id" selected_flag="0" message="Please select a supervisor." emp_id="#supervisor_id#" size="3" class="RegText#session.workstream_text_size#">
</cfif>
						</td>
					</tr>
					<cfif isdefined("attributes.emp_id")>
					<tr>
						<td class="SubHeadText#session.workstream_text_size#">&nbsp;</td>
						<td class="RegText#session.workstream_text_size#" align="right">Date Change Effective: </td>
						<td class="RegText#session.workstream_text_size#" align="left"><cfinput type="Text" name="effective_from" required="Yes" validate="date" message="You must provide a date that the change becomes effective." value="#DateFormat(now(), 'mm/dd/yyyy')#" maxlength="10" size="11" class="RegText#session.workstream_text_size#"></td>
						<td class="RegText#session.workstream_text_size#" align="right">&nbsp;</td>
						<td class="RegText#session.workstream_text_size#" align="left">&nbsp;</td>
					</tr>
					</cfif>
					<tr>
						<td class="SubHeadText#session.workstream_text_size#">&nbsp;</td>
						<td class="RegText#session.workstream_text_size#" align="right">Overtime Paid:</td>
						<td class="RegText#session.workstream_text_size#" align="left"><select name="overtime" class="RegText#session.workstream_text_size#">
							<option value="0">No</option>
							<option value="1">Yes</option>
						</select></td>
						<td class="RegText#session.workstream_text_size#" align="right">PTO Annual Accrual (if not standard accrual): </td>
						<td class="RegText#session.workstream_text_size#" align="left"><cfinput type="text" name="PTO_override" value="" required="no"  size="3" class="RegText#session.workstream_text_size#" validate="float" message="Please enter a valid number for PTO Annual Hours Accrued.">
<input type="Hidden" name="emp_id" value="<cfif isdefined("attributes.emp_id")>#attributes.emp_id#</cfif>"></td>
					</tr>
				<tr>
				<td colspan="100%" class="RegText#session.workstream_text_size#" align="left"><i>** If the position number drop-down is empty, or you can't find the appropriate position number, you need to mark the incumbant as inactive or have a new position approved.</i> </td>
				</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td colspan="3" align="center" class="RegText#session.workstream_text_size#">
				<hr color="##970000" size="1">
				<input type="reset" value="Reset Record" class="RegText#session.workstream_text_size#"> | <input type="submit" value="<cfif attributes.fuseaction EQ "emp_edit">Update Account<cfelse>Enter Record</cfif>" class="RegText#session.workstream_text_size#">
			</td>
		</tr>
		</cfoutput>
