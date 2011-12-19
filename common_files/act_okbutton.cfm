
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
Revision 1.0  2005/02/15 20:41:07  daugherty
Initial revision

Revision 1.1  2001-10-11 10:58:02-04  long
added $log $ for edits.  To all CFM files that have fusedocs.
	||
 --->
<script language="javascript">
function OKButton()
{
window.returnValue = document.big_list.<cfoutput>#attributes.formname#</cfoutput>.options.value
window.close()
}
</script>