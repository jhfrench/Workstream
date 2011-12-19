<!-- Administration/qry_insert_ref_business_function.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_business_function.cfm">
	<responsibilities>
		Query to insert new business function.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_business_function" datasource="#application.datasources.main#">
INSERT INTO REF_Business_Function (parent_business_function_id, description, acronym,
	require_login_ind, default_access_ind, viewable_ind,
	sort_order, created_by, active_ind)
VALUES (#attributes.parent_business_function_id#, '#attributes.description#', '#attributes.acronym#',
	#attributes.require_login_ind#, #attributes.default_access_ind#, #attributes.viewable_ind#,
	#attributes.sort_order#, #session.user_account_id#, #attributes.active_ind#)
</cfquery>
<cfquery name="get_business_function_id" datasource="#application.datasources.main#">
SELECT IDENT_CURRENT('REF_Business_Function') AS business_function_id
</cfquery>
<cfset caller.attributes.business_function_id=get_business_function_id.business_function_id>