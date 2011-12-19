
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
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr bordercolor="##78A0EB" class="SelectText#session.workstream_text_size#">
		<td align="center" width="50%" colspan="4" class="SelectText#session.workstream_text_size#">
			<a href="javascript:document.forms[1].submit();" class="SelectText#session.workstream_text_size#">ADD WORD TO DICTIONARY</a>
		</td>
	</tr>
	
<form action="index.cfm?fuseaction=common_files.spell_check" method="post">
	<input type="hidden" name="message" value="#message#">
	<input type="hidden" name="language" value="#language#">
<cfif isdefined("next_length")>
	<input type="hidden" name="suggested_word" value="#word_to_correct#">
	<input type="hidden" name="length" value="#next_length#">
	<input type="hidden" name="position" value="#next_position#">
	<input type="hidden" name="ignore" value="#ignore#">
	<input type="hidden" name="option" value="Ignore">
	<input type="hidden" name="formname" value="#formname#">
	<input type="hidden" name="notes" value="#replacenocase(paragraphformat(Insert("--> ", Insert(" <--", message, next_position+Len(next_error)-1), next_position-1)), "<P>", "&nbsp;", "All")#">
</cfif>
</form>
</cfoutput>

