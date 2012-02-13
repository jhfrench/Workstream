
<!--Timekeeping/dsp_time_details_row.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> emp_id: number returned from query that identifies a user to workstream
	--> hours: number containing how many hours the person spent on the specified task
	--> last_name: string containing a person's last name
	--> task_id: number returned from query that identifies a task to workstream
 --->
</cfsilent>
<cfoutput query="get_time_details">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText">
		<td colspan="2">
			&nbsp;
		</td>
		<td>
			<a href="javascript:task_to_ind('#emp_id#|#task_id#');"  title="View individual time entries for #last_name#." class="RegText">#last_name#</a>
		</td>
		<td align="right">
			<a href="javascript:task_to_ind('#emp_id#|#task_id#');"  title="View individual time entries for #last_name#." class="RegText">#decimalformat(hours)#</a>
		</td>
		<td align="center">
			<cfinput type="checkbox" name="reassign_hours" value="#emp_id#" required="Yes" message="Please mark which hours you wish to reassign." class="RegText">
		</td>
	</tr>
</cfoutput>