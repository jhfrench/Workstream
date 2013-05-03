<!-- Administration/dsp_administer_sorter_table.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_administer_sorter_table.cfm">
	<responsibilities>
		I display the form for sorting system DB tables.
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

<cfform name="form_administer_sorter_table" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
<fieldset>
	<legend><h2>Resort Drop-Down Tables</h2></legend>
	<div class="control-group">
		<label for="table_to_sort" class="control-label">Table to sort</label>
		<div class="controls">
			<cfinput type="text" name="table_to_sort" id="table_to_sort" value="" size="50" maxlength="50" required="yes" message="Please enter name of the table to sort." />
		</div>
	</div>
	<div class="control-group">
		<label for="id_of_sorted_column" class="control-label">Primary key of table to sort</label>
		<div class="controls">
			<cfinput type="text" name="id_of_sorted_column" id="id_of_sorted_column" value="" size="50" maxlength="50" required="yes" message="Please enter name of the id of sorted column" />
		</div>
	</div>
	<div class="control-group">
		<label for="text_of_sorted_column" class="control-label">Text of sorted column</label>
		<div class="controls">
			<cfinput type="text" name="text_of_sorted_column" id="text_of_sorted_column" value="" size="50" maxlength="50" required="yes" message="Please enter name of the text of sorted column" />
		</div>
	</div>
	<div class="form-actions">
		<span class="btn-group">
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</span>
	</div>
</fieldset>
</cfform>