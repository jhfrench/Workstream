
<!--common_files/dsp_spell_entry_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the spell check entry form. The textarea for the form may or may not be loaded with text depending upon if any was passed from the calling form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:31  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:48-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr align="center">
		<td class="SelectText#session.workstream_text_size#">
			<input type="hidden" name="language" value="AM">
			<input type="hidden" name="formname" value="#formname#">
			<textarea name="message" cols="90" rows="13" class="RegText#session.workstream_text_size#"></textarea>
		</td>
	</tr>
	<tr align="center">
		<td class="SelectText#session.workstream_text_size#">
			<input type="submit" value="Check Spelling" class="RegText#session.workstream_text_size#"><input type="submit" onclick="javascript:window.close();" value="Cancel" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>

