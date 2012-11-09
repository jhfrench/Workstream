
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
<cfif NOT len(get_supervisor_history.supervisor_id)>
	<cfset supervisor_user_account_id = attributes.user_account_id>
<cfelse>
	<cfset supervisor_user_account_id = get_supervisor_history.supervisor_id>
</cfif>
</cfsilent>
<cfoutput>
	<h4>Supervisor <a href="##" onclick="window.open('index.cfm?fuseaction=Directory.supervisor_entry&user_account_id=#attributes.user_account_id#', 'Supervisor', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1,copyhistory=0,width=420,height=650');" class="btn btn-mini">ADD</a></h4>
</cfoutput>

<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Name</th>
			<th>Date Started</th>
			<th>Date Ended</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_supervisor_history">
		<tr>
			<th scope="row">
				<a href="javascript:list_to_employee('#get_supervisor_history.supervisor_id#');" title="View details for #replace(get_supervisor_history.sup_name,"'","")#.">#get_supervisor_history.sup_name#</a><br />
			</td>
			<td class="date">
				#dateformat(get_supervisor_history.date_start,'m/d/yyyy')#
			</td>
			<td class="date">
				#dateformat(get_supervisor_history.date_end,'m/d/yyyy')#
			</td>
	</cfoutput>
	</tbody>
</table>
