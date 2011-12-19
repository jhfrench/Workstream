
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
			<span class="SubHeadText#session.workstream_text_size#">Enter Salary Info</span><br>
			<table>
			<tr>
				<td class="RegText#session.workstream_text_size#" width="25%">Date</td>
				<td class="RegText#session.workstream_text_size#" width="25%">Title</td>
			</tr>
			</cfoutput>
			<cfoutput query="get_emp_benefits_info">
				<tr>
					<td class="RegText#session.workstream_text_size#">#date_start#</td>
					<td class="RegText#session.workstream_text_size#">#title#</td>
				</tr>
			</cfoutput>
			</table>


