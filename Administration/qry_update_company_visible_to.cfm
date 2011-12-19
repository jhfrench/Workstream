
<!--Admin/qry_update_company_visible_to.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the modeul_access field of the User_Profile table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2006/07/05 17:24:56  french
	Initial revision.

	||
 --->
<cfquery name="update_company_visible_to" datasource="#application.datasources.main#">
/*wipe out old access*/
DELETE Company_Visible_To
WHERE emp_id=#attributes.emp_id#

/*insert new access*/
INSERT INTO Company_Visible_To (emp_id, company_id)
SELECT #attributes.emp_id# AS emp_id, company_id
FROM REF_Companies
WHERE company_id IN (#attributes.company_id#)
</cfquery>
</cfsilent>

