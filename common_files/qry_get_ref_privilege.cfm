<!-- common_files/qry_get_ref_privilege.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_privilege.cfm">
	<responsibilities>
		Query to get privilege for assigning to the user.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.privilege_id" default="0">
<cfparam name="attributes.exclude_privilege_id" default="0">
<cfquery name="get_ref_privilege" datasource="#application.datasources.main#">
SELECT privilege_id, description, sort_order
FROM REF_Privilege
WHERE <cfif attributes.privilege_id NEQ 0>privilege_id=#attributes.privilege_id#<cfelse>active_ind=1</cfif><cfif len(attributes.exclude_privilege_id)>
	AND privilege_id NOT IN (#attributes.exclude_privilege_id#)</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_privilege=get_ref_privilege>