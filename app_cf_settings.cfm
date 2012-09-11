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

<cfif NOT isdefined("application.application_specific_settings.valid_files")>
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
	<cfscript>
		application.help.admin_business_function_id=246;
		application.help.active_ind=1;
		application.help.article_active_ind=1;
		application.help.faq_active_ind=1;
			application.help.active_ind=application.help.article_active_ind+application.help.faq_active_ind; //short-circuit the help module if neither Articles nor FAQ are active
		application.help.search_active_ind=1; //FYI: if articles and faq are inactivate there will be nothing to search

		application.team_changed=now();
		
		// $issue$ THIS SHOULD GO INTO REF_File_Type: description, extension, sort_order, created_by, created_date, active_ind
		application.application_specific_settings.valid_files="cfm,doc,gif,htm,jpg,msg,pdf,ppt,sql,vsd,txt,xls,zip";
	</cfscript>
</cfif>

<!--- this application does not use different program years --->
<cfset attributes.program_year_id=1>