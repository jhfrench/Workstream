<!-- Administration/qry_deactivate_ref_priority.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_business_category.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Priority table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_business_category" datasource="#application.datasources.main#">
UPDATE REF_Business_Category
SET active_ind=0
WHERE active_ind=1
	AND business_category_id=#attributes.business_category_id#
</cfquery>
