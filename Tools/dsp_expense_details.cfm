<!--Tools/dsp_expense_details.cfm
	Author: Damon S  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the list of expense details
	||
	Name: Damon Scott
	||
	Edits:


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr<cfif currentrow MOD 2> bgcolor="##E1E1E1"</cfif>>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('url.order_by')>&order_by=#url.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#dateformat(date_incurred,"mm/dd/yyyy")#</a></td>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('url.order_by')>&order_by=#url.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#dateformat(date_entered,"mm/dd/yyyy")#</a></td>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('url.order_by')>&order_by=#url.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#dateformat(date_approved,"mm/dd/yyyy")#</a></td>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('url.order_by')>&order_by=#url.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#payee_name#</a></td>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('url.order_by')>&order_by=#url.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#description#</a></td>
	<td align="right"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('url.order_by')>&order_by=#url.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#dollarformat(amount)#</a></td>
</tr>
</cfoutput>