<!-- Application_Manager/main/act_insert_installation.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="act_insert_installation.cfm" Specification="2.0">
	<responsibilities>
		I process the creation of a new installation in the Application_Manager DB using data passed in from the 'create installation' wizard.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Log$
		</history>
	</properties>
</fusedoc>
--->

<cftransaction>
	<!--- Insert installation record, set installation_id to variable for following inserts --->
	<cfinclude template="qry_insert_installation.cfm">
	<cfset attributes.installation_id=qry_get_installation_id.installation_id>
	<cfinclude template="qry_insert_installation_url.cfm">
	
	<!--- Insert product_version record --->
	<cfinclude template="qry_insert_product_version.cfm">
	
	<!--- Insert supporting database record(s) if necessary --->
	<cfif attributes.supporting_database_count NEQ 0>
		<!--- For as many supporting DBs as the user specifies, insert a Supporting_Database record (if necessary, otherwise use existing) then link that record to the installation --->
		<cfloop from="1" to="#attributes.supporting_database_count#" index="database_count_ii">
			<!--- Insert supporting DB record(s), set supporting_database_id to variable for L_Installation_Supporting_DB inserts --->
			<cfinclude template="qry_insert_supporting_database.cfm">
			<cfset attributes.supporting_database_id=qry_get_supporting_database_id.supporting_database_id>
			<!--- Associate databases with installation --->
			<cfinclude template="qry_insert_l_installation_supporting_db.cfm">
		</cfloop>
	</cfif>
	
	<!--- Insert supporting contacts record(s) if necessary --->
	<cfset variables.supporting_contacts_loop=listlen(attributes.support_contact_info_id)>
	<cfif variables.supporting_contacts_loop NEQ 0>
		<cfloop from="1" to="#variables.supporting_contacts_loop#" index="support_contact_info_id_ii">
			<cfinclude template="qry_insert_l_installation_support_contact.cfm">
		</cfloop>
	</cfif>
</cftransaction>