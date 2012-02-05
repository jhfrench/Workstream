<!-- Administration/qry_get_ref_control_rating.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_control_rating.cfm">
	<responsibilities>
		Query to get control_rating.
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

<cfparam name="attributes.control_rating_id" default="0">
<cfquery name="get_ref_control_rating" datasource="#application.datasources.main#">
SELECT control_rating_id, description, sort_order
FROM REF_Control_Rating
WHERE <cfif attributes.control_rating_id NEQ 0>control_rating_id=#attributes.control_rating_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_control_rating=get_ref_control_rating>