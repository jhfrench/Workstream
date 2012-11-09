
<!--Directory/dsp_emp_job_titles.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display an employee's job title info.
	||
	Name: Jeromy French
	||
	Edits:
$Log:

	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput><h4>Job Title Info <a href="##" onclick="window.open('index.cfm?fuseaction=Directory.job_title_entry&user_account_id=#attributes.user_account_id#', 'Job', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=125');" class="btn btn-mini">ADD</a></h4></cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Date</th>
			<th>Title</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_emp_job_titles">
		<tr>
			<td class="date">#dateformat(date_start,'m/d/yyyy')#</td>
			<td>#title#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
