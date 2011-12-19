
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
Revision 1.1  2005/03/09 18:20:56  stetzer
<>

Revision 1.2  2001-12-12 11:00:53-05  long
added an onclick to the button  in javascript to validate the hours field then submit the form if it passes.

Revision 1.1  2001-10-11 10:55:12-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<cfoutput query="express_check_date">
    <input name="date_locked" type="hidden" value="#date_locked#">
	<input name="last_loaded" type="hidden" value="#now()#">
	</cfoutput>
	<tr bgcolor="#78A0EB" align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td bgcolor="#78A0EB" colspan="4" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>White">
			You are currently set to  
			<cfinput type="text" name="express_input_rows" value="#session.workstream_express_input_rows#" size="1" maxlength="2" required="Yes" validate="integer" message="Please enter the number of lines you wish to input." class="SelectText#session.workstream_text_size#">
			lines of input (max = 30), a width of   
			<cfinput type="text" name="express_notes_width" value="#session.workstream_express_notes_width#" size="2" required="Yes" validate="integer" message="Please enter a number for the notes box width." class="SelectText#session.workstream_text_size#"> columns for the notes box and   
			<cfinput type="text" name="express_notes_height" value="#session.workstream_express_notes_height#" size="1" required="Yes" validate="integer" message="Please enter the number of rows for the notes box." class="SelectText#session.workstream_text_size#">
			 row(s). Your folder box is set to a height of  
			<cfinput type="text" name="express_tree_height" value="#session.workstream_express_tree_height#" size="3" required="Yes" validate="integer" message="Please enter a number for the height of the folder box." class="SelectText#session.workstream_text_size#">
			. Expand express tree to this level:&nbsp;<cfoutput><label for="root"><input type="radio" name="expand_tree" id="root" value="yes,no,no"<cfif NOT compare(session.workstream_expand,"yes,no,no")> checked</cfif> class="SelectText#session.workstream_text_size#"> Root</label>&nbsp;<label for="week"><input type="radio" name="expand_tree" id="week" value="yes,yes,no"<cfif NOT compare(session.workstream_expand,"yes,yes,no")> checked</cfif> class="SelectText#session.workstream_text_size#"> Week</label>&nbsp;<label for="day"><input type="radio" name="expand_tree" id="day" value="yes,yes,yes"<cfif NOT compare(session.workstream_expand,"yes,yes,yes")> checked</cfif> class="SelectText#session.workstream_text_size#"> Day</label></cfoutput>
		</td>
	</tr>
	<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td colspan="5" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">&nbsp;</td>
	</tr>
	<tr align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td align="center" colspan="4" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<input type="button" value="Submit Time Entry(s)" name="Submit" tabindex="3" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>" onclick="check_form('hours')">
		</td>
    </tr>

