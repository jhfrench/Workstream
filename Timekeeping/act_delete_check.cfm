
<!--Timekeeping/act_delete_check.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I require the user to say yes before deleting a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<script language="JavaScript">
<!--
function delete_check(arg1)
{
var i=arg1
if (confirm('Deleting a task removes all record of the task.\nAre you sure you wish to delete this task?'))
	{delete_task(arg1);}
return;}
//-->
</script>

