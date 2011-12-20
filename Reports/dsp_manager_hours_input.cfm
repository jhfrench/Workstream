
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
		<td class="RegText">From: <cfinput type="Text" name="From_date" required="yes" size="9" validate="date" message="You must enter a valid from date" class="RegText"></td>
		<td class="RegText">To: <cfinput type="Text" name="through_date" required="yes" size="9" validate="date" message="You must enter a valid through date" class="RegText"></td>
	</tr>
	<tr>
		<td colspan="2" valign="top" class="RegText">
			<label for="all_employees"><input type="checkbox" name="all_employees" id="all_employees" onclick="document.forms.all_employees.submit();" value="#all_employees_change#"> View <cfif compare(attributes.all_employees, 0)>Only Active<cfelse>Inactive</cfif> Employees</label>
		</td>
	</tr>
	<tr>
		<td valign="top" class="RegText">Included Employees:</td>
		<td class="RegText">
</cfoutput>
				<cfselect name="included_emp_id" multiple="Yes" size="#min(variables.recordcount,25)#" class="RegText">
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
		<td align="center" colspan="2"><input type="submit" value="Generate Report" class="RegText"></td>
	</tr>
</cfoutput>