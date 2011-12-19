
<!--Customers/pag_new_engagement.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the page that allows the user to create a new engagement for an existint customer.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.step" default="1">
<cfparam name="attributes.fuseaction" default="new_engagement">
</cfsilent>
<cfform name="new_engagement" method="POST" action="index.cfm?fuseaction=#attributes.fuseaction#">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="90%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="008000" section_title="&nbsp;Create New Project, Step #attributes.step#" colspan="5" gutter="false" align="left">
	<cfinclude template="dsp_new_engagement_step#attributes.step#.cfm">
</table>
</cfform>

