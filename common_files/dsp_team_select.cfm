
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> variables.emp_id_match: item to default select if criteria matches
	--> company: number that contains the REF_Company.company_id for an employee
	--> emp_id: id that identifies user to workstream
	--> f_init: string containing the first initial of an employee
	--> lname: string containing the last name of an employee
	<-- #attributes.select_name#: (variable name based on what is passed in through the module select_name attribute) number of the employee(s) selected
 --->

<cfif isdefined("attributes.email_only")>
	<cfset variables.email_only=1>
</cfif>
<cfif isdefined("attributes.emp_id")>
	<cfset variables.emp_id_match=attributes.emp_id>
<cfelse>
	<cfset variables.emp_id_match=session.user_account_id>
</cfif>
<cfif isdefined("get_expense_details.emp_id")>
	<cfset variables.emp_id_match=get_expense_details.emp_id>
</cfif>
<!--- <cfset variables.emp_id=get_expense_details.emp_id> --->
<cfparam name="attributes.valuelist" default="true">
<cfparam name="attributes.select_name" default="emp_id">
<cfparam name="attributes.tabindex" default=0>
<cfparam name="attributes.multi" default=0>
<cfparam name="attributes.size" default=0>
<cfparam name="attributes.onchange" default="">
<cfparam name="attributes.show_team" default="0">
<cfparam name="attributes.class" default="SelectText#session.workstream_text_size#">
<cfparam name="attributes.selected_flag" default="1">
<cfset variables.company_id=0>
</cfsilent>
<cfif NOT isdefined("team_select.recordcount")><cfinclude template="qry_team_select.cfm"></cfif>
<cfif attributes.selected_flag>
	<select name="<cfoutput>#attributes.select_name#"<cfif attributes.size> size="#attributes.size#"</cfif> <cfif attributes.multi> multiple</cfif><cfif len(attributes.onchange)> onchange="javascript:#attributes.onchange#"</cfif><cfif attributes.tabindex> tabindex="#attributes.tabindex#"</cfif><cfif len(attributes.class)> class="#attributes.class#"</cfif>></cfoutput>
	<cfoutput query="team_select">		
		<option value="#team_select.emp_id#"<cfif listfind(variables.emp_id_match, team_select.emp_id, ",")> selected</cfif>>#team_select.lname#, #team_select.f_init#
		</option>
	</cfoutput>
	</select>
<cfelse>
	<cfoutput>
	<cfselect name="#attributes.element_name#" size="2" message="#attributes.message#" required="Yes" class="#attributes.class#">
		
		<cfloop query="team_select">
			<option value="#emp_id#">#lname#, #f_init#</option>
		</cfloop>
		
	</cfselect>
	</cfoutput>	
</cfif>
