
<!--common_files/qry_get_company_list.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the companies that are visible to the current user.

	||
	Edits:
	$Log$
	||
	--> session.workstream_selected_company_id: this is the list of company id's that the user has selscted as their list of companies that they have access to view information for.
<--company: this is the name company that is selected
<--company_id: the ID number associated with the selected company.
	END FUSEDOC --->
<cfquery name="get_company_list" datasource="#application.datasources.main#">
SELECT * 
FROM REF_Company
WHERE company_id IN (#session.workstream_selected_company_id#)  
</cfquery>
</cfsilent>

