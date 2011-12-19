<!-- sourcecode/app_cf_settings.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="app_cf_settings.cfm">
	<responsibilities>
		I set application specific settings that can't be specified in Application Manager.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="3/12/2009" role="FuseCoder" comments="Created File">
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

<cfif NOT isdefined("application.private_fuseactions")>
	
	<cfscript>
		application.active_ind=1;
		application.application_full_name="NVDB:inst_459_date_#dateformat(variables.last_updated,'yyyy_mm_dd')#_#timeformat(variables.last_updated,'HH:MM')#_vers_587_env_21_host_83_email_21_lc_0_ldb_412_cust_1068";
		application.browser_navigation_enabled_ind=1;
		application.datasources.main=variables.datasources.application_manager;//$issue$: this should really be DB-driven
		application.datasources.application_manager=variables.datasources.application_manager;
		application.default_fuseaction="Home.home";
		application.erroremailfrom="NVDB@nasa.gov";
		application.html_title="NASA Vendor Database";
		application.inactive_link="pag_application_unavailable.cfm";
		application.installation_id=459;
		application.last_updated=createodbcdatetime(variables.last_updated);
			application.cache_escape="#dateformat(application.last_updated,'yyyymmdd')##timeformat(application.last_updated,'hhmmss')#"; //this string of numbers will only update during deployments, which is useful for managing css and javascript include caching
		application.login_for_error="session.last_name";
		application.product_id=122;
		application.product_name="NVDB";
		application.product_release_version="1.4.0";
		application.support_email_recipients="jeromy.h.french@nasa.gov";
		application.use_help_module_ind=1;
		application.use_help_faq_ind=1;
		application.use_help_search_ind=1;
		
		switch(variables.environment_name) {
			case "Development": {
				application.error_handling_enabled_ind=0;
				application.email_server_name="smtp.hq.nasa.gov";
				application.environment_name="Development";
				application.host_server_name="Nash";
				application.log_page_request_ind=0;
				break;
			}
			
			case "SEF": {
				application.error_handling_enabled_ind=1;
				application.email_server_name="smtp.hq.nasa.gov";
				application.environment_name="SEF";
				application.host_server_name="Procyon";
				application.log_page_request_ind=1;
				break;
			}
			
			case "Production": {
				application.error_handling_enabled_ind=1;
				application.email_server_name="smtp.hq.nasa.gov";
				application.environment_name="Production";
				application.host_server_name="Brass";
				application.log_page_request_ind=1;
				break;
			}
		}

		// this application does not use different program years
		attributes.program_year_id=1;
	</cfscript>
	
	<cfquery name="get_application_specific_settings" datasource="#application.datasources.application_manager#">
	SELECT setting_name, setting_value
	FROM Custom_Setting
	WHERE active_ind=1
		AND #application.last_updated#=#application.last_updated#
	ORDER BY setting_name
	</cfquery>

	<cfset application.application_specific_settings=structNew()>
	<cfif get_application_specific_settings.recordcount GT 0>
		<cflock type="EXCLUSIVE" scope="APPLICATION" timeout="#createtimespan(0,0,20,0)#" throwontimeout="No">
			<cfloop query="get_application_specific_settings">
				<cfset "application.application_specific_settings.#get_application_specific_settings.setting_name#"=get_application_specific_settings.setting_value>
			</cfloop>
		</cflock>
	</cfif>
	
	<cfquery name="get_secured_screens" datasource="#application.datasources.main#">
	SELECT REF_Screen.fuseaction
	FROM REF_Screen
		INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	WHERE REF_Screen.active_ind=1
		AND REF_Business_Function.active_ind=1
		AND REF_Business_Function.require_login_ind=1
	GROUP BY REF_Screen.fuseaction
	ORDER BY REF_Screen.fuseaction
	</cfquery>
	<cfset application.private_fuseactions=valuelist(get_secured_screens.fuseaction)>
</cfif>

<!--- set locale to US so that dollar signs would appear in the graphs
<cfset variables.locale=CreateObject("java", "java.util.Locale")>
<cfset variables.locale=variables.locale.init("en", "US")>
<cfset variables.locale.setDefault(variables.locale)> --->