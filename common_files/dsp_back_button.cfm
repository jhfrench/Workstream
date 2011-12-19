
<!-- common_files/dsp_back_button.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a "back" button that activates a Javascript function that sends you back one page in your history.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:15  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:58-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	 
	||
	Variables:
	
	END FUSEDOC --->
<cfoutput>
<td class="RegText#session.workstream_text_size#">
	<input type="Button" value="Back" class="RegText#session.workstream_text_size#" onclick="history.go(-1)">
</td>
</cfoutput>