
<!--Reports/dsp_account_status_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput query="account_status_report"> 
	<tr<cfif NOT (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td valign="top">
			#project_name#
		</td>
		<td align="right" valign="top">
			#task_id#
		</td>
		<td valign="top">
			<a href="javascript:task_jump('#task_id#');">#task_name#</a>
		</td>
		<td valign="top">
			#status#
		</td>
		<td valign="top">
			#priority#
		</td>
		<td align="right" valign="top">
			#dateformat(assigned_date,"mm/dd/yyyy")#
		</td>
		<td align="right" valign="top">
			#dateformat(due_date,"mm/dd/yyyy")#
		</td>
		<td align="right" valign="top">
			#dateformat(complete_date,"mm/dd/yyyy")#
		</td>
		<td valign="top">
			#owner#
		</td>
	</tr>
</cfoutput> 
