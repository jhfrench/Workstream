
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
 --->
	<tr align="center">
		<td>
			<cfoutput><select name="#attributes.formname#" size="#min(get_team_select.recordcount,28)#" onChange="OKButton()"></cfoutput><cfoutput query="get_team_select">
				<option value="#emp_id#">#lname#, #left(name, 3)#</option></cfoutput>
			</select>
		</td>
	</tr>

