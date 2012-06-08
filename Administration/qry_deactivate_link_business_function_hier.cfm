<!-- Administration/qry_deactivate_link_business_function_hier.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_link_business_function_hier.cfm">
	<responsibilities>
		Query to deactivate a record in Link_Business_Function_Hier table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_Link_Business_Function_Hier" datasource="#application.datasources.main#">
UPDATE Link_Business_Function_Hier
SET active_ind=0
WHERE active_ind=1
	AND l_b_f_h_id=#attributes.l_b_f_h_id#
</cfquery>

