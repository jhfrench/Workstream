<!-- common_files/qry_get_ref_report_output_format.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_report_output_format.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="8/20/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.report_output_format_id" default="0">
<cfquery name="get_ref_report_output_format" datasource="#application.datasources.main#">
SELECT report_output_format_id, description
FROM REF_Report_Output_Format
WHERE <cfif attributes.report_output_format_id NEQ 0>report_output_format_id=#attributes.report_output_format_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_report_output_format=get_ref_report_output_format>