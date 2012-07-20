
<!--common_files/pag_task_attach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I allow the user to associate a file path with a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	<-- bgcolor: string that sets the backgroud color of this pop-up window
 --->
<cfset bgcolor="##78A0EB">
</cfsilent>
<cfoutput>
<cfif isdefined("attributes.linked_task_id")>
	<cfinclude template="act_task_attach.cfm">
	<cfset onload="window.close();">
	<p>Your tasks were attached.</p>
<cfelse>
	<cfinclude template="dsp_task_attach_form.cfm">
</cfif>
</cfoutput>
