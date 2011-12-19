
<!--Timekeeping/dsp_time_details_buttons.cfm
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
Revision 1.1  2005/03/09 18:22:13  stetzer
<>

Revision 1.1  2001-10-11 10:55:02-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td colspan="2">
			&nbsp;&nbsp;
		</td>
		<td align="center" colspan="3">
			<input type="Reset" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"> | <input type="Submit" value="Reassign" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
	</tr>