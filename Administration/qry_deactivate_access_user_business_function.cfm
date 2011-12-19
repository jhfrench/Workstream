<!-- Administration/qry_deactivate_access_user_business_function.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_access_user_business_function.cfm">
	<responsibilities>
		Query to deactivate record(s) in Access_User_Business_Function table before new insert(s).
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/26/2007" role="FuseCoder" comments="Created File">
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

<cfswitch expression="#application.application_specific_settings.assign_module_access_ind#">
	<cfcase value="0">
<cfquery name="deactivate_access_user_business_function" datasource="#application.datasources.main#">
UPDATE Access_User_Business_Function
SET active_ind=0
WHERE active_ind=1
	AND program_year_id=#attributes.program_year_id#
	AND user_account_id IN (#attributes.user_account_id#)
	AND business_function_id IN (#attributes.relevant_business_function_id#) /*only apply to business functions that were listed on the last page*/
	AND business_function_id IN (#attributes.old_business_function_id#) /*only deactivate previous access*/
	AND business_function_id NOT IN (#attributes.business_function_id#) /*only deactivate records to which the user no longer has access*/
</cfquery>
	</cfcase>
	<cfcase value="1">
<cfquery name="deactivate_access_user_business_function" datasource="#application.datasources.main#">
UPDATE Access_User_Business_Function
SET active_ind=0
WHERE active_ind=1
	AND program_year_id=#attributes.program_year_id#
	AND user_account_id IN (#attributes.user_account_id#)
</cfquery>
	</cfcase>
</cfswitch>