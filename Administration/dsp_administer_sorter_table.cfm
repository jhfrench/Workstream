<!-- Administration/dsp_administer_sorter_table.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_administer_sorter_table.cfm">
	<responsibilities>
		I display the form for sorting FAAD system DB tables.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/28/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<cfoutput>
<cfform name="form_administer_sorter_table" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong>Administer System Sorter Table</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
			<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays sorting options for administrator">
				<tr>
					<td><label for="table_to_sort">Table to sort</label>: </td>
					<td><cfinput type="text" name="table_to_sort" id="table_to_sort" value="" size="50" maxlength="50" required="yes" message="Please enter name of the table to sort."></td>
				</tr>
				<tr>
					<td><label for="id_of_sorted_column">Primary key of table to sort</label>: </td>
					<td><cfinput type="text" name="id_of_sorted_column" id="id_of_sorted_column" value="" size="50" maxlength="50" required="yes" message="Please enter name of the id of sorted column"></td>
				<tr>
					<td><label for="text_of_sorted_column">Text of sorted column</label>: </td>
					<td><cfinput type="text" name="text_of_sorted_column" id="text_of_sorted_column" value="" size="50" maxlength="50" required="yes" message="Please enter name of the text of sorted column"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="submit" alt="submit" name="method" value=" Submit "/>
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</cfform>
</cfoutput>