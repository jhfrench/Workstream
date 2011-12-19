
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