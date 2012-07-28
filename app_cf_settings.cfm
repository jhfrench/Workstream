<!-- sourcecode/app_cf_settings.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="app_cf_settings.cfm">
	<responsibilities>
		I set application specific settings that can't be specified in Application Manager.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="3/12/2009" role="FuseCoder" comments="Created File">
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
		application.application_full_name="workstream:inst_459_date_2009-11-13 14:15:19_vers_587_env_21_host_83_email_21_lc_0_ldb_412_cust_1068";
		application.browser_navigation_enabled_ind=1;
		application.datasources.main="workstream";
		application.erroremailfrom="workstream@ait.com";
		application.html_title="Workstream";
		application.inactive_link="pag_application_unavailable.cfm";
		application.installation_id=460;
		application.last_updated=createodbcdatetime(get_last_updated.last_updated);
		application.log_page_request_ind=1;
		application.login_for_error="session.last_name";
		application.product_id=122;
		application.product_name="Workstream";
		application.product_release_version="4.1.0";
		application.support_email_recipients="jeromy_french@hotmail.com";
		application.help.admin_business_function_id=246;
		application.help.active_ind=1;
		application.help.article_active_ind=0;
		application.help.faq_active_ind=1;
			application.help.active_ind=application.help.article_active_ind+application.help.faq_active_ind; //short-circuit the help module if neither Articles nor FAQ are active
		application.help.search_active_ind=1; //FYI: if articles and faq are inactivate there will be nothing to search

		application.team_changed=now();

		switch(variables.environment_name) {
			case "Development": {
				application.error_handling_enabled_ind=0;
				application.email_server_name="smtp.hq.nasa.gov";
				application.environment_name="Development";
				application.host_server_name="Nash";
				break;
			}

			case "SEF": {
				application.error_handling_enabled_ind=1;
				application.email_server_name="smtp.hq.nasa.gov";
				application.environment_name="SEF";
				application.host_server_name="Procyon";
				break;
			}

			case "Production": {
				application.error_handling_enabled_ind=1;
				application.email_server_name="smtp.hq.nasa.gov";
				application.environment_name="Production";
				application.host_server_name="Heckler";
				break;
			}
		}
	</cfscript>

	<cfquery name="get_application_specific_settings" datasource="#application.datasources.main#">
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

<!--- this application does not use different program years --->
<cfset attributes.program_year_id=1>