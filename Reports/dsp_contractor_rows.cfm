
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
</cfsilent>
<cfoutput query="get_employee_id">
<tr>
	<td>#lname#</td>
	<td>#name#</td>
	<td>#pin#</td>
	<td>#status#</td>
</tr>
</cfoutput>
