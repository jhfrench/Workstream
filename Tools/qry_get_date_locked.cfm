
<!--Tools/qry_get_date_locked.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the date-locked of any companies the user chooses to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 21:01:57  daugherty
	Initial revision

	Revision 1.1  2001-11-13 15:11:03-05  french
	Made modifications to account for the possibility that a company does not have a date locked.

	Revision 1.0  2001-11-13 15:04:31-05  french
	Initial file creation.

	||
	--> session.workstream_company_select_list: this is the list of company id's that the user has selscted as their list of companies that they have access to view information for.
	<--company: string containing the name of the company
	<--company_id: id number that uniquely identifies the company
	<--date locked: date through which time can be entered into workstream (loop from present to date-locked)
	END FUSEDOC --->
<cfquery name="get_date_locked" datasource="#application.datasources.main#">
SELECT REF_Companies.company_id, REF_Companies.company, Date_Locked.date_locked
FROM REF_Companies, Date_Locked
WHERE REF_Companies.company_id*=Date_Locked.company_id
	AND REF_Companies.company_id IN(#session.workstream_company_select_list#)
ORDER BY REF_Companies.company
</cfquery>
</cfsilent>

