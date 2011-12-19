
<!--Timekeeping/act_pre_name_okbutton.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the big team list page that lets the user see more employees at one time (easier scrolling).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:20:10  stetzer
<>

Revision 1.1  2001-10-11 10:55:18-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
 --->
</cfsilent>
<script language="javascript">
function OKButton()
{
window.returnValue = document.pre_defined.task_name.value;
window.close()
}
</script>