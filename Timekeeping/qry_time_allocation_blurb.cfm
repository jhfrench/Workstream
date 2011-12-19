
<!--Timekeeping/qry_time_allocation_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the hours an employee worked in the last two months.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:27:17  stetzer
	<>

	Revision 1.3  2002-01-02 15:59:17-05  french
	Correcting WHERE statement in the hours queries so that divide by zero doesn't occur in January. Re-instituting hours blurbs.

	Revision 1.2  2001-11-30 14:47:21-05  french
	Added customer name to query output.

	Revision 1.1  2001-10-11 10:54:38-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> session.user_account_id: number that uniquely identifies the user
 --->
<cfquery name="time_allocation_blurb" datasource="#application.datasources.main#">
SELECT SUM(hours) AS project_hours, (Customers.description + '-' + Project.description) AS project_name, Project.project_id
FROM Time_Entry, Project, Customers
WHERE Customers.customers_id=Project.customers_id
	AND Time_Entry.project_id=Project.project_id
	AND Time_Entry.emp_id=#session.user_account_id#
	AND MONTH(Time_Entry.date) = MONTH(GETDATE())
	AND YEAR(Time_Entry.date) = YEAR(GETDATE())
GROUP BY Customers.description, Project.description, Project.project_id
ORDER BY project_hours DESC
</cfquery>
</cfsilent>

