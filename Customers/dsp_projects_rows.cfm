
<!--Customers/dsp_projects_rows.cfm
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
<tbody>
<cfoutput query="get_projects">
	<tr>
		<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2><td>
			#project_code#
		</td></cfif>
		<td>
			#description# (<a href="javascript:project('#project_id#');">Edit</a>)
		</td>
		<cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)><td>
			#project_code#
		</td></cfif>
		<td>
			#billable#
		</td>
		<td class="number">
			<a href="javascript:open_tasks('#project_id#');">#open_tasks#</a>
		</td>
		<td>
			#active_ind_type#
		</td>
	</tr>
</cfoutput>
</tbody>