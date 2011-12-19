
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
Revision 1.0  2005/02/15 21:01:11  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:23-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
 --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##E1E1E1" class="SubHeadText#session.workstream_text_size#">
		<!--- <td bgcolor="##ffffff" colspan="3" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#"></td> --->
		<td colspan="2" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#">
			Assigned&nbsp;hours
		</td>
	<cfloop list="#emp_id_loop#" index="ii">
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			#evaluate("attributes.sum_#ii#")#
		</td>
	</cfloop>
		<td align="center" class="RegText#session.workstream_text_size#">
			#requested_sum#
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			#attributes.sum_assigned#
		</td>
		<td align="center" class="RegText#session.workstream_text_size#<cfif attributes.sum_remaining LT 0>Red</cfif>">
			#attributes.sum_remaining#
		</td>
	</tr>
</cfoutput>

