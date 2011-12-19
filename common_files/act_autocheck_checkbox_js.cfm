
<!--search/dsp_team_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run a JavaScript to auto check a checkbox
	||
	Name:  Adam Stetzer
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:40:57  daugherty
Initial revision

Revision 1.1  2001-10-11 10:58:08-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
<cf_htmlhead>
<cfoutput>
<script language="JavaScript">
function checkbox_#attributes.checkbox_name#()
{
document.input_form.#attributes.checkbox_name#_box.checked=true
}
</script>
</cfoutput>
</cf_htmlhead>

