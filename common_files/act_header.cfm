<!-- common_files/act_header.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_header.cfm">
	<responsibilities>
		I process the header for NVDB.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/19/2007" role="FuseCoder" comments="Created File">
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

<!--- this string of numbers will always be unique, which is useful for defeating the browser caching of the Main navigation menu --->
<cfset variables.cache_escape="#dateformat(application.last_updated,'yyyymmdd')##timeformat(now(),'hhmmss')#">

<cfif listfindnocase("common_files.bad_fuseaction,Home.login,Home.forget_password,Home.forget_username", url.fuseaction)>
	<cfinclude template="dsp_header_login.cfm">
<cfelse>
	<cfinclude template="qry_get_user_access.cfm">
	<cfinclude template="qry_get_screen_details.cfm">

	<!--- are required variables defined? If not, tell user to change bookmarks --->
	<cfif len(get_screen_details.check_variable) AND len(get_screen_details.relocate)>
		<cfmodule template="variable_check.cfm" check_variable="#get_screen_details.check_variable#" relocate="#get_screen_details.relocate#">
	</cfif>

	<cfinclude template="qry_get_module_navigation.cfm">

	<cfif application.application_specific_settings.normal_navigation_ind NEQ 1>
		<cfset attributes.module_description=listfirst(replace(url.fuseaction,"_", " "),".")>
	</cfif>

	<cfinclude template="dsp_header.cfm">
</cfif>