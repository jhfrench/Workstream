
<!--Timekeeping/dsp_print_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task. If a task is not specified I display the form to set task details/create a new task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:21:23  stetzer
<>

Revision 1.1  2001-10-11 10:55:09-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> customer_name: string that identifies the customer for whom the task is created
	--> project_name: string that contains the name of the project the task is assigned to
 --->
</cfsilent>
<cfoutput>
		<td align="right" valign="top" class="SubHeadText#session.workstream_text_size#">
			 <a href="javascript:printable('#attributes.task_id#');" onmouseover="MM_displayStatusMsg('View a printable version of this task.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="Note#session.workstream_text_size#"><img src="#request.dir_level##application.application_specific_settings.image_dir#document.gif" width="16" height="16" alt="View a printable version of this task." border="0">Printable task sheet</a>
		</td>
		
</cfoutput>

