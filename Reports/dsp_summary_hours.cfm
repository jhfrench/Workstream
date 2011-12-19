
<!--Reports/dsp_summary_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:09:20  stetzer
<>

Revision 1.1  2001-10-11 11:04:28-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->		
</cfsilent>
			<tr valign="top"  class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>It">
				<td colspan="2" align="right">
					
					Summary Hours: 
				</td>
				<td align="left">
					<cfoutput>#DecimalFormat(total_hours)#</cfoutput><cfset grand_total_hours = total_hours + grand_total_hours> <cfset Emp_type_hours = total_hours + Emp_Type_hours>	<cfset total_hours=0>
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

