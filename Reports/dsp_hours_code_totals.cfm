
<!--Reports/dsp_hours_code_totals.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the totals for the hours code report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:07:05  stetzer
<>

Revision 1.1  2001-10-11 11:04:39-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
</cfsilent>
	<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>It">
		<td width="25">&nbsp;&nbsp;</td>
		<td width="25">&nbsp;&nbsp;</td>
		<td> Grand Total:</td>
		<td><cfoutput> #DecimalFormat(total_hours)#</cfoutput></td>
		<td width="25">&nbsp;&nbsp;</td>
	</tr>
<cfset total_hours = 0>
