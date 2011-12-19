
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
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##008000">
		<td colspan="7" class="HeadText#session.workstream_text_size#White">
			Open Tasks for #get_open_tasks.project_name#-#get_open_tasks.project_code#
		</td>
	</tr>
</cfoutput>

