
<!--Timekeeping/act_engagement_list_order.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I create the ORDER BY list used in the engagement view.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:19:59  stetzer
<>

Revision 1.1  2001-10-11 10:55:20-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> attributes.order_by: string containing column header selected as the priority column for ordering the task_list query results
	--> attributes.reorder: boolean that allows the list to be ordered by new submission
	<-> session.workstream_engagement_list_order: list of query columns to ORDER BY which is minipulated based on the contents of attributes.order_by
 --->
<cfparam name="session.workstream_engagement_list_order" default="project_end">
<cfif isdefined("attributes.order_by") AND isdefined("attributes.reorder")>
	<cfif listfind(session.workstream_engagement_list_order,attributes.order_by) EQ 1>
		<cfset session.workstream_engagement_list_order=listdeleteat(session.workstream_engagement_list_order,1)>
		<cfset session.workstream_engagement_list_order=listprepend(session.workstream_engagement_list_order, "#attributes.order_by# desc")>
	<cfelseif listfind(session.workstream_engagement_list_order,attributes.order_by)>
		<cfset session.workstream_engagement_list_order=listdeleteat(session.workstream_engagement_list_order,listfind(session.workstream_engagement_list_order,attributes.order_by))>
		<cfset session.workstream_engagement_list_order=listprepend(session.workstream_engagement_list_order, attributes.order_by)>
	<cfelseif listfind(session.workstream_engagement_list_order,"#attributes.order_by# desc")>
		<cfset session.workstream_engagement_list_order=listdeleteat(session.workstream_engagement_list_order,listfind(session.workstream_engagement_list_order,"#attributes.order_by# desc"))>
		<cfset session.workstream_engagement_list_order=listprepend(session.workstream_engagement_list_order, attributes.order_by)>
	<cfelse>
		<cfset session.workstream_engagement_list_order=listprepend(session.workstream_engagement_list_order, attributes.order_by)>
	</cfif>
</cfif>
</cfsilent>
