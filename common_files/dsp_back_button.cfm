
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
<td class="RegText#session.workstream_text_size#">
	<input type="Button" value="Back" class="RegText#session.workstream_text_size#" onclick="history.go(-1)">
</td>
</cfoutput>