
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
 --->
<cfparam name="attributes.default1" DEFAULT="(((((none)))))">
<cfparam name="attributes.default2" DEFAULT="(((((none)))))">
</cfsilent>
	<tr>
		<td>
		Customer<br />
		<cfmodule template="../common_files/two_related_selects.cfm"
				query="get_valid_projects"
				name1="customer_id"
				name2="project_id"
				display1="customer"
				display2="display"
				value1="customer_id"
				value2="project_id"
				multiple1="0"
				multiple2="0"
				default1="#attributes.default1#"
				default2="#attributes.default2#"
				size1="6"
				size2="6"
				width2="600"
				autoselectfirst="no"
				formname="big_list"
				onchange="OKButton()"
				HTMLBetween="<br />Project<br />">
		<!--- 
			<cfoutput><select name="#attributes.formname#" size="#min(get_valid_projects.recordcount,28)#" onChange="OKButton()"></cfoutput>
				<cfoutput query="get_valid_projects"><option value="#project_id#"><cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>#project_code# - #customer# #replace(project_name,customer,"","ALL")#<cfelse>#customer# #replace(project_name,customer,"","ALL")# (#project_code#)</cfif></option>
			</cfoutput>
			</select> --->
		</td>
	</tr>

