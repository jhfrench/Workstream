
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
	Revision 1.0  2005/02/15 20:41:41  daugherty
	Initial revision

	Revision 1.1  2002-01-04 10:24:55-05  french
	Added variable that closes the window after the task(s) has been attached.

	Revision 1.0  2001-11-13 10:23:55-05  french
	Initial file creation.

	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	<-- bgcolor: string that sets the backgroud color of this pop-up window
 --->
<cfset bgcolor="##78A0EB">
</cfsilent>
<cfoutput>
<table cellspacing="2" cellpadding="0" width="100%" border="0" align="center" class="SelectText#session.workstream_text_size#">
<cfif isdefined("attributes.linked_task_id")>
	<cfinclude template="act_task_attach.cfm">
	<cfmodule template="dsp_section_title.cfm" section_title="<br>Your tasks were attached." align="center" colspan="1" gutter="0" section_color="78A0EB" title_class="SubHeadText#session.workstream_text_size#">
<cfset onload="window.close();">
<cfelse>
	<cfinclude template="dsp_task_attach_form.cfm">
</cfif>
</table>
</cfoutput>

