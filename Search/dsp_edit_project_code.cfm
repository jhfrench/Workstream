
<!--Search/dsp_edit_project_code.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset attributes.used_by_search=1>
</cfsilent>

	<tr valign="top">
		<td  class="btn-group">
			<input type="checkbox" name="customer_id_box" value="1" <cfif isdefined("attributes.project_id_box") AND len(attributes.project_id)> checked="checked"</cfif>>
		</td>
		<td>Customer</td>
		<td>
		<cfif not len(attributes.project_id)>
			<cfmodule template="../common_files/edit_two_related_selects.cfm"
			  
				query="get_search_projects"
                name1="customer_id"
				name2="project_id"
				display1="customer"
				display2="display"
				value1="customer_id"
				value1_list="#attributes.customer_id#"
				value2="project_id"
				value2_list="#attributes.project_id#"
				multiple1="1"
				multiple2="1"
				size1="6"
				size2="6"
				width2="600"
				autoselectfirst="no"
				formname="input_form"
				Element1_OnchangeEvent="checkbox_customer_id()"
				onchange="checkbox_project_id()"
			HTMLBetween="</td>
			</tr>
			<tr valign='top'>
				<td align='center'>
					<input type='checkbox' name='project_id_box' id='project_id_box' value='1' class='RegText'>
				</td>
				<td class='RegText'>Project<br />(may take a<br />moment to display)</td>
				<td>">
				<cfelse>

			<cfmodule template="../common_files/edit_two_related_selects.cfm"
			  
				query="get_search_projects"
                name1="customer_id"
				name2="project_id"
				display1="customer"
				display2="display"
				value1="customer_id"
				value1_list="#attributes.customer_id#"
				value2="project_id"
				value2_list="#attributes.project_id#"
				multiple1="1"
				multiple2="1"
				size1="6"
				size2="6"
				width2="600"
				autoselectfirst="no"
				formname="input_form"
				Element1_OnchangeEvent="checkbox_customer_id()"
				onchange="checkbox_project_id()"
			HTMLBetween="</td>
			</tr>
			<tr valign='top'>
				<td align='center'>
					<input type='checkbox' name='project_id_box' id='project_id_box' value='1' checked ='checked' class='RegText' />
				</td>
				<td class='RegText'>Project<br />(may take a<br />moment to display)</td>
				<td>">
				</cfif>

<!--- 			<select name="project_id2" multiple="multiple" size="6" onclick="checkbox_project_id()">
			<cfoutput query="project">
				<option value="#project_id#">#display#</option>
			</cfoutput>
			</select> --->
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="customer_id">
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="project_id">

