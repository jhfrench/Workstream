
<!--Directory/dsp_emp_benefits_info.cfm
	Author: Damon S -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display an employee's benefits info.
	||
	Name: Damon Scott
	||
	Edits:
$Log:

	||
	END FUSEDOC --->

<cfoutput>
<span class="SubHeadText#session.workstream_text_size#">Benefits Info <a href="##" onclick="
javascript:window.open('index.cfm?fuseaction=benefits_entry&emp_id=#attributes.emp_id#', 'files', 'toolbar=0, location=0, directories=0, status=0, menubar=0, scrollbars=0, resizable=0, copyhistory=0, width=420, height=250');">ADD</a></span><br>
<table>
	<tr>
		<td class="RegText#session.workstream_text_size#" width="25%">Type</td>
		<td class="RegText#session.workstream_text_size#" width="25%">Date</td>
		<td class="RegText#session.workstream_text_size#" width="25%">Amount</td>
	</tr>
</cfoutput>
<cfoutput query="get_emp_benefits_info">
	<tr>
		<td class="RegText#session.workstream_text_size#">#description#</td>
		<td class="RegText#session.workstream_text_size#">#dateformat(date_start,"mm/dd/yyyy")#</td>
		<td class="RegText#session.workstream_text_size#">#dollarformat(benefit_amount)#</td>
	</tr>
</cfoutput>
</table>


