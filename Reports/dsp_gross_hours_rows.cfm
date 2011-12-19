
<!--Reports/dsp_gross_hours_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the gross hours report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:06:52  stetzer
	<>

	Revision 1.2  2001-12-02 17:58:13-05  french
	Formatting changes.

	Revision 1.1  2001-10-11 11:04:41-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput query="gross_hours">	
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			#name#
		</td>
		<cfloop from="1" to="#variables.daysinmonth#" index="ii"><td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(evaluate("Day#ii#"))#		
		</td></cfloop>
		<td class="RegText#session.workstream_text_size#">
			#DecimalFormat(total)#
		</td>
	</tr>
</cfoutput>

