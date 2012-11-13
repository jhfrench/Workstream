
<!--Tools/act_timeline_setup.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the change date locked screen.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> attributes.user_account_id: list of ids that the user wishes to grant access to the new timeline; may contain an entire company which includes the company name
	--> attributes.hide_user_field_item_id: id that identifies a field the user wants to use to flag tasks that should not be displayed in a timeline
	--> attributes.project_id: id that uniquely identifies a project; in this case used to specify for which project a timeline is built 
	--> attributes.project_planning_name: string containing name that the user wishes to identify a project timeline
	--> attributes.user_field_id: id that uniquely identifies the user field that the user wants to use to organize the timeline
	END FUSEDOC --->
<cfset variables.count=0>
<cfset variables.user_account_id_list="">
<cfset variables.new_delim=",">
<cftransaction>
<cfquery name="timeline_setup" datasource="#application.datasources.main#">
INSERT INTO Project_Planning (project_planning_name,project_id,user_field_id,show_tasks_ind,hide_user_field_item_id)
VALUES ('#attributes.project_planning_name#',#attributes.project_id#,#attributes.user_field_id#,0,#attributes.hide_user_field_item_id#)
</cfquery>
<cfquery name="get_project_planning_id" datasource="#application.datasources.main#">
SELECT CURRVAL('Project_Planning_project_planning_id_SEQ') AS project_planning_id
FROM 
</cfquery>
</cftransaction>
<cfset attributes.user_account_id=listchangedelims(attributes.user_account_id,variables.new_delim,"|")>
<cfloop list="#attributes.user_account_id#" index="ii">
	<cfset variables.count=incrementvalue(variables.count)>
	<cfif isnumeric(ii)>
		<cfset variables.user_account_id_list=listappend(variables.user_account_id_list,ii)>
	</cfif>
</cfloop>
<cfquery name="insert_user_account_ids" datasource="#application.datasources.main#">
INSERT INTO Project_Planning_Access (project_planning_id, user_account_id)
SELECT #get_project_planning_id.project_planning_id# AS project_planning_id, user_account_id
FROM User_Account
WHERE user_account_id IN (#variables.user_account_id_list#)
</cfquery>
<cfset dir_to_make = '\\192.168.0.152\attatched_files\workstream\Project_Planning\#get_project_planning_id.project_planning_id#'><!--- $issue$: what do we do with this? --->
<cfdirectory action="create" directory="#dir_to_make#">
<cfset session.last_submitted=attributes.last_submitted>
</cfsilent>

