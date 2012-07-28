
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
	 || 
	--> session.workstream_selected_company_id: this is the list of company id's that the user has selscted as their list of companies that they have access to view information for.
	<--company: string containing the name of the company
	<--company_id: id number that uniquely identifies the company
	<--date locked: date through which time can be entered into workstream (loop from present to date-locked)
	END FUSEDOC --->
<cfquery name="get_date_locked" datasource="#application.datasources.main#">
SELECT REF_Company.company_id, REF_Company.description AS company, Date_Locked.date_locked
FROM REF_Company
	LEFT OUTER JOIN Date_Locked ON REF_Company.company_id=Date_Locked.company_id
		AND Date_Locked.active_ind=1
WHERE REF_Company.company_id IN (#session.workstream_selected_company_id#)
ORDER BY REF_Company.description
</cfquery>
</cfsilent>
