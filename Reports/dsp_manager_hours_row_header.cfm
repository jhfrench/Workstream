
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
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
	<td class="HeadText#session.workstream_text_size#White">Name: #lname#, #name#</td>
	<td colspan="2" class="HeadText#session.workstream_text_size#White">Employee Type: #employee_classification#</td>
	<td colspan="2" class="HeadText#session.workstream_text_size#White">Company: #company#</td>
</tr>
<tr bgcolor="##c0c0c0">
	<td class="SubHeadText#session.workstream_text_size#">Date:</td>
	<td class="SubHeadText#session.workstream_text_size#">Customer Name:</td>
	<td class="SubHeadText#session.workstream_text_size#">Notes:</td>
	<td class="SubHeadText#session.workstream_text_size#">Hours:</td>
	<td class="SubHeadText#session.workstream_text_size#">Daily Sub-Total:</td>
</tr>
</cfif>
</cfoutput>