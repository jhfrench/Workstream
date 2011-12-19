
<!--Timekeeping/dsp_task_description_header.cfm
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
Revision 1.1  2005/03/09 18:21:37  stetzer
<>

Revision 1.1  2001-10-11 10:55:08-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td colspan="2">
			&nbsp;&nbsp;
		</td>
		<td colspan="3" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			Task details&nbsp;
		</td>
	</tr>

