
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
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<cfset attributes.used_by_search=1>
</cfsilent>

	<tr valign="top">
		<td align="center">
			<input type="checkbox" name="customer_id_box" value="1" class="RegText">
		</td>
		<td class="RegText">Customer</td>
		<td>
			<cfmodule template="../common_files/two_related_selects.cfm" query="get_search_projects" name1="customer_id"
				name2="project_id" display1="customer" display2="display"
				value1="customer_id" value2="project_id" multiple1="1"
				multiple2="1" size1="6" size2="6"
				width2="600" autoselectfirst="no" formname="input_form"
				Element1_OnchangeEvent="checkbox_customer_id()" onchange="checkbox_project_id()"
				HTMLBetween="</td>
			</tr>
			<tr valign='top'>
				<td align='center'>
					<input type='checkbox' name='project_id_box' value='1' class='RegText'>
				</td>
				<td class='RegText'>Project<br>(may take a<br>moment to display)</td>
				<td>">

<!--- 			<select name="project_id2" multiple size="6" onclick="checkbox_project_id()" class="RegText">
			<cfoutput query="project">
				<option value="#project_id#">#display#</option>
			</cfoutput>
			</select> --->
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="customer_id">
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="project_id">

