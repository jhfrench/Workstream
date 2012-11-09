
<!--Tools/dsp_forceplanner_sub_capacity_row_save.cfm
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
			#evaluate("attributes.capacity_#variables.user_account_id#")#
		</td>
	</cfloop>
		<td align="center" valign="bottom">
			<cfif variables.total_requested><cfset variables.total_capacity=requested_sum/variables.total_requested*100><cfelse><cfset variables.total_capacity=0></cfif>
			#decimalformat(variables.total_capacity)#%
		</td>
		<td align="center" valign="bottom">
			#attributes.capacity_assigned#
		</td>
		<td align="center" valign="bottom">
			#attributes.capacity_remaining#
		</td>
	</tr>
</cfoutput>

