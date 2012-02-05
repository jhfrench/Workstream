<!-- Administration/qry_get_business_function.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_business_function.cfm">
	<responsibilities>
		Query to retrieve business function(s) from REF_Business_Function table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/15/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_business_function" datasource="#application.datasources.main#">
SELECT business_function_id, parent_business_function_id, description,
	acronym, require_login_ind, default_access_ind,
	viewable_ind, sort_order, created_by,
	created_date, active_ind
FROM REF_Business_Function
WHERE <cfif attributes.business_function_id NEQ 0>business_function_id=#attributes.business_function_id#<cfelse>active_ind=1</cfif>
ORDER BY description
</cfquery>
<cfset caller.get_business_function=get_business_function>  