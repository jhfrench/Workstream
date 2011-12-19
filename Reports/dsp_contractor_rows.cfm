
<!--Reports/dsp_contractor_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the rows for the contractor report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:05:01  stetzer
<>

Revision 1.1  2001-10-11 11:04:48-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<cfoutput query="get_employee_id">
<tr<cfif currentrow MOD 2> bgcolor="##e1e1e1"</cfif> class="RegText#session.workstream_text_size#">
	<td>#lname#</td>
	<td>#name#</td>
	<td>#pin#</td>
	<td>#status#</td>
</tr>
</cfoutput>
