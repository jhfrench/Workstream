<!-- Administration/qry_insert_ref_comments_type.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_comments_type.cfm">
	<responsibilities>
		Query to insert a new comments type.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_comments_type" datasource="#application.datasources.main#">
INSERT INTO REF_Comments_Type (description, created_by, active_ind,
	sort_order)
VALUES ('#attributes.description#', <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />, #attributes.active_ind#,
	#attributes.sort_order#)
</cfquery>