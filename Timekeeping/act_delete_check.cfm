
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
Revision 1.1  2005/03/09 18:19:54  stetzer
<>

Revision 1.1  2001-10-11 10:55:20-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
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

