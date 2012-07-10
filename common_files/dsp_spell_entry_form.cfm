
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
	 || 
 --->
<cfoutput>
	<tr align="center">
		<td class="SelectText">
			<input type="hidden" name="language" value="AM">
			<input type="hidden" name="formname" value="#formname#">
			<textarea name="message" cols="90" rows="13"></textarea>
		</td>
	</tr>
	<tr align="center">
		<td class="SelectText">
			<input type="submit" value="Check Spelling"><input type="submit" onclick="javascript:window.close();" value="Cancel">
		</td>
	</tr>
</cfoutput>

