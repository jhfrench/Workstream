
<!--Directory/dsp_emp_benefits_info.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display an employee's benefits info.
	||
	Name: Jeromy French
	||
	Edits:
$Log:

	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<h4>Benefits Info <a href="##" onclick="
javascript:window.open('index.cfm?fuseaction=Directory.benefits_entry&emp_id=#attributes.emp_id#', 'files', 'toolbar=0, location=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0, copyhistory=0, width=420, height=250');" class="btn btn-mini">ADD</a></h4>
</cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Type</th>
			<th>Date</th>
			<th>Amount</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_emp_benefits_info">
		<tr>
			<td>#description#</td>
			<td class="date">#dateformat(date_start,"m/d/yyyy")#</td>
			<td class="number">#dollarformat(benefit_amount)#</td>
		</tr>
	</cfoutput>
	<tbody>
</table>
