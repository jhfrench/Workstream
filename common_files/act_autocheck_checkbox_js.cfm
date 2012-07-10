
<!--common_files/act_autocheck_checkbox_js.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run a JavaScript to auto check a checkbox
	||
	Name:  Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<script language="JavaScript">
function checkbox_#attributes.checkbox_name#()
{
document.input_form.#attributes.checkbox_name#_box.checked=true
}
</script>
</cfoutput>
