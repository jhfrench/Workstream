
<!--Search/dsp_team_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the pull down for team members for the search page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:58:25  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:25-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<tr valign="top">
	<td align="center">
		<input type="checkbox" name="task_source_box" value="1">
	</td>
	<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Task Source</td>
	<td>
		<cfmodule template="../common_files/dsp_team_select.cfm" colspan="1" select_name="Task_Source" multi="1" emp_id="0" onChange="checkbox_task_source()" class="RegText#session.workstream_text_size#">
	</td>
</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_source">

