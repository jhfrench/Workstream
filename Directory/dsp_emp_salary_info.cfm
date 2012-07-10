
<!--Directory/dsp_emp_salary_info.cfm
	Author: Damon S -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display an employee's salary info.
	||
	Name: Damon Scott
	||
	Edits:
$Log:

	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<span class="SubHeadText">Salary Info <a href="##" onclick="window.open('index.cfm?fuseaction=Directory.salary_entry&emp_id=#attributes.emp_id#', 'Salary', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=125');">ADD</a></span><br />
<table>
<tr>
	<td width="25%">Date Implemented</td>
	<td width="25%">Amount</td>
	<td width="25%">Increase</td>
	<td width="25%">% Increase</td>
</tr>
</cfoutput>
<cfoutput query="get_emp_salary_info">
	<tr>
		<td>#dateformat(get_emp_salary_info.date_implemented,'mm/dd/yyyy')#</td>
		<td>#dollarformat(Decrypt(get_emp_salary_info.salary,"sillyputty"))#</td>
		<td>#dollarformat(Decrypt(get_emp_salary_info.increase_amount,"sillyputty"))#</td>
		<td>#Decrypt(get_emp_salary_info.increase_percent,"sillyputty")#</td>
	</tr>
</cfoutput>
</table>


