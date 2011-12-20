
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
	<tr bgcolor="##E1E1E1" class="SubHeadText#session.workstream_text_size#">
		<!--- <td bgcolor="##ffffff" colspan="3" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#"></td> --->
		<td colspan="2" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#">
			Capacity&nbsp;Used
		</td>
	<cfloop list="#emp_id_loop#" index="ii">
		<cfset variables.capacity_ii=numberformat(evaluate("sum_#ii#")/get_week_days.hours_in_month*100,"___")>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			<input type="Text" name="capacity_#ii#" value="#variables.capacity_ii#%" size="3" onfocus="blur();" class="RegText#session.workstream_text_size#">
		</td>
	</cfloop>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			<cfif variables.total_requested><cfset variables.total_capacity=requested_sum/variables.total_requested*100><cfelse><cfset variables.total_capacity=0></cfif>
			#decimalformat(variables.total_capacity)#%
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			<input type="Text" name="capacity_assigned" value="0%" size="3" onfocus="blur();" class="RegText#session.workstream_text_size#">
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			<input type="Text" name="capacity_remaining" value="0%" size="3" onfocus="blur();" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>
