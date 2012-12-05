
<!--Reports/dsp_summary_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
			<tr valign="top" class="RegTextIt">
				<td colspan="2" align="right">
					Summary Hours: 
				</td>
				<td align="left">
					<cfoutput>#decimalformat(total_hours)#</cfoutput><cfset variables.grand_total_hours = total_hours + variables.grand_total_hours> <cfset variables.emp_type_hours = total_hours + variables.emp_type_hours>	<cfset total_hours=0>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<hr color="##000000" size="1">
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
			</tr>

