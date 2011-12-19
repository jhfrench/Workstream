
<!--Timekeeping/dsp_time_details_row.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project/engagement list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:22:21  stetzer
<>

Revision 1.1  2001-10-11 10:55:01-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> emp_id: number returned from query that identifies a user to workstream
	--> hours: number containing how many hours the person spent on the specified task
	--> last_name: string containing a person's last name
	--> task_id: number returned from query that identifies a task to workstream
 --->
</cfsilent>
<cfoutput query="get_time_details">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText#session.workstream_text_size#">
		<td colspan="2">
			&nbsp;
		</td>
		<td>
			<a href="javascript:task_to_ind('#emp_id#|#task_id#');" onmouseover="MM_displayStatusMsg('View individual time entries for #last_name#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#last_name#</a>
		</td>
		<td align="right">
			<a href="javascript:task_to_ind('#emp_id#|#task_id#');" onmouseover="MM_displayStatusMsg('View individual time entries for #last_name#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#DecimalFormat(hours)#</a>
		</td>
		<td align="center">
			<cfinput type="checkbox" name="reassign_hours" value="#emp_id#" required="Yes" message="Please mark which hours you wish to reassign." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>