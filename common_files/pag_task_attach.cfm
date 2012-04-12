
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
<table cellspacing="2" cellpadding="0" width="100%" border="0" align="center" class="SelectText">
<cfif isdefined("attributes.linked_task_id")>
	<cfinclude template="act_task_attach.cfm">
	<cfmodule template="dsp_section_title.cfm" section_title="<br />Your tasks were attached." align="center" colspan="1" gutter="0" section_color="78A0EB" title_class="SubHeadText">
<cfset onload="window.close();">
<cfelse>
	<cfinclude template="dsp_task_attach_form.cfm">
</cfif>
</table>
</cfoutput>

