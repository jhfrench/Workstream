
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
