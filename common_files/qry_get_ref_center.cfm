<!-- common_files/qry_get_ref_center.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_center.cfm">
	<responsibilities>
		I get NASA centers from REF_Center table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/13/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.display_all_centers_ind" default="0">
<cfquery name="get_ref_center" datasource="#application.datasources.main#">
SELECT center_id, description, center_code,
	abbreviation, sort_order <!--- use abbreviation for most display purposes --->
FROM REF_Center
WHERE active_ind=1<cfif attributes.display_all_centers_ind EQ 0><cfif isdefined("attributes.center_description") AND len(attributes.center_description)>
	AND description='#attributes.center_description#'<cfelseif isdefined("attributes.center_abbreviation") AND len(attributes.center_abbreviation)>
	AND abbreviation='#attributes.center_abbreviation#'</cfif><cfif isdefined("attributes.center_id") AND attributes.center_id NEQ 0>
	AND center_id IN (#attributes.center_id#)</cfif></cfif>
ORDER BY REF_Center.sort_order
</cfquery>
<cfset caller.get_ref_center=get_ref_center>