
<!--Tools/dsp_forceplanner_sub_assigned_row_save.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the sub row that tallies all the assigned hours for a person and for the whole team.
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
			Assigned&nbsp;hours
		</td>
	<cfloop list="#variables.subordinates_emp_id#" index="variables.emp_id">
		<td align="center" valign="bottom">
			#evaluate("attributes.sum_#variables.emp_id#")#
		</td>
	</cfloop>
		<td align="center">
			#requested_sum#
		</td>
		<td align="center">
			#attributes.sum_assigned#
		</td>
		<td align="center" class="RegText<cfif attributes.sum_remaining LT 0>Red</cfif>">
			#attributes.sum_remaining#
		</td>
	</tr>
</cfoutput>

