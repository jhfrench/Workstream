
<!--Customers/dsp_engagements_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:46  daugherty
	Initial revision

	Revision 1.3  2002-04-09 09:49:18-04  french
	Minor HTML formatting.

	Revision 1.2  2001-11-01 12:04:04-05  french
	Verifying that customer_edit is used correctly as a boolean.

	Revision 1.1  2001-10-11 10:56:32-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfoutput query="get_engagements">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2><td class="RegText#session.workstream_text_size#">
			#project_code#
		</td></cfif>
		<td class="RegText#session.workstream_text_size#">
			#description#
		</td>
		<cfif NOT (isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2)><td class="RegText#session.workstream_text_size#">
			#project_code#
		</td></cfif>
		<td class="RegText#session.workstream_text_size#">
			#billable#
		</td>
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:open_tasks('#project_id#');" class="RegText#session.workstream_text_size#">#open_tasks#</a>
		</td>
		<td class="RegText#session.workstream_text_size#">
			#active_ind_type#
		</td>
		<td class="RegText#session.workstream_text_size#">
			<cfif session.workstream_engagement_edit><a href="javascript:engagement('#project_id#');" class="RegText#session.workstream_text_size#">Edit</a><cfelse>&nbsp;</cfif>
		</td>
	</tr>
</cfoutput>