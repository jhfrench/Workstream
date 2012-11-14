
<!--Timekeeping/act_project_list_order.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I create the ORDER BY list used in the project view.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> attributes.order_by: string containing column header selected as the priority column for ordering the task_list query results
	--> attributes.reorder: boolean that allows the list to be ordered by new submission
	<-> session.workstream_project_list_order: list of query columns to ORDER BY which is minipulated based on the contents of attributes.order_by
 --->
<cfparam name="session.workstream_project_list_order" default="project_end">
<cfif isdefined("attributes.order_by") AND isdefined("attributes.reorder")>
	<cfif listfind(session.workstream_project_list_order,attributes.order_by) EQ 1>
		<cfset session.workstream_project_list_order=listdeleteat(session.workstream_project_list_order,1)>
		<cfset session.workstream_project_list_order=listprepend(session.workstream_project_list_order, "#attributes.order_by# desc")>
	<cfelseif listfind(session.workstream_project_list_order,attributes.order_by)>
		<cfset session.workstream_project_list_order=listdeleteat(session.workstream_project_list_order,listfind(session.workstream_project_list_order,attributes.order_by))>
		<cfset session.workstream_project_list_order=listprepend(session.workstream_project_list_order, attributes.order_by)>
	<cfelseif listfind(session.workstream_project_list_order,"#attributes.order_by# desc")>
		<cfset session.workstream_project_list_order=listdeleteat(session.workstream_project_list_order,listfind(session.workstream_project_list_order,"#attributes.order_by# desc"))>
		<cfset session.workstream_project_list_order=listprepend(session.workstream_project_list_order, attributes.order_by)>
	<cfelse>
		<cfset session.workstream_project_list_order=listprepend(session.workstream_project_list_order, attributes.order_by)>
	</cfif>
</cfif>
</cfsilent>
