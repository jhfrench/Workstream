<!-- Administration/qry_deactivate_ref_business_function.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_business_function.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Business_Function table before a new insert.
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

<cfquery name="deactivate_ref_business_function" datasource="#application.datasources.main#">
UPDATE REF_Business_Function
SET active_ind=0
WHERE active_ind=1
	AND business_function_id=#attributes.business_function_id#
</cfquery>
