
<!--Reports/dsp_overtime_row_head.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the row headers for the overtime report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:08:29  stetzer
	<>

	||
	END FUSEDOC --->
<cfset variables.compare_emp_id="-1">
</cfsilent>
<cfif get_under_over_hours.recordcount>
<cfoutput query="get_under_over_hours">
<cfif variables.compare_emp_id NEQ emp_id>
<cfset variables.compare_row=1>
<cfset variables.compare_emp_id=emp_id>
<cfif currentrow NEQ 1>
	<tr>
		<td<cfif (variables.overtime_ind AND variables.total_hours GT 40) OR (NOT variables.overtime_ind AND variables.total_hours LT 40)> bgcolor="##FF0000"</cfif> class="RegText#session.workstream_text_size#It">Total Hours:</td>
		<td align="right"<cfif (variables.overtime_ind AND variables.total_hours GT 40) OR (NOT variables.overtime_ind AND variables.total_hours LT 40)> bgcolor="##FF0000"</cfif> class="RegText#session.workstream_text_size#It">#decimalformat(variables.total_hours)#</td>
	</tr>
</cfif>
<cfset variables.total_hours=0>
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">
			#lname#, #name#
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			#employee_classification#
		</td>
	</tr>
</cfif>
	<tr<cfif variables.compare_row MOD 2> bgcolor="##e1e1e1"</cfif>>
		<td class="RegText#session.workstream_text_size#">
			#description#
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#decimalformat(hours)#<cfset variables.total_hours=variables.total_hours+hours>
		</td>
	</tr>
<cfset variables.compare_row=incrementvalue(variables.compare_row)>
</cfoutput>
<cfoutput>
	<tr>
		<td<cfif (variables.overtime_ind AND variables.total_hours GT 40) OR (NOT variables.overtime_ind AND variables.total_hours LT 40)> bgcolor="##FF0000"</cfif> class="RegText#session.workstream_text_size#It">Total Hours:</td>
		<td align="right"<cfif (variables.overtime_ind AND variables.total_hours GT 40) OR (NOT variables.overtime_ind AND variables.total_hours LT 40)> bgcolor="##FF0000"</cfif> class="RegText#session.workstream_text_size#It">#decimalformat(variables.total_hours)#</td>
	</tr>
</cfoutput>
<cfelse>
	<tr>
		<td align="center" colspan="2" class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">
			The report you requested has returned no results.<br>
			Please click the "Back" button to try to run your report again.
		</td>
	</tr>
</cfif>