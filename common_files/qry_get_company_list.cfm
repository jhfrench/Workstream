
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
	--> session.workstream_company_select_list: this is the list of company id's that the user has selscted as their list of companies that they have access to view information for.
<--company: this is the name company that is selected
<--company_id: the ID number associated with the selected company.
	END FUSEDOC --->
<cfquery name="get_company_list" datasource="#application.datasources.main#">
	select * 
	from REF_companies  
	where company_id IN(#session.workstream_company_select_list#)  
</cfquery>
</cfsilent>

