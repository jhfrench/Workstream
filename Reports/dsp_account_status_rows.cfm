
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
		<td valign="top" class="RegText#session.workstream_text_size#">
			#project_name#
		</td>
		<td align="right" valign="top" class="RegText#session.workstream_text_size#">
			#task_id#
		</td>
		<td valign="top" class="RegText#session.workstream_text_size#">
			<a href="javascript:task_jump('#task_id#');" onmouseover="MM_displayStatusMsg('View task details.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#task_name#</a>
		</td>
		<td valign="top" class="RegText#session.workstream_text_size#">
			#status#
		</td>
		<td valign="top" class="RegText#session.workstream_text_size#">
			#priority#
		</td>
		<td align="right" valign="top" class="RegText#session.workstream_text_size#">
			#dateformat(assigned_date,"mm/dd/yyyy")#
		</td>
		<td align="right" valign="top" class="RegText#session.workstream_text_size#">
			#dateformat(due_date,"mm/dd/yyyy")#
		</td>
		<td align="right" valign="top" class="RegText#session.workstream_text_size#">
			#dateformat(complete_date,"mm/dd/yyyy")#
		</td>
		<td valign="top" class="RegText#session.workstream_text_size#">
			#owner#
		</td>
	</tr>
</cfoutput> 
