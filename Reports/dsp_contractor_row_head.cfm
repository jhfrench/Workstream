
<!--Reports/dsp_contractor_row_head.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row headers for the independent contractor report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:05:04  stetzer
<>

Revision 1.1  2001-10-11 11:04:49-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<tr class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>" bgcolor="#c0c0c0">
	<td>Last Name:</td>
	<td>First Name:</td>
	<td>Pin #:</td>
	<td>Status:</td>
</tr>

