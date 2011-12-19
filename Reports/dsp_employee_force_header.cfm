
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
	<tr bgcolor="##5F5F5F" class="HeadText#session.workstream_text_size#White">
		<td colspan="8" align="left" valign="bottom" class="SubHeadText#session.workstream_text_size#White">
			&nbsp;Tasks due between <cfinput type="datefield" name="from_date" value="#attributes.from_date#" size="10" validate="date" class="RegText#session.workstream_text_size#"> and <cfinput type="datefield" name="to_date" value="#attributes.to_date#" size="10" validate="date" class="RegText#session.workstream_text_size#">&nbsp;<label for="show_completed"><input type="Checkbox"<cfif isdefined("attributes.show_completed")> checked</cfif> onClick="javascript:document.date_range.submit();" name="show_completed" id="show_completed" class="RegText#session.workstream_text_size#">Show only completed tasks</label>&nbsp;<label for="show_budgeted"><input type="Checkbox"<cfif isdefined("attributes.show_budgeted")> checked</cfif> onClick="javascript:document.date_range.submit();" name="show_budgeted" id="show_budgeted" class="RegText#session.workstream_text_size#">Show only budgeted tasks</label>&nbsp;<input type="Submit" value="Retrieve tasks" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfform>
	<tr bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Project
		</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Task
		</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Billable
		</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Priority
		</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Status
		</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Date Due
		</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Date Completed
		</td>
		<td valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Time
		</td>
	</tr>
</cfoutput>

