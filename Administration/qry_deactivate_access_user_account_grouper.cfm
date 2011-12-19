<!-- Administration/qry_deactivate_access_user_account_grouper.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_access_user_account_grouper.cfm">
	<responsibilities>
		I deactivate old NSM privileges for a specified user and NSM grouper.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<!--- deactivate old assignments --->
<cfquery name="deactivate_access_user_account_grouper" datasource="#application.datasources.main#">
UPDATE Access_User_Account_Grouper
SET active_ind=0
WHERE active_ind=1
	AND program_year_id=#attributes.program_year_id#
	AND module_id=#attributes.module_id#
	AND user_account_id IN (#attributes.user_account_id#)
	AND center_id <cfif isdefined("variables.deactivated_center_id")>IN (#variables.deactivated_center_id#)
	AND organization_id=#attributes.nsm_drilldown_organizations#<cfelse>IS NULL
	AND organization_id IN (#variables.deactivated_organization_id#)</cfif>
</cfquery>