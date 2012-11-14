
<!-- common_files/act_continue_to_case_drill.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I forward the necessary information to the case drill page.

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->

	<cfif isdefined("project_id")>
		<cfset attributes.project_id = project_id>
	<cfelseif NOT isdefined("project_id") and isdefined("attributes.task_id")>
		<cfquery name="get_proj_from_task" datasource="#application.datasources.main#">
		SELECT project_id 
		FROM task
		WHERE task_id = #attributes.task_id#
		</cfquery>
		<cfset attributes.project_id = get_proj_from_task.project_id> 
	<cfelse>
		<cflocation url="/index.cfm?fuseaction=Timekeeping.project_list">
	</cfif>

</cfsilent>

<form name="continue_on" method="post" action="<cfoutput></cfoutput>claim/index.cfm?fuseaction=<cfoutput>#request.XFA.case_drill#</cfoutput>">
	<input type="hidden" name="project_id" value="<cfoutput>#attributes.project_id#</cfoutput>">
</form>

<script language="JavaScript">
	document.continue_on.submit()
</script>

