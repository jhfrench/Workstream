
<!--common_files/act_task_list_order.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I create the ORDER BY list used in the task view.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> attributes.order_by: string containing column header selected as the priority column for ordering the task_list query results
	--> attributes.reorder: boolean that allows the list to be ordered by new submission
	<-> session.workstream_task_list_order: list of query columns to ORDER BY which is minipulated based on the contents of attributes.order_by
 --->
<cfparam name="session.workstream_task_list_order" default="due_date">
<cfset variables.task_list_order=session.workstream_task_list_order>
<cfif isdefined("attributes.order_by") AND isdefined("attributes.reorder")>
	<cfif listfind(variables.task_list_order, attributes.order_by) EQ 1>
		<cfset variables.task_list_order=listdeleteat(variables.task_list_order,1)>
		<cfset variables.task_list_order=listprepend(variables.task_list_order, "#attributes.order_by# DESC")>
	<cfelseif listfind(variables.task_list_order, attributes.order_by)>
		<cfset variables.task_list_order=listdeleteat(variables.task_list_order,listfind(variables.task_list_order,attributes.order_by))>
		<cfset variables.task_list_order=listprepend(variables.task_list_order, attributes.order_by)>
	<cfelseif listfind(variables.task_list_order,"#attributes.order_by# DESC")>
		<cfset variables.task_list_order=listdeleteat(variables.task_list_order,listfind(variables.task_list_order,"#attributes.order_by# DESC"))>
		<cfset variables.task_list_order=listprepend(variables.task_list_order, attributes.order_by)>
	<cfelse>
		<cfset variables.task_list_order=listprepend(variables.task_list_order, attributes.order_by)>
	</cfif>
	<cfset session.workstream_task_list_order=variables.task_list_order>
</cfif>
<cfset variables.task_list_order_column_whole=listfirst(variables.task_list_order)>
<cfset variables.task_list_order_column=listfirst(variables.task_list_order_column_whole, " ")>
<cfset variables.task_list_order_down_ind=listlen(variables.task_list_order_column_whole, " ")-1>
</cfsilent>
