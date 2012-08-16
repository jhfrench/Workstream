<!-- Administration/pag_cause_error.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_cause_error.cfm">
	<responsibilities>
		I'm just here to cause an error, which will help to see if the error-handling is configured correctly.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="10/1/2007" role="FuseCoder" comments="Created File">
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
<cfif isdefined("attributes.error_handling_enabled_ind")>
	<cfset application.error_handling_enabled_ind=1>
<cfelse>
	<cfset application.error_handling_enabled_ind=0>
</cfif>

<cfparam name="attributes.show_error_process_ind" default="0">
<cfswitch expression="#attributes.show_error_process_ind#">
	<cfcase value="1">
		<cfset variables.intentional_cause_of_error=variables.setting_to_a_variable_that_will_never_exist>
	</cfcase>
	<cfcase value="2">
		<cfquery name="insert_error_info" datasource="#application.datasources.main#">
		SELECT column_that_will_never_exis
		FROM Table_That_Will_Never_Exist
		</cfquery>
	</cfcase>
</cfswitch>

<cfif isdefined("attributes.manually_process_error_ind")>
	<cfset application.error_handling_enabled_ind=0>

	<cfparam name="error.template" default="cfparam value">
	<cfparam name="error.querystring" default="cfparam value">
	<cfparam name="error.HTTPREFERER" default="cfparam value">
	<cfparam name="error.diagnostics" default="cfparam value">
	<cfparam name="error.remoteaddress" default="cfparam value">
	<cfparam name="error.browser" default="cfparam value">
	<cfparam name="error.datetime" default="#now()#">

	<cfinclude template="../#variables.path_prefix#errortemplates/act_setup_error_handling.cfm">
	<cfinclude template="../#variables.path_prefix#errortemplates/error.cfm">

<cfelseif isdefined("super_manually_process_error_ind")>
	<cfset application.error_handling_enabled_ind=0>

	<cfparam name="error.template" default="cfparam value">
	<cfparam name="error.querystring" default="cfparam value">
	<cfparam name="error.HTTPREFERER" default="cfparam value">
	<cfparam name="error.diagnostics" default="cfparam value">
	<cfparam name="error.remoteaddress" default="cfparam value">
	<cfparam name="error.browser" default="cfparam value">
	<cfparam name="error.datetime" default="#now()#">

	<cfquery name="insert_error_info" datasource="#application.datasources.main#">
	INSERT INTO Error_Log (installation_id, erroring_template, erroring_querystring, 
		http_referer, diagnostics, application_variables,
		username, remote_address, user_browser,
		error_web_datetime, error_sql_datetime)
	SELECT #application.installation_id#, '/jfrench/FAAD/trunk/sourcecode/index.cfm', 'fuseaction=Administration.cause_error',
		'http://serpens.indyne.ait.com/jfrench/FAAD/trunk/sourcecode/index.cfm?fuseaction=Administration.cause_error', 'Element SETTING_TO_A_VARIABLE_THAT_WILL_NEVER_EXIST is undefined in variables.<br />The error occurred on line 31.', 'FAAD:inst_169_date_2008-01-16 18:12:24_vers_244_env_21_host_1_e',
		'', '198.116.131.105', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.11) Gecko/20071127 Firefox/2.0.0.11',
		to_date('2008-02-01 10:27:01','YYYY-MM-DD HH24:MI:SS'), CURRENT_TIMESTAMP
	FROM Dual
	</cfquery>

	<cfquery name="get_next_error_log_id" datasource="#application.datasources.main#">
	SELECT CURRVAL('Error_Log_error_log_id_SEQ') AS error_log_id
	</cfquery>

	<cfoutput>
		error number: #get_next_error_log_id.error_log_id#
	</cfoutput>
</cfif>

<cfoutput>
Error console
<form name="form_cause_error" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
	<br />Enable error handling: <input type="checkbox" name="error_handling_enabled_ind" value="1"<cfif application.error_handling_enabled_ind> checked="checked"</cfif> />
	<br />Show error:<input type="radio" name="show_error_process_ind" id="show_error_process_ind_0" value="0" checked="checked" /><label for="show_error_process_ind_0">No</label>&nbsp;<input type="radio" name="show_error_process_ind" id="show_error_process_ind_1" value="1" /><label for="show_error_process_ind_">ColdFusion</label>&nbsp;<input type="radio" name="show_error_process_ind" id="show_error_process_ind_2" value="2" /><label for="2">Database</label>
	<br />Manually process error:<input type="checkbox" name="manually_process_error_ind" value="1" />
	<br />Super manually process error:<input type="checkbox" name="super_manually_process_error_ind" value="1" />
	<br /><input type="submit" name="submit" value="Submit" class="btn btn-primary" />
</form>
</cfoutput>