
<!--Tools/qry_update_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfquery name="update_task" datasource="#application.datasources.main#">
/*EXECUTE LOOP*/
<cfoutput query="get_prospectives">
<cfif isdefined("attributes.accept_#task_id#")>
	<cfset variables.update_count=1>
	UPDATE Task
	SET status_id=#evaluate("attributes.task_status#task_id#")#,
		due_date=#createodbcdatetime(evaluate("attributes.task_due_date#task_id#"))#<cfif IsNumeric(evaluate("attributes.task_assigned#task_id#"))>,
		budgeted_hours=(SELECT ISNULL(SUM(Time_Entry.hours),0) FROM Time_Entry WHERE task_id=#task_id# AND date < '#month(now())#/1/#year(now())#')+#evaluate("attributes.task_assigned#task_id#")#</cfif>
	WHERE task_id=#task_id# AND #variables.update_count#=#variables.update_count#<cfset variables.update_count=incrementvalue(variables.update_count)>
<cfelse>
	DELETE Forecast_Assignment
	WHERE forecast_id=#variables.forecast_id#
		AND task_id=#task_id#
	<cfif get_prospectives.previous_entry EQ 1>
	UPDATE Task
	SET status_id=13
	WHERE task_id=#task_id#
	</cfif>
</cfif>
</cfoutput>
</cfquery>
</cfsilent>

