
<!--Directory/dsp_enter_salary_info.cfm
	Author: Damon S -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I allow a user to enter salary info for an employee.
	||
	Name: Damon Scott
	||
	Edits:
$Log:

	||
	END FUSEDOC --->

			<cfoutput>
			<span class="SubHeadText">Enter Salary Info</span><br>
			<table>
			<tr>
				<td class="RegText" width="25%">Date</td>
				<td class="RegText" width="25%">Title</td>
			</tr>
			</cfoutput>
			<cfoutput query="get_emp_benefits_info">
				<tr>
					<td class="RegText">#date_start#</td>
					<td class="RegText">#title#</td>
				</tr>
			</cfoutput>
			</table>


