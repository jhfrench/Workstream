
<!--Timekeeping/dsp_express_entry_options.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the .
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<cfoutput query="express_check_date">
    <input name="date_locked" type="hidden" value="#date_locked#">
	<input name="last_loaded" type="hidden" value="#now()#">
	</cfoutput>
	<tr bgcolor="#78A0EB" align="center" class="RegText">
		<td bgcolor="#78A0EB" colspan="4" class="RegTextWhite">
			You are currently set to  
			<cfinput type="text" name="express_input_rows" value="#session.workstream_express_input_rows#" size="1" maxlength="2" required="Yes" validate="integer" message="Please enter the number of lines you wish to input." class="SelectText">
			lines of input (max = 30), a width of   
			<cfinput type="text" name="express_notes_width" value="#session.workstream_express_notes_width#" size="2" required="Yes" validate="integer" message="Please enter a number for the notes box width." class="SelectText"> columns for the notes box and   
			<cfinput type="text" name="express_notes_height" value="#session.workstream_express_notes_height#" size="1" required="Yes" validate="integer" message="Please enter the number of rows for the notes box." class="SelectText">
			 row(s). Your folder box is set to a height of  
			<cfinput type="text" name="express_tree_height" value="#session.workstream_express_tree_height#" size="3" required="Yes" validate="integer" message="Please enter a number for the height of the folder box." class="SelectText">
			. Expand express tree to this level:&nbsp;<cfoutput><label for="root"><input type="radio" name="expand_tree" id="root" value="yes,no,no"<cfif NOT compare(session.workstream_expand,"yes,no,no")> checked</cfif> class="SelectText"> Root</label>&nbsp;<label for="week"><input type="radio" name="expand_tree" id="week" value="yes,yes,no"<cfif NOT compare(session.workstream_expand,"yes,yes,no")> checked</cfif> class="SelectText"> Week</label>&nbsp;<label for="day"><input type="radio" name="expand_tree" id="day" value="yes,yes,yes"<cfif NOT compare(session.workstream_expand,"yes,yes,yes")> checked</cfif> class="SelectText"> Day</label></cfoutput>
		</td>
	</tr>
	<tr class="RegText">
		<td colspan="5" class="RegText">&nbsp;</td>
	</tr>
	<tr align="center" class="RegText">
		<td align="center" colspan="4" class="RegText">
			<input type="button" value="Submit Time Entry(s)" name="Submit" tabindex="3" class="RegText" onclick="check_form('hours')">
		</td>
    </tr>

