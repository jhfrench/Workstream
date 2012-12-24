
<!--Customers/pag_new_project.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the page that allows the user to create a new project for an existint customer.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.step" default="1">
<cfparam name="attributes.fuseaction" default="new_project">
</cfsilent>
<cfform name="new_project" method="POST" action="index.cfm?fuseaction=#attributes.fuseaction#" class="form-horizontal">
<fieldset>
	<legend><h2>Create New Project, Step <cfoutput>#attributes.step#</cfoutput></h2></legend>
	<cfinclude template="dsp_new_project_step#attributes.step#.cfm">
</fieldset>
</cfform>