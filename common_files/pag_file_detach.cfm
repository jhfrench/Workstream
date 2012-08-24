
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
 --->
</cfsilent>
<cfif isdefined("attributes.l_t_f_id")>
	<cfinclude template="act_file_detach.cfm">
</cfif>
<cfinclude template="qry_get_associated_files.cfm">
<cfif get_associated_files.recordcount>
	<cfinclude template="dsp_file_detach_form.cfm">
<cfelse>
	<div class="alert alert-info">
		There are no documents associated with this task.
	</div>
</cfif>
