
<!--Tools/dsp_forceplanner_sub_capacity_row.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##E1E1E1" class="SubHeadText">
		<!--- <td bgcolor="##ffffff" colspan="3" valign="bottom" align="right" class="SubHeadText"></td> --->
		<td colspan="2" valign="bottom" align="right" class="SubHeadText">
			Capacity&nbsp;Used
		</td>
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		<td align="center" valign="bottom">
			<input type="text" name="capacity_#variables.user_account_id#" value="#numberformat(evaluate("sum_#variables.user_account_id#")/get_week_days.hours_in_month*100,"___")#%" size="3" readonly="readonly" />
		</td>
	</cfloop>
		<td align="center" valign="bottom">
			<cfif variables.total_requested><cfset variables.total_capacity=requested_sum/variables.total_requested*100><cfelse><cfset variables.total_capacity=0></cfif>
			#decimalformat(variables.total_capacity)#%
		</td>
		<td align="center" valign="bottom">
			<input type="text" name="capacity_assigned" value="0%" size="3" readonly="readonly" />
		</td>
		<td align="center" valign="bottom">
			<input type="text" name="capacity_remaining" value="0%" size="3" readonly="readonly" />
		</td>
	</tr>
</cfoutput>