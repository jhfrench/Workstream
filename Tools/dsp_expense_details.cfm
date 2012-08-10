<!--Tools/dsp_expense_details.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the list of expense details
	||
	Name: Jeromy French
	||
	Edits:


	 
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr<cfif currentrow MOD 2> bgcolor="##E1E1E1"</cfif>>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('attributes.order_by')>&order_by=#attributes.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#dateformat(date_incurred,"m/d/yyyy")#</a></td>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('attributes.order_by')>&order_by=#attributes.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#dateformat(date_entered,"m/d/yyyy")#</a></td>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('attributes.order_by')>&order_by=#attributes.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#dateformat(date_approved,"m/d/yyyy")#</a></td>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('attributes.order_by')>&order_by=#attributes.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#payee_name#</a></td>
	<td align="left"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('attributes.order_by')>&order_by=#attributes.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#description#</a></td>
	<td align="right"><a href="index.cfm?fuseaction=expense_entry<cfif isdefined('attributes.order_by')>&order_by=#attributes.order_by#</cfif>&expense_id=#expense_id#&supervisor_flag=#variables.supervisor_flag#">#dollarformat(amount)#</a></td>
</tr>
</cfoutput>