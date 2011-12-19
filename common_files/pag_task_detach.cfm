
<!--common_files/pag_task_detach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I allow the user to delete a task association.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	<-- bgcolor: string that sets the backgroud color of this pop-up window
 --->
<cfset bgcolor="##78A0EB">
<cfparam name="attributes.submit_flag" default=0>
</cfsilent>
<cfif isdefined("attributes.del_task")>
	<cfinclude template="act_task_detach.cfm">
</cfif>
<cfinclude template="qry_get_associated_tasks.cfm">
<table align="center">
<cfinclude template="dsp_file_detach_head.cfm">
<cfif get_associated_tasks.recordcount>
	<cfinclude template="dsp_task_detach_form.cfm">
<cfelse>
<cfinclude template="dsp_file_detach_neg.cfm">
</cfif>
</table>

