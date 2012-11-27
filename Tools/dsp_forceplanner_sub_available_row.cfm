
<!--Tools/dsp_forceplanner_sub_available_row.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I show the available hours that an employee can be expected to work during the current month.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##ffffff" class="SubHeadText">
		<!--- <td bgcolor="##ffffff" colspan="3" valign="bottom" align="right" class="SubHeadText"></td> --->
		<td colspan="2" valign="bottom" align="right" class="SubHeadText">
			Available&nbsp;hours
		</td>
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		<td class="number">
			#get_week_days.hours_in_month#
		</td>
	</cfloop>
		<td class="number">
			#variables.total_requested#
		</td>
		<td class="number">
			#variables.total_requested#
		</td>
		<td class="number">
			#variables.total_requested#
		</td>
	</tr>
</cfoutput>