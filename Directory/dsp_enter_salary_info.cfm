
<!--Directory/dsp_enter_salary_info.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I allow a user to enter salary info for an employee.
	||
	Name: Jeromy French
	||
	Edits:
$Log:

	 || 
	END FUSEDOC --->

			<cfoutput>
			<span class="SubHeadText">Enter Salary Info</span><br />
			<table>
			<tr>
				<td width="25%">Date</td>
				<td width="25%">Title</td>
			</tr>
			</cfoutput>
			<cfoutput query="get_emp_benefits_info">
				<tr>
					<td>#date_start#</td>
					<td>#title#</td>
				</tr>
			</cfoutput>
			</table>


