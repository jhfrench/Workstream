
<!--common_files/dsp_big_team_list.cfm
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
	<tr align="center">
		<td>
			<cfoutput><select name="#attributes.formname#" size="#min(team_select.recordcount,28)#" onChange="OKButton()" class="RegText#session.workstream_text_size#"></cfoutput><cfoutput query="team_select">
				<option value="#emp_id#">#lname#, #f_init#</option></cfoutput>
			</select>
		</td>
	</tr>

