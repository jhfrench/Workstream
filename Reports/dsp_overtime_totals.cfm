
<!--reports/dsp_overtime_totals.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I compute and display the total hours in the overtime report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:08:32  stetzer
<>

Revision 1.1  2001-10-11 11:04:32-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
	<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>It">
		<td colspan="2">Total Hours:</td>
<cfoutput>
		<td>#decimalformat(Total_Hours)#</td>
	</tr>
</cfoutput>
