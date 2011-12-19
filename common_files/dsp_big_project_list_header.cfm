
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

