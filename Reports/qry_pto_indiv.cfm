
<!--Reports/qry_PTO_Indiv.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:40  stetzer
<>

Revision 1.2  2001-10-15 14:22:26-04  long
Removed hard code of the project_id and sub-ed in a query that gets the ID of the PTO project code.

Revision 1.1  2001-10-11 11:03:50-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfquery name="Showhours" datasource="#application.datasources.main#">          
	SELECT Time_entry.hours, Time_entry.date
	FROM PTO_Hours INNER JOIN
	    Emp_contact ON PTO_Hours.emp_id = Emp_contact.emp_id INNER JOIN
	    Time_entry ON PTO_Hours.emp_id = Time_entry.emp_id
	WHERE (emp_contact.emp_id = '#attributes.drill_down#') AND (Time_entry.project_ID IN (SELECT project_id
																							FROM Project
																							WHERE project_type_id = 1)) 
									and year(time_entry.date) = year(GETDATE())
	ORDER BY Time_entry.date
	</cfquery>