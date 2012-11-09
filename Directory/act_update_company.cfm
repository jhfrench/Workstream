
<!-- Directory/act_update_company.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the company table.

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="company_delete" datasource="#application.datasources.main#">
DELETE FROM Company
WHERE user_account_id=#attributes.user_account_id#
</cfquery> 

<cfquery name="company_entry" datasource="#application.datasources.main#">
INSERT INTO Link_Company_Emp_Contact (user_account_id, company_id)
VALUES(#attributes.user_account_id#,#attributes.company_id#)
</cfquery> 

</cfsilent>
