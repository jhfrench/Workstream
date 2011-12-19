
<!-- common_files/dsp_submit_reset_buttons.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display submit and reset buttons.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:41:33  daugherty
	Initial revision

	Revision 1.2  2001-11-07 10:13:52-05  french
	Minor code formatting.

	Revision 1.1  2001-10-11 10:57:47-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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
	<td class="RegText#session.workstream_text_size#">
		<input type="button" onclick="javascript:history.go(-1)" value="#attributes.back_text#" class="RegText#session.workstream_text_size#">
	</td>
</cfif>
<cfif Not comparenocase(attributes.display_button2, "submit")>
	<td class="RegText#session.workstream_text_size#">
		<input type="submit" value="#attributes.submit_text#" class="RegText#session.workstream_text_size#">
	</td>
</cfif>
<cfif Not comparenocase(attributes.display_button3, "reset")>
	<td class="RegText#session.workstream_text_size#">
		<input type="Reset" class="RegText#session.workstream_text_size#">
	</td>
</cfif>
</cfoutput>

