<!-- Administration/qry_deactivate_ref_report_output_format.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_report_output_format.cfm">
	<responsibilities>
		Query to diactivate a record in REF_Report_Output_Format table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/27/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_report_output_format" datasource="#application.datasources.main#">
UPDATE REF_Report_Output_Format
SET active_ind=0
WHERE active_ind=1
	AND report_output_format_id=#attributes.report_output_format_id#
</cfquery>
