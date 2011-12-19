
<!--Directory/dsp_emp_supervisor.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the an employee's supervisor.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfinclude template="qry_get_supervisor_history.cfm">
<cfif NOT LEN(get_supervisor_history.supervisor_id)>
	<cfset sup_id = attributes.emp_id>
<cfelse>
	<cfset sup_id = get_supervisor_history.supervisor_id>
</cfif>
</cfsilent>
<cfoutput>
	<span class="SubHeadText#session.workstream_text_size#">Supervisor <a href="##" onclick="window.open('index.cfm?fuseaction=supervisor_entry&emp_id=#attributes.emp_id#', 'Supervisor', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1,copyhistory=0,width=420,height=250');">ADD</a></span><br></span>

<table>
	<tr>
		<td class="RegText#session.workstream_text_size#" width="25%">Name</td>
		<td class="RegText#session.workstream_text_size#" width="25%">Date Started</td>
		<td class="RegText#session.workstream_text_size#" width="25%">Date Ended</td>
	</tr>
</cfoutput>
<cfoutput query="get_supervisor_history">
	<tr>
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_employee('#get_supervisor_history.supervisor_id#');" onmouseover="MM_displayStatusMsg('View details for #Replace(get_supervisor_history.sup_name,"'","")#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#get_supervisor_history.sup_name#</a><br>
		</td>
		<td class="RegText#session.workstream_text_size#">
			#dateformat(get_supervisor_history.date_start,'mm/dd/yyyy')#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#dateformat(get_supervisor_history.date_end,'mm/dd/yyyy')#
		</td>
</cfoutput>
</table>
