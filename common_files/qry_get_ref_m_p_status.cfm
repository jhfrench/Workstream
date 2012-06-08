<!-- common_files/qry_get_ref_m_p_status.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_m_p_status.cfm">
	<responsibilities>
		I display the form for editing priority and act(send information to DB) when the form is submitted.
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
<cfparam name="attributes.m_p_status_id" default="0">
<cfquery name="get_ref_m_p_status" datasource="#application.datasources.main#">
SELECT m_p_status_id, description, sort_order
FROM REF_m_p_status
WHERE <cfif attributes.m_p_status_id NEQ 0>m_p_status_id=#attributes.m_p_status_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_m_p_status=get_ref_m_p_status>