
<!--common_files/pag_file_attach.cfm
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
<cfif isdefined("form.my_file")>
	<cfinclude template="act_file_attach.cfm">
</cfif>
<cfinclude template="dsp_file_attach_form.cfm">