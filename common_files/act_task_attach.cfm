
<!--common_files/act_task_attach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I perform the actions to associate one or more (linked) tasks with another (base) task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> attributes.base_task_id: number that uniquely defines the base task
	--> attributes.linked_task_id: list of tasks to be attached to a particular task
 --->
<cfif attributes.base_task_id NEQ 0>
	<cfinclude template="qry_task_attach.cfm">
</cfif>
</cfsilent>
<cfif attributes.base_task_id EQ 0>
	<cfset onload="movename();">
	<form name="tempform">
		<input type="hidden" name="linked_task_id" value="<cfoutput>#attributes.linked_task_id#</cfoutput>">
	</form>
<script language="JavaScript" type="text/javascript">
<!--
function movename()
	{
		opener.document.task_details.linked_task_id.value=document.tempform.linked_task_id.value;
		window.close();
	}
//-->
</SCRIPT>
</cfif>

