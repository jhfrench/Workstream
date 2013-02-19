<!-- common_files/act_administer_sorter_table.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="act_administer_sorter_table.cfm">
	<responsibilities>
		I act (send information to DB) when a user edits data in the sorter table and submits the form.
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
			attributes.table_to_sort: source of data that is being sorted
			attributes.id_of_sorted_column: primary key of table that is being sorted
			attributes.text_of_sorted_column: text description; default order by
			attributes.where: criteria used to limit data being sorted
			attributes.order_by: optional; if provided this is used to order the data (and is used instead of the attributes.text_of_sorted_column default)
		</out>
	</IO>
</fusedoc>
--->

<!--- if data has been submitted to this page, insert it into the DB ---->
<cfsetting requesttimeout="3000">
<cfparam name="attributes.table_to_sort" default="">
<cfparam name="attributes.id_of_sorted_column" default="">
<cfparam name="attributes.text_of_sorted_column" default="">
<cfparam name="attributes.use_transaction_ind" default="1">
<cfparam name="attributes.where" default="">
<cfparam name="attributes.order_by" default="">

<!--- if data has been submitted to this page, insert it into the DB ---->
<cfif len(attributes.table_to_sort) AND len(attributes.id_of_sorted_column) AND len(attributes.text_of_sorted_column)>
	<!--- truncate sorter table --->
	<cfinclude template="qry_truncate_sorter.cfm">

	<!--- nested cftransactions aren't allowed, so if this is being called within a cftransaction block set the attributes.use_transaction_ind variable to 0 --->
	<cfif attributes.use_transaction_ind>
		<cftransaction>
			<!--- insert new records into Sorter table ---->
			<cfinclude template="qry_insert_sorter.cfm">

			<!--- update table_to_sort --->
			<cfinclude template="qry_update_table_to_sort.cfm">
		</cftransaction>
	<cfelse>
		<!--- insert new records into Sorter table ---->
		<cfinclude template="qry_insert_sorter.cfm">

		<!--- update table_to_sort --->
		<cfinclude template="qry_update_table_to_sort.cfm">
	</cfif>
	<div class="alert alert-success">
		<strong>Got it</strong>
		<cfoutput>#attributes.table_to_sort# is now sorted by #attributes.text_of_sorted_column#.</cfoutput>
	</div>
</cfif>
