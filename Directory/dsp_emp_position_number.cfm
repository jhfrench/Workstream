
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
	<span class="SubHeadText">Position Numbers <a href="javascript:position_number_change(#attributes.emp_id#);">ADD</a></span><br /></span>

<table>
	<tr>
		<td width="25%">Position Number</td>
		<td width="25%">Date Started</td>
		<td width="25%">Date Ended</td>
	</tr>
</cfoutput>
<cfoutput>
	<tr>
		<td>
			#get_emp_position_number_history.position_id#<br />
		</td>
		<td>
			#dateformat(get_emp_position_number_history.effective_start_date,'mm/dd/yyyy')#
		</td>
		<td>
			#dateformat(get_emp_position_number_history.effective_end_date,'mm/dd/yyyy')#
		</td>
</cfoutput>
</table>
