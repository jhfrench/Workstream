
<!--Customers/dsp_new_project_step4.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the second step of the 'create new project' wizard.
	||
	Name: Jeromy French
	 || 
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.improper_edit_ind=1>
<cfif isdefined("attributes.last_loaded") AND session.workstream_last_loaded NEQ attributes.last_loaded>
	<cfinclude template="act_insert_projects_vars.cfm">
	<cftransaction isolation="READ_COMMITTED">
		<cfinclude template="act_increment_project_code.cfm">
		<cfinclude template="act_insert_new_project.cfm">
		<cfinclude template="act_set_user_fields.cfm">
	</cftransaction>
	<cfset variables.improper_edit_ind=0>
	<cfset session.workstream_last_loaded=attributes.last_loaded>
</cfif>
</cfsilent>
<cfoutput>

<div <cfif variables.improper_edit_ind>class="alert alert-warning">
	You have already entered this project.<br />If you wich to enter another project please <a href="index.cfm?fuseaction=Customers.new_project">start the 'new project wizard'</a> over again.
<cfelse>class="alert alert-success">
	Your project has been created.
</cfif>
</div>
</cfoutput>
