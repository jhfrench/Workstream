
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
	||
	END FUSEDOC --->
</cfsilent>
<table>
<cfoutput query="get_locations">
	<tr>
		<td colspan="2" class="RegTextBd">#location_type#</td>
	</tr>
	<tr>
		<td align="right">Address 1:</td>
		<td><cfinput type="Text" name="address1_#location_type_id#" value="#evaluate("address1_#location_type_id#")#" size="27"></td>
	</tr>
	<tr>
		<td align="right">Address 2:</td>
		<td><cfinput type="Text" name="address2_#location_type_id#" value="#evaluate("address2_#location_type_id#")#" size="27"></td>
	</tr>
	<tr>
		<td align="right">City, State Zip</td>
		<td><cfinput type="Text" name="city_#location_type_id#" value="#evaluate("city_#location_type_id#")#" size="12">, <cfselect name="state_#location_type_id#" query="get_states" selected="#evaluate("state_#location_type_id#")#" value="state_abbr" display="state_abbr"></cfselect> <cfinput type="Text" name="zip_#location_type_id#" value="#evaluate("zip_#location_type_id#")#" validate="zipcode" message="Please enter a valid #location_type# zip code." size="5"></td>
	</tr>
</cfoutput>
</table>

