<!-- common_files/qry_get_grouper_options_and_user_privileges.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_grouper_options_and_user_privileges.cfm">
	<responsibilities>
		I get all the values for a specified grouper, and the priveleges (relevant to the module we're working with) a user has for that value. If we're deeper than the top level of the NSM hierarchy, I limit the returned values to only the children of parents to which the user already has some sort of access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_grouper_options_and_user_privileges" datasource="#application.datasources.main#">
	<cfinclude template="sql_get_grouper_options_and_user_privileges.cfm">
</cfquery>