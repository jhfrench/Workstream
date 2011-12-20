
<!-- common_files/dsp_submit_reset_buttons.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display submit and reset buttons.

	||
	Edits:
	$Log$
	||
	Variables:
	<-- attributes.display_this_button: Displays specific buttons for submiting, reseting or going back on a form.
	END FUSEDOC --->
<cfparam name="attributes.display_button1" default="">
<cfparam name="attributes.display_button2" default="submit">
<cfparam name="attributes.display_button3" default="reset">
<cfparam name="attributes.submit_text" default="Submit">
<cfparam name="attributes.back_text" default="Back">
</cfsilent>
<cfoutput>
<cfif Not comparenocase(attributes.display_button1, "back")>
	<td class="RegText">
		<input type="button" onclick="javascript:history.go(-1)" value="#attributes.back_text#" class="RegText">
	</td>
</cfif>
<cfif Not comparenocase(attributes.display_button2, "submit")>
	<td class="RegText">
		<input type="submit" value="#attributes.submit_text#" class="RegText">
	</td>
</cfif>
<cfif Not comparenocase(attributes.display_button3, "reset")>
	<td class="RegText">
		<input type="Reset" class="RegText">
	</td>
</cfif>
</cfoutput>

