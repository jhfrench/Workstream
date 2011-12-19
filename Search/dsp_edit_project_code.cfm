
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
	Revision 1.2  2006/05/03 16:08:36  csy
	task 42742 Replaced qry_valid_projects with qry_search_projects

	Revision 1.1  2006-04-28 13:22:36-04  csy
	task 42743  I  replaced qry_project_code.cfm with qry_get_valid_projects.cfm as the first one does not  pull a complete list of engagements upon clicking on a customer name. It is worth noting that qry_get_valid_projects.cfm is being successfully used when editing or creating a new task.

	Revision 1.0  2006-04-07 14:18:12-04  csy
	task 42742 Edit task customer and engagement field

	Revision 1.1  2005-06-21 10:49:30-04  french
	Split engagement select list into customer and engagement select list.

	Revision 1.0  2005-02-15 15:58:21-05  daugherty
	Initial revision

	Revision 1.2  2002-04-19 12:14:01-04  french
	Scoped 'used_by_search' variable.

	Revision 1.1  2001-10-11 10:55:27-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<cfset attributes.used_by_search=1>
</cfsilent>

	<tr valign="top">
		<td align="center">
			<input type="checkbox" name="customer_id_box" value="1" <cfif isdefined("attributes.project_id_box") AND len(attributes.project_id)>checked="checked"</cfif> class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Customer</td>
		<td>
		<cfif not len(attributes.project_id)>
			<cfmodule template="../common_files/edit_two_related_selects.cfm"
			  
				query="get_search_projects"
                name1="customers_id"
				name2="project_id"
				display1="customer"
				display2="display"
				value1="customers_id"
				value1_list="#attributes.customers_id#"
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
					<input type='checkbox' name='project_id_box' value='1' class='RegText#session.workstream_text_size#'>
				</td>
				<td class='RegText#session.workstream_text_size#'>Engagement<br>(may take a<br>moment to display)</td>
				<td>">
				<cfelse>
					
			<cfmodule template="../common_files/edit_two_related_selects.cfm"
			  
				query="get_search_projects"
                name1="customers_id"
				name2="project_id"
				display1="customer"
				display2="display"
				value1="customers_id"
				value1_list="#attributes.customers_id#"
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
					<input type='checkbox' checked ='checked' name='project_id_box' value='1' class='RegText#session.workstream_text_size#'>
				</td>
				<td class='RegText#session.workstream_text_size#'>Engagement<br>(may take a<br>moment to display)</td>
				<td>">
				</cfif>
				
<!--- 			<select name="project_id2" multiple size="6" onclick="checkbox_project_id()" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<cfoutput query="project">
				<option value="#project_id#">#display#</option>
			</cfoutput>
			</select> --->
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="customer_id">
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="project_id">

