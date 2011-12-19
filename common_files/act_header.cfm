<!-- common_files/act_header.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_header.cfm">
	<responsibilities>
		I make determinations that will result in the correct header being shown for this application and the desired page.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/19/2007" role="FuseCoder" comments="Created File">
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

<!--- this string of numbers will always be unique, which is useful for defeating the browser caching that interferes with Ajax calls --->
<cfset variables.cache_escape="#dateformat(now(),'yyyymmdd')##timeformat(now(),'hhmmss')#">

<!--- $issue$: the following list of login fuseactions would be nice to be DB-driven --->
<cfif listfindnocase("Home.login,Home.forget_password,Home.forget_username", url.fuseaction)>
	<cfinclude template="dsp_header_login.cfm">
<cfelse>
	<cfinclude template="qry_get_user_access.cfm">
	<cfinclude template="qry_get_screen_details.cfm">

	<!--- are required variables defined? If not, tell user to change bookmarks --->
	<cfif len(get_screen_details.check_variable) AND len(get_screen_details.relocate)>
		<cfmodule template="variable_check.cfm" check_variable="#get_screen_details.check_variable#" relocate="#get_screen_details.relocate#">
	</cfif>

	<cfinclude template="qry_get_module_navigation.cfm">
	<cfinclude template="qry_get_hidden_navigation_links.cfm">

	<cfif application.application_specific_settings.normal_navigation_ind NEQ 1>
		<cfset attributes.module_description=listfirst(replace(url.fuseaction,"_", " "),".")>
	</cfif>
	
	<cfinclude template="dsp_header_portal.cfm">
</cfif>
