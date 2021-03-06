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

<cfif NOT isdefined("application.team_changed")>
	<cfinclude template="common_files/qry_get_secured_screens.cfm">
	<cfinclude template="common_files/qry_get_ref_file_type.cfm">

	<cfscript>
		application.help.admin_business_function_id=246;
		application.help.active_ind=1;
		application.help.article_active_ind=1;
		application.help.faq_active_ind=1;
			application.help.active_ind=application.help.article_active_ind+application.help.faq_active_ind; //short-circuit the help module if neither Articles nor FAQ are active
		application.help.search_active_ind=1; //FYI: if articles and faq are inactivate there will be nothing to search

		application.team_changed=now();
	</cfscript>
</cfif>

<!--- this application does not use different program years --->
<cfset attributes.program_year_id=1>