
<!--Timekeeping/dsp_no_entries.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:21:13  stetzer
<>

Revision 1.1  2001-10-11 10:55:09-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<tr>
		<td colspan="2" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			&nbsp;&nbsp;
		</td>
		<td class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">
			No time entered for this task yet.
		</td>
		<td colspan="2" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			&nbsp;&nbsp;
		</td>
	</tr>