
<!--Directory/dsp_emp_job_titles.cfm
	Author: Damon S -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display an employee's job title info.
	||
	Name: Damon Scott
	||
	Edits:
$Log:

	||
	END FUSEDOC --->
</cfsilent>

			<cfoutput>
			<span class="SubHeadText">Job Title Info <a href="##" onclick="window.open('index.cfm?fuseaction=Directory.job_title_entry&emp_id=#attributes.emp_id#', 'Job', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=125');">ADD</a></span><br />
			<table>
			<tr>
				<td class="RegText" width="25%">Date</td>
				<td class="RegText" width="25%">Title</td>
			</tr>
			</cfoutput>
			<cfoutput query="get_emp_job_titles">
				<tr>
					<td class="RegText">#dateformat(get_emp_job_titles.date_start,'mm/dd/yyyy')#</td>
					<td class="RegText">#get_emp_job_titles.title#</td>
				</tr>
			</cfoutput>
			</table>


