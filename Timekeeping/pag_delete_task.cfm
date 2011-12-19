
<!--Timekeeping/pag_delete_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I run the query that deletes a task from workstream.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:22:34  stetzer
<>

Revision 1.1  2001-10-11 10:54:58-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
<cfif isdefined("attributes.task_id")>
	<cfinclude template="act_delete_task.cfm">
	<cfmodule template="../common_files/act_redirect_browser.cfm" display="Your task has been deleted.<br>You are now being redirected to your task list.">
</cfif>

