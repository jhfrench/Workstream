<!-- Administration/act_process_upload.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_process_upload.cfm">
	<responsibilities>
		I process the upload from the upload function.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/22/2007" role="FuseCoder" comments="Created File">
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

<cfsetting requesttimeout="30000">

<cfset variables.display_message="">
<cfset variables.error_ind=0>

<cfif NOT isdefined("attributes.upload_source_id")>
	<cfset variables.display_message="Please select a catagory from the select box. You must choose appropriate Upload module for the excel file data.">
<cfelse>
	<cfmodule template="../common_files/qry_get_ref_upload_source.cfm" upload_source_id="#attributes.upload_source_id#">
	<cfinclude template="../common_files/act_save_log_upload.cfm">

	<cfif NOT isdefined("attributes.program_year_specified_ind")>
		<cfquery name="get_load_program_year" datasource="#application.datasources.main#">
		SELECT program_year_id
		FROM REF_Date
		WHERE odbc_date=#createodbcdate(now())#
		</cfquery>
		<cfset attributes.program_year_id=get_load_program_year.program_year_id>
	</cfif>

	<cfif NOT comparenocase(application.environment_name,"Development")>
			<!--- use custom tag to get data from the excel file and into a coldfusion query structure --->
			<cfx_Excel2Query
				file="#attributes.MY_FILE#"
				firstRowISHeader="false"
				sheet_name="#get_ref_upload_source.worksheet_name#"
				NoDates="#get_ref_upload_source.no_dates_present#"
				r_qresults="get_excel_data">
	<cfelse>
		<cftry>
			<!--- use custom tag to get data from the excel file and into a coldfusion query structure --->
			<cfx_Excel2Query
				file="#attributes.MY_FILE#"
				firstRowISHeader="false"
				sheet_name="#get_ref_upload_source.worksheet_name#"
				NoDates="#get_ref_upload_source.no_dates_present#"
				r_qresults="get_excel_data">

			<cfcatch type="Any">
				<cfset variables.display_message="The file type is incorrect. Please check the file sheet name (should be '#get_ref_upload_source.worksheet_name#') and try again, or contact the #application.product_name# Administrator.">
				<cfset variables.error_ind=1>
			</cfcatch>
		</cftry>
	</cfif>

	<!--- if the custom tag has the data with no problems, execute the CF template for loading and transforming the data to our database within a transaction --->
	<cfif variables.error_ind EQ 0 AND get_excel_data.recordcount GT 0>
		<cftransaction isolation="read_committed">
			<cfinclude template="#get_ref_upload_source.upload_template#">
		</cftransaction>
	<cfelseif variables.error_ind EQ 0>
		<cfset variables.display_message="The file contained no uploadable data.">
	</cfif>

	<!--- set upload_source_id to 0 so the upload drop-down won't be limited to the submitted upload_source_id --->
	<cfset attributes.upload_source_id=0>
</cfif>
<cfif len(variables.display_message)>
	<cfoutput>
	<div class="alert alert-error">#variables.display_message#</div>
	</cfoutput>
</cfif>
