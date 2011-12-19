
<!--Customers/dsp_cust_edit_row_head3.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:45:42  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:34-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

	<tr bgcolor="#0000ff">
		<td colspan="2" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">Contact Name</td>
		<td colspan="2" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">Contact Last Name</td>
		<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">Visible To</td>
	</tr>