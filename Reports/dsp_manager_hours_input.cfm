
<!--Reports/dsp_manager_hours_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the input screen for the Individual hours report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:07:48  stetzer
	<>

	Revision 1.1  2001-10-11 11:04:11-04  long
	added $log $ for edits.  To all CFM files that have fusedocs.
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##008080">
		<td colspan="2" class="HeadText#session.workstream_text_size#White">Manager Hours Report</td>
	</tr>
	<tr bgcolor="##5F5F5F">
		<td colspan="2" class="RegText#session.workstream_text_size#White">Enter Dates (mm/dd/yyyy)</td>
	</tr>
	<tr>	
		<td class="RegText#session.workstream_text_size#">From: <cfinput type="Text" name="From_date" required="yes" size="9" validate="date" message="You must enter a valid from date" class="RegText#session.workstream_text_size#"></td>
		<td class="RegText#session.workstream_text_size#">To: <cfinput type="Text" name="through_date" required="yes" size="9" validate="date" message="You must enter a valid through date" class="RegText#session.workstream_text_size#"></td>
	</tr>
	<tr>
		<td colspan="2" valign="top" class="RegText#session.workstream_text_size#">
			<label for="all_employees"><input type="Checkbox" name="all_employees" id="all_employees" onClick="document.forms.all_employees.submit();" value="#all_employees_change#"> View <cfif compare(attributes.all_employees, 0)>Only Active<cfelse>Inactive</cfif> Employees</label>
		</td>
	</tr>
	<tr>
		<td valign="top" class="RegText#session.workstream_text_size#">Included Employees:</td>
		<td class="RegText#session.workstream_text_size#">
</cfoutput>
				<cfselect name="included_emp_id" multiple="Yes" size="#min(variables.recordcount,25)#" class="RegText#session.workstream_text_size#">
				<cfif variables.all_option>
					<cfoutput query="team_select">
					<option value="#emp_id#" SELECTED>#display#</option>
					</cfoutput>
				<cfelse>
					<cfoutput query="get_subordinates">
					<option value="#emp_id#" SELECTED>#display#</option>
					</cfoutput>
				</cfif>
				</cfselect>
		</td>
	</tr>
<cfoutput>
	<tr>
		<td align="center" colspan="2"><input type="Submit" value="Generate Report" class="RegText#session.workstream_text_size#"></td>
	</tr>
</cfoutput>