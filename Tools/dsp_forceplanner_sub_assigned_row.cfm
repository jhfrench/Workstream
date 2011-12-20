
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
	<tr bgcolor="##E1E1E1" class="SubHeadText#session.workstream_text_size#">
		<td colspan="2" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#">
			Assigned&nbsp;hours
		</td>
	<cfloop list="#emp_id_loop#" index="ii">
	<cfparam name="sum_#ii#" default="0">
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			<input type="Text" name="sum_#ii#" value="#evaluate("sum_#ii#")#" size="3" onfocus="blur();" class="RegText#session.workstream_text_size#">
		</td>
	</cfloop>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			#variables.requested_sum#
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			<input type="Text" name="sum_assigned" value="0" size="3" onfocus="blur();" class="RegText#session.workstream_text_size#">
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			<input type="Text" name="sum_remaining" value="0" size="3" onfocus="blur();" class="RegText#session.workstream_text_size#"><input type="hidden" name="force_year" value="#attributes.force_year#"><input type="hidden" name="force_month" value="#attributes.force_month#">
		</td>
	</tr>
</cfoutput>
