
<!--Reports/dsp_employee_force_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row headers for the employee's ForcePlanner report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<cfform name="date_range" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST"><input type="hidden" name="emp_id" value="#variables.emp_id#">
	<tr bgcolor="##5F5F5F" class="HeadTextWhite">
		<td colspan="8" align="left" valign="bottom" class="SubHeadTextWhite">
			&nbsp;Tasks due between <cfinput type="datefield" name="from_date" value="#attributes.from_date#" size="10" validate="date"> and <cfinput type="datefield" name="to_date" value="#attributes.to_date#" size="10" validate="date">&nbsp;<label for="show_completed"><input type="Checkbox"<cfif isdefined("attributes.show_completed")> checked</cfif> onclick="javascript:document.date_range.submit();" name="show_completed" id="show_completed">Show only completed tasks</label>&nbsp;<label for="show_budgeted"><input type="Checkbox"<cfif isdefined("attributes.show_budgeted")> checked</cfif> onclick="javascript:document.date_range.submit();" name="show_budgeted" id="show_budgeted">Show only budgeted tasks</label>&nbsp;<input type="submit" value="Retrieve tasks">
		</td>
	</tr>
</cfform>
	<tr bgcolor="##c0c0c0" class="SubHeadText">
		<td valign="bottom" class="SubHeadText">
			Project
		</td>
		<td valign="bottom" class="SubHeadText">
			Task
		</td>
		<td valign="bottom" class="SubHeadText">
			Billable
		</td>
		<td valign="bottom" class="SubHeadText">
			Priority
		</td>
		<td valign="bottom" class="SubHeadText">
			Status
		</td>
		<td valign="bottom" class="SubHeadText">
			Date Due
		</td>
		<td valign="bottom" class="SubHeadText">
			Date Completed
		</td>
		<td valign="bottom" class="SubHeadText">
			Time
		</td>
	</tr>
</cfoutput>

