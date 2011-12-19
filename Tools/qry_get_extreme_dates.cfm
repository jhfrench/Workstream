
<!--Tools/qry_get_extreme_dates.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the date for the earliest and latest time entries for all companies that the user is allowed to see, and the difference, in months, between them.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 21:02:04  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:12-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	END FUSEDOC --->
<cfquery name="get_extreme_dates" datasource="#application.datasources.main#">
SELECT min(Time_Entry.date) AS min_date, max(Time_Entry.date) AS max_date, 
	DATEDIFF(m, min(Time_Entry.date), max(Time_Entry.date)) AS difference
FROM Time_Entry, Company
WHERE Time_Entry.emp_id=Company.emp_id
	AND Company.company IN (#session.workstream_company_select_list#)
</cfquery>
</cfsilent>

