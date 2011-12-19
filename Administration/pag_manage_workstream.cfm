
<!-- Admin/pag_manage_workstream.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the page that allows an workstream administrator to update variables that in turn allow some cached queries to reload.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2006/09/15 22:27:59  csy
	<>

	Revision 1.0  2006-08-16 09:32:08-04  csy
	Initial revision

	Revision 1.0  2005-02-15 15:27:34-05  daugherty
	Initial revision

	Revision 1.1  2001-11-21 12:37:17-05  french
	Added ability to update all application variables.

	Revision 1.0  2001-11-07 11:14:35-05  french
	Added workstream management.
	||
	Variables:
	<-> [attributes.change_me]: list of variable names to update to the current date/time
	<-> [attributes.application_variables]: boolean that tells workstream to update the application name, thereby resetting all application variables
	--> session.workstream_text_size: string indicating the size the user's text size preference
	||
	END FUSEDOC --->
<cfoutput>
<table cellspacing="0" cellpadding="2" border="0" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;workstream Management" section_color="808080" colspan="2" gutter="0" title_class="HeadText#session.workstream_text_size#">
<cfif NOT isdefined("attributes.change_me") AND NOT isdefined("attributes.application_variables")>
	<cfinclude template="dsp_manage_workstream_options.cfm">
<cfelse>
	<cfinclude template="act_manage_workstream.cfm">
</cfif>
</table>
</cfoutput>

