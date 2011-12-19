
<!--Directory/dsp_emp_position_number.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the an employee's position number.
	||
	Name: Jeromy French
	||
	Edits:
	||
	END FUSEDOC --->
<cfinclude template="qry_get_position_number_history.cfm">
</cfsilent>
<cfoutput>
	<span class="SubHeadText#session.workstream_text_size#">Position Numbers <a href="index.cfm?fuseaction=position_number_change&emp_id=#attributes.emp_id#">ADD</a></span><br></span>

<table>
	<tr>
		<td class="RegText#session.workstream_text_size#" width="25%">Position Number</td>
		<td class="RegText#session.workstream_text_size#" width="25%">Date Started</td>
		<td class="RegText#session.workstream_text_size#" width="25%">Date Ended</td>
	</tr>
</cfoutput>
<cfoutput>
	<tr>
		<td class="RegText#session.workstream_text_size#">
			#get_emp_position_number_history.position_id#<br>
		</td>
		<td class="RegText#session.workstream_text_size#">
			#dateformat(get_emp_position_number_history.effective_startdate,'mm/dd/yyyy')#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#dateformat(get_emp_position_number_history.effective_enddate,'mm/dd/yyyy')#
		</td>
</cfoutput>
</table>
