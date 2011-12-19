
<!--Timekeeping/dsp_ind_entry_details_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project/engagement list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:21:07  stetzer
<>

Revision 1.1  2001-10-11 10:55:10-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<tr class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td colspan="2">
			&nbsp;
		</td>
		<td>
			Date
		</td>
		<td align="right">
			Hours
		</td>
		<td>
			Notes
		</td>
		<td align="center" width="130">
			Reassign Hours
		</td>
	</tr>

