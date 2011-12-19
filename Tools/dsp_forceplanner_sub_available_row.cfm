
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
Revision 1.0  2005/02/15 21:01:12  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:23-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
 --->
<cfoutput>
	<tr bgcolor="##ffffff" class="SubHeadText#session.workstream_text_size#">
		<!--- <td bgcolor="##ffffff" colspan="3" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#"></td> --->
		<td colspan="2" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#">
			Available&nbsp;hours
		</td>
	<cfloop list="#emp_id_loop#" index="ii">
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			#get_week_days.hours_in_month#
		</td>
	</cfloop>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			#variables.total_requested#
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			#variables.total_requested#
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			#variables.total_requested#
		</td>
	</tr>
</cfoutput>

