
<!--Reports/dsp_contractor_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the rows for the contractor report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfoutput query="get_employee_id">
<tr<cfif currentrow MOD 2> bgcolor="##e1e1e1"</cfif> class="RegText">
	<td>#lname#</td>
	<td>#name#</td>
	<td>#pin#</td>
	<td>#status#</td>
</tr>
</cfoutput>
