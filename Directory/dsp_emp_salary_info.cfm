
<!--Directory/dsp_emp_salary_info.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display an employee's salary info.
	||
	Name: Jeromy French
	||
	Edits:
$Log:

	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<h4>Salary Info <a href="##" onclick="window.open('index.cfm?fuseaction=Directory.salary_entry&emp_id=#attributes.emp_id#', 'Salary', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=125');" class="btn btn-mini">ADD</a></h4></cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Date Implemented</th>
			<th>Amount</th>
			<th>Increase</th>
			<th>% Increase</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_emp_salary_info">
		<tr>
			<td class="date">#dateformat(date_implemented,'mm/dd/yyyy')#</td>
			<td class="number">#dollarformat(decrypt(salary,"sillyputty"))#</td>
			<td class="number">#dollarformat(decrypt(increase_amount,"sillyputty"))#</td>
			<td class="number">#decrypt(increase_percent,"sillyputty")#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>


