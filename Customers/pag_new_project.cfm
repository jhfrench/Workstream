
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
<cfform name="new_project" method="POST" action="index.cfm?fuseaction=#attributes.fuseaction#">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="90%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008000" section_title="&nbsp;Create New Project, Step #attributes.step#" colspan="5" gutter="false" align="left">
	<cfinclude template="dsp_new_project_step#attributes.step#.cfm">
</table>
</cfform>

