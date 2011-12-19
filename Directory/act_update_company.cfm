
<!-- directory/act_update_company.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the company table.

	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:46:23  daugherty
	Initial revision

	Revision 1.0  2002-02-14 09:21:09-05  long
	Created File

	||
	Variables:
	
	END FUSEDOC --->
<cfquery name="company_delete" datasource="#application.datasources.main#">
DELETE FROM Company
WHERE emp_id=#attributes.emp_id#
</cfquery> 

<cfquery name="company_entry" datasource="#application.datasources.main#">
INSERT INTO Company(emp_id,company)
VALUES(#attributes.emp_id#,#attributes.company_id#)
</cfquery> 

</cfsilent>
