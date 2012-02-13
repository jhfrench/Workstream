
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
		<td valign="top" class="RegText">
			#project_name#
		</td>
		<td align="right" valign="top" class="RegText">
			#task_id#
		</td>
		<td valign="top" class="RegText">
			<a href="javascript:task_jump('#task_id#');" class="RegText">#task_name#</a>
		</td>
		<td valign="top" class="RegText">
			#status#
		</td>
		<td valign="top" class="RegText">
			#priority#
		</td>
		<td align="right" valign="top" class="RegText">
			#dateformat(assigned_date,"mm/dd/yyyy")#
		</td>
		<td align="right" valign="top" class="RegText">
			#dateformat(due_date,"mm/dd/yyyy")#
		</td>
		<td align="right" valign="top" class="RegText">
			#dateformat(complete_date,"mm/dd/yyyy")#
		</td>
		<td valign="top" class="RegText">
			#owner#
		</td>
	</tr>
</cfoutput> 
