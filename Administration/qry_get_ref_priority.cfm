<!-- Administration/qry_get_ref_priority.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_priority.cfm">
	<responsibilities>
		Query to get priority.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.priority_id" default="0">
<cfquery name="get_ref_priority" datasource="#application.datasources.main#">
SELECT priority_id, description, sort_order
FROM REF_Priority
WHERE <cfif attributes.priority_id NEQ 0>priority_id=#attributes.priority_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_priority=get_ref_priority>