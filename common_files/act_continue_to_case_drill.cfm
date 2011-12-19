
<!-- common_files/act_continue_to_case_drill.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I forward the necessary information to the case drill page.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:00  daugherty
Initial revision

Revision 1.0  2002-01-07 10:41:35-05  long
Readded to RCS, fixed code that allows the page to submit without knowing the Project_id.

Revision 1.0  2001-10-29 09:50:27-05  long
Initial revision

Revision 1.1  2001-10-11 10:54:03-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	 
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
		<cflocation url="#request.dir_level#/index.cfm?fuseaction=Timekeeping.engagement_list">	
	</cfif>
	
</cfsilent>

<form name="continue_on" method="post" action="<cfoutput>#request.dir_level#</cfoutput>claim/index.cfm?fuseaction=<cfoutput>#request.XFA.case_drill#</cfoutput>">
	<input type="Hidden" name="project_id" value="<cfoutput>#attributes.project_id#</cfoutput>">
</form>

<script language="JavaScript">
	document.continue_on.submit()
</script>

