
<!--Reports/qry_get_pto_names.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_pto_names" datasource="#application.datasources.main#">
SELECT Demographics.last_name, Demographics.first_name, Demographics.user_account_id
FROM Demographics
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
	INNER JOIN User_Account ON Demographics.user_account_id=Demographics.user_account_id
		AND User_Account.acount_type_id=1
WHERE Demographics.active_ind=1
	AND Link_Company_User_Account.company_id<cfif variables.all_option> IN (#session.workstream_selected_company_id#)<cfelse>=#session.workstream_company_id#
	AND (Demographics.user_account_id=#variables.user_identification#<cfif get_subordinates.recordcount> OR Demographics.user_account_id IN (#valuelist(get_subordinates.user_account_id)#,#variables.user_identification#)</cfif>)
	</cfif>
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>

