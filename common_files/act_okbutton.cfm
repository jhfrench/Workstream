
<!--common_files/act_okbutton.cfm
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
<script language="javascript">
function OKButton()
{
window.returnValue = document.big_list.<cfoutput>#attributes.formname#</cfoutput>.options.value
window.close()
}
</script>