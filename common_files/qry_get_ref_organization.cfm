<!-- common_files/qry_get_ref_organization.cfm
	Author: Jeromy French -->
<!--- -->

<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_organization.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/5/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.organization_id" default="0">
<cfparam name="attributes.passed_in_organization_description" default="">
<cfparam name="attributes.passed_in_organization_code" default="">
<cfquery name="get_ref_organization" datasource="#application.datasources.main#">
SELECT organization_id, description, organization_code,
	abbreviation, sort_order, description||' ('||organization_code||')' AS drop_down_display
FROM REF_Organization
WHERE <cfif attributes.organization_id NEQ 0>organization_id=#attributes.organization_id#<cfelse>active_ind=1</cfif><cfif len(attributes.passed_in_organization_description)>
	AND UPPER(description)=UPPER('#attributes.passed_in_organization_description#')</cfif><cfif len(attributes.passed_in_organization_code)>
	AND UPPER(organization_code)=UPPER('#attributes.passed_in_organization_code#')</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_organization=get_ref_organization>