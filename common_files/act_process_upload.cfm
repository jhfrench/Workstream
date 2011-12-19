<!-- common_files/act_process_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_process_upload.cfm">
	<responsibilities>
		I process the upload from the upload function.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/22/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.use_excel_processing_ind" default="1">
<cfparam name="attributes.read_file_into_variable_ind" default="0">

<cfif NOT isdefined("attributes.upload_source_id")>
	<cfset variables.display_message="Please select a catagory from the select box. You must choose appropriate Upload module for the excel file data.">
<cfelse>
	<cfmodule template="qry_get_ref_upload_source.cfm" upload_source_id="#attributes.upload_source_id#">
	<!--- get template directory --->
	<cfset variables.full_file_path="#GetDirectoryfromPath(GettemplatePath())#Uploaded_Files">
	<cffile action="UPLOAD" destination="#variables.full_file_path#" filefield="form.my_file" nameconflict="OVERWRITE" variable="uploaded_contents">

	<cfif attributes.read_file_into_variable_ind>
		<cffile action="read" file="#cffile.ServerDirectory#/#cffile.serverfile#" variable="uploaded_contents">
	</cfif>
	
	<cfif application.application_specific_settings.archive_data_uploads_ind EQ 1>
		<cfinclude template="act_archive_upload.cfm">
	</cfif>

	<cfinclude template="act_log_upload.cfm">

	<cfif NOT isdefined("attributes.program_year_specified_ind")>
		<cfquery name="get_load_program_year" datasource="#application.datasources.main#">
		SELECT program_year_id
		FROM REF_Date
		WHERE odbc_date=#createodbcdate(now())#
		</cfquery>
		<cfset attributes.program_year_id=get_load_program_year.program_year_id>
	</cfif>

	<cfif attributes.use_excel_processing_ind>
		<cfif NOT comparenocase(application.environment_name,"Development")>
				<!--- use custom tag to get data from the excel file and into a coldfusion query structure --->
				<cfx_Excel2Query
					file="#attributes.MY_FILE#"
					firstRowISHeader="false"
					sheet_name="#get_ref_upload_source.worksheet_name#"
					NoDates="#get_ref_upload_source.no_dates_present#"
					r_qresults="get_excel_data">
				<cfset variables.process_ind=get_excel_data.recordcount>
		<cfelse>
			<cftry>
				<!--- use custom tag to get data from the excel file and into a coldfusion query structure --->
				<cfx_Excel2Query
					file="#attributes.MY_FILE#"
					firstRowISHeader="false"
					sheet_name="#get_ref_upload_source.worksheet_name#"
					NoDates="#get_ref_upload_source.no_dates_present#"
					r_qresults="get_excel_data">
				<cfset variables.process_ind=get_excel_data.recordcount>
	
				<cfcatch type="Any">
					<cfset variables.display_message="The file type is incorrect. Please check the worksheet name (should be '#get_ref_upload_source.worksheet_name#') and try again, or contact the ICET Administrator.">
					<cfset variables.error_ind=1>
				</cfcatch>
			</cftry>
		</cfif>
	<cfelse>
		<cfset variables.process_ind=1>
	</cfif>

	<!--- if the custom tag has the data with no problems, execute the CF template for loading and transforming the data to our database within a transaction --->
	<cfif variables.error_ind EQ 0 AND variables.process_ind GT 0>
		<cftransaction isolation="read_committed">
			<cfinclude template="#get_ref_upload_source.upload_template#">
		</cftransaction>
	<cfelseif variables.error_ind EQ 0>
		<cfset variables.display_message="The file contained no uploadable data.">
	</cfif>

	<!--- set upload_source_id to 0 so the upload drop-down won't be limited to the submitted upload_source_id --->
	<cfset attributes.upload_source_id=0>
</cfif>
<cfoutput>
<table summary="Table displays a message indicating the result of an upload.">
	<tr>
		<td class="bannerTxt">
			#variables.display_message#
		</td>
	</tr>
</table>
</cfoutput>
