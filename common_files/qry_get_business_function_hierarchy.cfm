<!-- common_files/qry_get_business_function_hierarchy.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_business_function_hierarchy.cfm">
	<responsibilities>
		I get the meta-data that describes the different levels that make up the NSM structure for the specified program year. I can also accept and module or business function criteria.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/27/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_business_function_hierarchy" cachedwithin="#createtimespan(0,0,60,0)#" datasource="#application.datasources.main#">
<cfinclude template="sql_get_business_function_hierarchy.cfm">
ORDER BY Link_Business_Function_Hier.sort_order, Hierarchy_Structure.level_order, Hierarchy_Structure.sort_order
</cfquery>
<cfset caller.get_business_function_hierarchy=get_business_function_hierarchy>