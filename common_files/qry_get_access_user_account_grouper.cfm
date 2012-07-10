<!-- common_files/qry_get_access_user_account_grouper.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_phasing_plan_children.cfm">
	<responsibilities>
		Returns a record if the specified user has the specified privilege to the specified organization for the specified module and specified program year.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="get_access_user_account_grouper" datasource="#application.datasources.main#">
SELECT *
FROM Access_User_Account_Grouper
WHERE active_ind=1
	AND program_year_id=#attributes.program_year_id#
	AND module_id=#attributes.module_id#
	AND privilege_id=#attributes.privilege_id#
	AND organization_id=#attributes.organization_id#<cfif isdefined("attributes.center_id")>
	AND COALESCE(center_id,0)=#attributes.center_id#</cfif>
	AND user_account_id=#attributes.user_account_id#
</cfquery>
<cfset caller.get_access_user_account_grouper=get_access_user_account_grouper>