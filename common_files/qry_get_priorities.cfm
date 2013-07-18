
<!--common_files/qry_get_priorities.cfm
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
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_priorities" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.main#">
SELECT priority_id, description
FROM REF_Priority
WHERE <cfqueryparam value="#application.last_updated#" cfsqltype="cf_sql_timestamp" />=<cfqueryparam value="#application.last_updated#" cfsqltype="cf_sql_timestamp" />
ORDER BY sort_order;
</cfquery>
</cfsilent>
