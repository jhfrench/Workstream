
<!--Tools/dsp_forceplanner_sub_assigned_row.cfm
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
		<td colspan="2" valign="bottom" align="right" class="SubHeadText">
			Assigned&nbsp;hours
		</td>
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		<cfparam name="sum_#variables.user_account_id#" default="0">
		<td>
			<input type="text" name="sum_#variables.user_account_id#" value="#evaluate('sum_#variables.user_account_id#')#" readonly="readonly" class="number span3" />
		</td>
	</cfloop>
		<td>
			#variables.requested_sum#
		</td>
		<td>
			<input type="text" name="sum_assigned" value="0" readonly="readonly" class="number span3" />
		</td>
		<td>
			<input type="text" name="sum_remaining" value="0" readonly="readonly" class="number span3" />
			<input type="hidden" name="force_year" value="#attributes.force_year#" />
			<input type="hidden" name="force_month" value="#attributes.force_month#" />
		</td>
	</tr>
</cfoutput>

