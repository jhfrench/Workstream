
<!--common_files/dsp_team_select.cfm
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
	--> [attributes.class]: string that contains the CSS class to apply to the select box
	--> [attributes.emp_id]: identifies user to the workstream system
	--> [attributes.multi]: boolean that indicates whether or not select box will allow multiple selections
	--> [attributes.onchange]: string containing javascript that is called when the select box is changed
	--> [attributes.select_name]: string that sets the name of the select box
	--> [attributes.size]: number that indicates how many options the select box should display simultaneously
	--> [attributes.selected_flag]: flag that determines whether there are pre-selected items in the select box
	--> variables.emp_id_match: item to default select if criteria matches
	--> company: number that contains the REF_Company.company_id for an employee
	--> emp_id: id that identifies user to workstream
	--> lname: string containing the last name of an employee
	<-- #attributes.select_name#: (variable name based on what is passed in through the module select_name attribute) number of the employee(s) selected
 --->
<cfscript>
	if (isdefined("attributes.email_only")) {
		variables.email_only=1;
	}
	if (isdefined("attributes.emp_id")) {
		variables.emp_id_match=attributes.emp_id;
	}
	else {
		variables.emp_id_match=variables.user_identification;
	}
	if (isdefined("get_expense_details.emp_id")) {
		variables.emp_id_match=get_expense_details.emp_id;
	}

	if (NOT isdefined("attributes.valuelist")) {
		attributes.valuelist="true";
	}
	if (NOT isdefined("attributes.select_name")) {
		attributes.select_name="emp_id";
	}
	if (NOT isdefined("attributes.multi")) {
		attributes.multi=0;
	}
	if (NOT isdefined("attributes.size")) {
		attributes.size=0;
	}
	if (NOT isdefined("attributes.onchange")) {
		attributes.onchange="";
	}
	if (NOT isdefined("attributes.show_team")) {
		attributes.show_team=0;
	}
	if (NOT isdefined("attributes.class")) {
		attributes.class="SelectText";
	}
	if (NOT isdefined("attributes.selected_flag")) {
		attributes.selected_flag=1;
	}
	variables.company_id=0;
</cfscript>
</cfsilent>
<cfif NOT isdefined("get_team_select.recordcount")><cfinclude template="qry_get_team_select.cfm"></cfif>
<cfoutput>
<cfif attributes.selected_flag>
	<select name="#attributes.select_name#" id="#attributes.select_name#"<cfif attributes.size> size="#attributes.size#"</cfif> <cfif attributes.multi> multiple="multiple"</cfif><cfif len(attributes.onchange)> onchange="javascript:#attributes.onchange#"</cfif><cfif len(attributes.class)> class="#attributes.class#"</cfif>>
	<cfloop query="get_team_select">
		<option value="#emp_id#" title="#lname#, #name#"<cfif listfind(variables.emp_id_match, get_team_select.emp_id, ",")> selected="selected"</cfif>>#display#</option>
	</cfloop>
	</select>
<cfelse>
	<cfselect name="#attributes.element_name#" id="#attributes.element_name#" size="2" message="#attributes.message#" required="yes" class="#attributes.class#">
		<cfloop query="get_team_select">
			<option value="#emp_id#" title="#lname#, #name#">#display#</option>
		</cfloop>
	</cfselect>
</cfif>
</cfoutput>
