<!-- Administration/qry_insert_ref_report_output_format.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_report_output_format.cfm">
	<responsibilities>
		Query to insert a new report output format into REF_Report_Output_Format table.
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

<cfquery name="insert_ref_report_output_format" datasource="#application.datasources.main#">
INSERT INTO REF_Report_Output_Format (description, created_by, active_ind,
	sort_order)
VALUES ('#attributes.description#', #session.user_account_id#, #attributes.active_ind#,
	#attributes.sort_order#)
</cfquery>