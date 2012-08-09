
<!--common_files/dsp_spell_check_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the form that is used in processing spell check. The variables are all passed from the custom tag unless noted in the variables section of this fusedoc.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset open_font='<font color="ff0000">'>
<cfset close_font="</font>">
<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset variables.too_big=526>
	</cfcase>
	<cfcase value="Md">
		<cfset variables.too_big=576>
	</cfcase>
	<cfdefaultcase>
		<cfset variables.too_big=626>
	</cfdefaultcase>
</cfswitch>

</cfsilent>
<cfoutput>
<!--- Embed hidden fields including message and ignore list --->
	<input type="hidden" name="message" value="#message#">
	<input type="hidden" name="language" value="#language#">
<cfif isdefined("next_length")>
	<input type="hidden" name="length" value="#next_length#">
	<input type="hidden" name="position" value="#next_position#">
	<input type="hidden" name="ignore" value="#ignore#">
	<input type="hidden" name="formname" value="#formname#">
	<input type="hidden" name="notes" value="#replacenocase(paragraphformat(Insert("--> ", Insert(" <--", message, next_position+Len(next_error)-1), next_position-1)), "<P>", "&nbsp;", "All")#">
	<tr bordercolor="##78A0EB" class="SelectText">
		<td width="10%" class="SelectText">&nbsp;</td>
		<td bordercolor="##000000" bgcolor="##ffffff" align="left" colspan="2" width="80%">
		<table border="0" cellpadding="0" cellspacing="3">
		<tr>
		<td>
			<!--- Display text with error in red --->
			<cfset word_to_correct=mid(message,next_position,next_length)>
			<cfif len(message) LT variables.too_big><cfset display_text=replacenocase(paragraphformat(Insert("#open_font#--> ", Insert(" <--#close_font#", message, next_position+Len(next_error)-1), next_position-1)), "<P>", "&nbsp;", "All")>
			#display_text#
			<cfelse>
			<cfset display_text=replacenocase(paragraphformat(Insert("#open_font#--> ", Insert(" <--#close_font#", message, next_position+Len(next_error)-1), next_position-1)), "<P>", "&nbsp;", "All")>
			<cfset start=max(find("#open_font#--> ",display_text)-(variables.too_big/2),1)>
			#mid(display_text,start,variables.too_big)#
			</cfif>
			<cfset percent_checked=(next_position-1)/len(message)*100>
		</td>
		</tr>
		</table>
		</td>
		<td width="10%" class="SelectText">&nbsp;</td>
	</tr>
	<tr bordercolor="##78A0EB" class="SelectText">
		<td align="center" colspan="4" class="SelectText">
			<hr>&nbsp;Checked #numberformat(percent_checked)#%&nbsp;<hr>
		</td>
	</tr>
	<tr bordercolor="##78A0EB" class="SelectText">
		<td width="10%" class="SelectText">&nbsp;</td>
		<td class="SelectText">
			Change to
		</td>
		<td class="SelectText">
			Suggestions
		</td>
		<td width="10%" class="SelectText">&nbsp;</td>
	</tr>
	<tr bordercolor="##78A0EB" class="SelectText">
		<td width="10%" class="SelectText">&nbsp;</td>
		<td class="SelectText">
			<input type="text"  name="correctionm" size="10" />
		</td>
		<td class="SelectText">
			<select name="correction">
			<cfloop index="suggest" list="#next_suggest#">
				<option value="#suggest#">#suggest#</option>
			</cfloop>
			<option value="">&nbsp;-------DELETE-------&nbsp;</option>
			</select>
		</td>
		<td width="10%" class="SelectText">&nbsp;</td>
	</tr>
	<tr bordercolor="##78A0EB" class="SelectText">
		<td align="center" colspan="4" class="SelectText">
			&nbsp;
		</td>
	</tr>
	<tr bordercolor="##78A0EB" class="SelectText">
		<td align="center" width="50%" colspan="4" class="SelectText">
			<input type="submit" name="option" value="Correct" />
			<input type="submit" name="option" value="Ignore" />
		</td>
	</tr>
</cfif>
</cfoutput>

