
<!--Customers/dsp_engagements_rows.cfm
	Author: Jeromy F  -->
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
<cfoutput query="get_engagements">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2><td>
			#project_code#
		</td></cfif>
		<td>
			#description#
		</td>
		<cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)><td>
			#project_code#
		</td></cfif>
		<td>
			#billable#
		</td>
		<td>
			<a href="javascript:open_tasks('#project_id#');">#open_tasks#</a>
		</td>
		<td>
			#active_ind_type#
		</td>
		<cfif session.workstream_engagement_edit><td>
			<a href="javascript:engagement('#project_id#');">Edit</a>
		</td></cfif>
	</tr>
</cfoutput>