
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
	<tr bgcolor="##E1E1E1" class="SubHeadText#session.workstream_text_size#">
		<!--- <td bgcolor="##ffffff" colspan="3" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#"></td> --->
		<td colspan="2" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#">
			Capacity&nbsp;Used
		</td>
	<cfloop list="#emp_id_loop#" index="ii">
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			#evaluate("attributes.capacity_#ii#")#
		</td>
	</cfloop>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			<cfif variables.total_requested><cfset variables.total_capacity=requested_sum/variables.total_requested*100><cfelse><cfset variables.total_capacity=0></cfif>
			#decimalformat(variables.total_capacity)#%
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			#attributes.capacity_assigned#
		</td>
		<td align="center" valign="bottom" class="RegText#session.workstream_text_size#">
			#attributes.capacity_remaining#
		</td>
	</tr>
</cfoutput>

