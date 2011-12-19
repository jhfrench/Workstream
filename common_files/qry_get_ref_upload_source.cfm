<!-- common_files/qry_get_ref_upload_source.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_upload_source.cfm">
	<responsibilities>
		I get the query for the source of upload.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="6/22/2007" role="FuseCoder" comments="Created File">
			$Id:$
			modified by LK 6/27/2007
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

<cfparam name="attributes.upload_source_id" default="0">
<cfquery name="get_ref_upload_source" datasource="#application.datasources.main#">
SELECT upload_source_id, description AS upload_source, abbreviation,
	upload_template, worksheet_name, no_dates_present, sort_order
FROM REF_Upload_Source
WHERE <cfif attributes.upload_source_id NEQ 0>upload_source_id=#attributes.upload_source_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_upload_source=get_ref_upload_source>