
<!--Search/dsp_team_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I ask for the input for the task id.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2006/04/07 18:10:27  csy
task 42742 Edit task id field

Revision 1.1  2005-06-21 10:52:42-04  french
Expanded task_id box. Task 33277

Revision 1.0  2005-02-15 15:58:23-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:26-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr>
		<td align="center"><input type="checkbox" name="task_id_box" value="1" <cfif len(attributes.task_id)>checked="checked"</cfif> class="RegText#session.workstream_text_size#"></td>
		<td class="RegText#session.workstream_text_size#">Task ID</td>
		<td class="RegText#session.workstream_text_size#"><cfinput type="Text" name="task_id" size="50" value="#attributes.task_id#" onclick="checkbox_task_id()" class="RegText#session.workstream_text_size#"></td>
</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_id">


