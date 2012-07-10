
<!--Marketing/qry_del_marketing_contact.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that removes the associaton between a person and a marketing code.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="del_marketing_contact" datasource="#application.datasources.main#">
    delete from marketing_emp
    where emp_id = #attributes.emp_id#
</cfquery>
