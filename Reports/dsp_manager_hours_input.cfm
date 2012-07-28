
<!--Reports/dsp_manager_hours_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the input screen for the Individual hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##008080">
		<td colspan="2" class="HeadTextWhite">Manager Hours Report</td>
	</tr>
	<tr bgcolor="##5F5F5F">
		<td colspan="2" class="RegTextWhite">Enter Dates (mm/dd/yyyy)</td>
	</tr>
	<tr>
		<td>From: <cfinput type="text" name="From_date" required="yes" size="9" validate="date" message="You must enter a valid from date"></td>
		<td>To: <cfinput type="text" name="through_date" required="yes" size="9" validate="date" message="You must enter a valid through date"></td>
	</tr>
	<tr>
		<td colspan="2" valign="top">
			<label for="all_employees"><input type="checkbox" name="all_employees" id="all_employees" onclick="document.forms.all_employees.submit();" value="#all_employees_change#"> View <cfif compare(attributes.all_employees, 0)>Only Active<cfelse>Inactive</cfif> Employees</label>
		</td>
	</tr>
	<tr>
		<td valign="top">Included Employees:</td>
		<td>
</cfoutput>
				<cfselect name="included_emp_id" multiple="Yes" size="#min(variables.recordcount,25)#">
				<cfif variables.all_option>
					<cfoutput query="get_team_select">
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
		<td align="center" colspan="2"><input type="submit" value="Generate Report"></td>
	</tr>
</cfoutput>