<!-- common_files/qry_get_user_preferences.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_preferences.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/31/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.user_account_id" default="0">
<cfparam name="attributes.user_preferences_id" default="0">

<cfquery name="get_user_preferences" datasource="#application.datasources.main#">
SELECT User_Preferences.user_preferences_id, User_Preferences.user_account_id, User_Preferences.program_year_id,
	User_Preferences.text_size, User_Preferences.numeric_multiplier_id, REF_Numeric_Multiplier.divisor_to_1,
	REF_Numeric_Multiplier.numeric_format_mask
FROM User_Preferences
	INNER JOIN REF_Numeric_Multiplier ON User_Preferences.numeric_multiplier_id=REF_Numeric_Multiplier.numeric_multiplier_id
WHERE <cfif attributes.user_preferences_id NEQ 0>User_Preferences.user_preferences_id=#attributes.user_preferences_id#<cfelse>User_Preferences.active_ind=1
	AND user_account_id=<cfif isdefined("variables.user_identification")><cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" /><cfelse>#get_username.user_account_id#</cfif></cfif>
ORDER BY User_Preferences.user_preferences_id
</cfquery>

<cfif get_user_preferences.recordcount>
	<cfscript>
		session.divisor_to_1=get_user_preferences.divisor_to_1;
		session.numeric_format_mask=get_user_preferences.numeric_format_mask;
		session.numeric_multiplier_id=get_user_preferences.numeric_multiplier_id;
		session.program_year_id=get_user_preferences.program_year_id;
		session.text_size=get_user_preferences.text_size;
	</cfscript>
<cfelse>
	<cfinclude template="../common_files/qry_get_current_program_year.cfm">
	<cfscript>
		session.divisor_to_1=1;
		session.numeric_format_mask="999,999,999,999,999";
		session.numeric_multiplier_id=1;
		session.program_year_id=get_current_program_year.program_year_id;
		session.text_size="none";
	</cfscript>
</cfif>

<cfset caller.get_user_preferences=get_user_preferences>
