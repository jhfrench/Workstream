
<!--Customers/dsp_dropdowns.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the drop-down selection boxes for the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr bgcolor="##008000">
		<td colspan="7" class="HeadText#session.workstream_text_size#White">
			Open Tasks for #get_open_tasks.project_name#-#get_open_tasks.Project_Code#
		</td>
	</tr>
</cfoutput>

