
<!-- common_files/dsp_back_button.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a "back" button that activates a Javascript function that sends you back one page in your history.

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfoutput>
<td>
	<input type="button" value="Back" onclick="history.go(-1)">
</td>
</cfoutput>