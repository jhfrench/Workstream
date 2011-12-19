
<!--common_files/dsp_spell_check_add.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a link that allows the user to recommend a word to be added to the spelling dictionary.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:30  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:49-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr bordercolor="##78A0EB" class="SelectText#session.workstream_text_size#">
		<td align="center" width="50%" colspan="4" class="SelectText#session.workstream_text_size#">
			<a href="javascript:document.forms[1].submit();" class="SelectText#session.workstream_text_size#">ADD WORD TO DICTIONARY</a>
		</td>
	</tr>
	
<form action="index.cfm?fuseaction=spell_check" method="post">
	<input type="hidden" name="message" VALUE="#message#">
	<input type="hidden" name="language" VALUE="#language#">
<cfif isdefined("next_length")>
	<input type="hidden" name="suggested_word" VALUE="#word_to_correct#">
	<input type="hidden" name="length" VALUE="#next_length#">
	<input type="hidden" name="position" VALUE="#next_position#">
	<input type="hidden" name="ignore" VALUE="#ignore#">
	<input type="hidden" name="option" VALUE="Ignore">
	<input type="hidden" name="formname" VALUE="#formname#">
	<input type="hidden" name="notes" VALUE="#replacenocase(paragraphformat(Insert("--> ", Insert(" <--", message, next_position+Len(next_error)-1), next_position-1)), "<P>", "&nbsp;", "All")#">
</cfif>
</form>
</cfoutput>

