
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

			<cfoutput>
			<span class="SubHeadText#session.workstream_text_size#">Job Title Info <a href="##" onclick="window.open('index.cfm?fuseaction=job_title_entry&emp_id=#attributes.emp_id#', 'Job', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=125');">ADD</a></span><br>
			<table>
			<tr>
				<td class="RegText#session.workstream_text_size#" width="25%">Date</td>
				<td class="RegText#session.workstream_text_size#" width="25%">Title</td>
			</tr>
			</cfoutput>
			<cfoutput query="get_emp_job_titles">
				<tr>
					<td class="RegText#session.workstream_text_size#">#dateformat(get_emp_job_titles.date_start,'mm/dd/yyyy')#</td>
					<td class="RegText#session.workstream_text_size#">#get_emp_job_titles.title#</td>
				</tr>
			</cfoutput>
			</table>


