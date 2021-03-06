
<!--Timekeeping/pag_task_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfparam name="attributes.order_by" default="due_date">
</cfsilent>
<cfinclude template="../common_files/act_client_vars.cfm">
<cfinclude template="qry_get_task_list.cfm">
<cfinclude template="../common_files/dsp_dropdowns.cfm">
<cfif get_task_list.recordcount>
<table class="table table-striped table-bordered table-condensed dataTables detach_caption" data-order='[[ 4, "asc" ], [ 7, "desc" ], [ 0, "asc" ]]'>
	<cfinclude template="../common_files/dsp_task_list_header.cfm">
	<cfinclude template="../common_files/dsp_task_list.cfm">
</table>
<cfelse>
	<div class="alert alert-info">
		You have no tasks that meet your criteria.
	</div>
</cfif>