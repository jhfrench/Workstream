
<!--Report/dsp_manager_hours_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the row headers for the manager hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<cfif manager_hours_report_output.recordcount AND variables.emp_id NEQ manager_hours_report_output.emp_id>
<cfif manager_hours_report_output.currentrow NEQ 1 AND variables.total_hours NEQ -1>
	<cfinclude template="dsp_manager_hours_total_hours.cfm">
</cfif>
<cfset variables.emp_id=manager_hours_report_output.emp_id>
<cfset variables.daily_total_hours=0>
<cfset variables.total_hours=-1>
<tr bgcolor="##5F5F5F">
	<td class="HeadTextWhite">Name: #lname#, #name#</td>
	<td colspan="2" class="HeadTextWhite">Employee Type: #employee_classification#</td>
	<td colspan="2" class="HeadTextWhite">Company: #company#</td>
</tr>
<tr bgcolor="##c0c0c0">
	<td class="SubHeadText">Date:</td>
	<td class="SubHeadText">Customer Name:</td>
	<td class="SubHeadText">Notes:</td>
	<td class="SubHeadText">Hours:</td>
	<td class="SubHeadText">Daily Sub-Total:</td>
</tr>
</cfif>
</cfoutput>
