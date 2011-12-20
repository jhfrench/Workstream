
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
WHERE emp_id=#attributes.emp_id#
</cfquery> 

<cfquery name="company_entry" datasource="#application.datasources.main#">
INSERT INTO Link_Company_Emp_Contact (emp_id, company_id)
VALUES(#attributes.emp_id#,#attributes.company_id#)
</cfquery> 

</cfsilent>