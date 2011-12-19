<!-- Administration/qry_get_link_business_function_hier.cfm
	Author: Jeromy French -->
<!--- -->

<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_link_business_function_hier.cfm">
	<responsibilities>
		Query to get link business function hierarchy.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.l_b_f_h_id" default="0">

<cfquery name="get_link_business_function_hier" datasource="#application.datasources.main#">
SELECT l_b_f_h_id, business_function_id, l_p_y_h_id
FROM Link_Business_Function_Hier
WHERE <cfif attributes.l_b_f_h_id NEQ 0>l_b_f_h_id=#attributes.l_b_f_h_id#<cfelse>active_ind=1</cfif>
ORDER BY l_b_f_h_id
</cfquery>
<cfset caller.get_link_business_function_hier=get_link_business_function_hier>

