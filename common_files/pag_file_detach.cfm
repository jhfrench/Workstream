
<!--common_files/pag_file_detach.cfm
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
<cfparam name="attributes.submit_flag" default=0>
</cfsilent>
<cfif isdefined("attributes.associated_file_id")>
	<cfinclude template="act_file_detach.cfm">
</cfif>
<cfinclude template="qry_get_associated_files.cfm">
<table align="center">
<cfinclude template="dsp_file_detach_head.cfm">
<cfif get_associated_files.recordcount>
	<cfinclude template="dsp_file_detach_form.cfm">
<cfelse>
<cfinclude template="dsp_file_detach_neg.cfm">
</cfif>
</table>

