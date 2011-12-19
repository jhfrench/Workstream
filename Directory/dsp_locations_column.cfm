
<!--Directory/dsp_locations_column.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the employee details entry and edit form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:40  daugherty
Initial revision

Revision 1.1  2002-03-08 16:26:18-05  long
making this template prepopulate if information exists

Revision 1.0  2001-10-16 17:05:46-04  french
Initial revision

Revision 1.1  2001-10-11 10:56:12-04  long
Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
</cfsilent>
<table>
<cfoutput query="get_locations">
	<tr>
		<td colspan="2" class="RegText#session.workstream_text_size#Bd">#location_type#</td>
	</tr>
	<tr>
		<td align="right" class="RegText#session.workstream_text_size#">Address 1:</td>
		<td><cfinput type="Text" NAME="address1_#location_type_id#" value="#evaluate("address1_#location_type_id#")#" size="27" class="RegText#session.workstream_text_size#"></td>
	</tr>
	<tr>
		<td align="right" class="RegText#session.workstream_text_size#">Address 2:</td>
		<td><cfinput type="Text" NAME="address2_#location_type_id#" value="#evaluate("address2_#location_type_id#")#" size="27" class="RegText#session.workstream_text_size#"></td>
	</tr>
	<tr>
		<td align="right" class="RegText#session.workstream_text_size#">City, State Zip</td>
		<td><cfinput type="Text" NAME="city_#location_type_id#" value="#evaluate("city_#location_type_id#")#" size="12" class="RegText#session.workstream_text_size#">, <cfselect name="state_#location_type_id#" query="get_states" selected="#evaluate("state_#location_type_id#")#" value="state_abbr" display="state_abbr" class="RegText#session.workstream_text_size#"></cfselect> <cfinput type="Text" NAME="zip_#location_type_id#" value="#evaluate("zip_#location_type_id#")#" validate="zipcode" message="Please enter a valid #location_type# zip code." size="5" class="RegText#session.workstream_text_size#"></td>
	</tr>
</cfoutput>
</table>

