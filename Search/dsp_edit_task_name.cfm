
<!--Search/dsp_team_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the pull down for team members for the search page.
	||
	Name: 
	||
	Edits:
	$Log$
Revision 1.0  2006/04/07 18:08:39  csy
task42743 Edit task name field

Revision 1.0  2005-02-15 15:58:24-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:26-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr>
		<td align="center">
			<input type="checkbox" name="task_name_box" value="1" <cfif isdefined("attributes.Task_Name")AND len(attributes.Task_Name)>checked="checked"</cfif> class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			Task Name
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<input type="Text" name="Task_Name" size="30" onclick="checkbox_task_name()" value="#attributes.Task_Name#" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"> Separate multiple phrases with commas.
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_name">

</cfoutput>