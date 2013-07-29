<!-- common_files/qry_get_ref_file_type.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_file_type.cfm">
	<responsibilities>
		I look up known files and their entensions
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/29/2013" role="FuseCoder" comments="Created File">
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

<cfquery name="get_ref_file_type" datasource="#application.datasources.main#">
SELECT description, extension, sort_order
FROM REF_File_Type
WHERE REF_File_Type.active_ind=1
ORDER BY sort_order
</cfquery>
<cfset application.application_specific_settings.valid_files=valuelist(get_ref_file_type.extension)>