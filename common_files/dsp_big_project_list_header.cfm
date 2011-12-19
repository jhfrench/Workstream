
<!--common_files/dsp_big_project_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the big team list page that lets the user see more employees at one time (easier scrolling).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/06/21 14:56:58  french
Splitting engagement list into customer and engagement lists. Task 33277

Revision 1.0  2005-02-15 15:41:17-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:57-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">
			Choose A Customer and Project:
		</td>
	</tr>
</cfoutput>

