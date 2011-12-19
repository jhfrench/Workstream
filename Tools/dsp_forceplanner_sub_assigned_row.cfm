
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
	Revision 1.0  2005/02/15 21:01:10  daugherty
	Initial revision

	Revision 1.2  2001-11-05 10:54:06-05  french
	Removed commnented line, indented edit remark.

	Revision 1.1  2001-10-11 10:54:23-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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

