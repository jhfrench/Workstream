<!-- Administration/pag_edit_ref_report_output_format.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_report_output_format.cfm">
	<responsibilities>
		I display the form for editing report output format and act(send information to DB) when the form is submitted.
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

<cfparam name="attributes.report_output_format_id" default="0">
<cfparam name="attributes.description" default="">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_report_output_format.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_report_output_format.cfm">
	<cfset attributes.report_output_format_id=0 >
</cfif>

<cfinclude template="../common_files/qry_get_ref_report_output_format.cfm">

<cfinclude template="dsp_edit_ref_report_output_format.cfm">