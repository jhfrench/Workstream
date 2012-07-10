
<!--Reports/qry_it_time_sub.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the it_time report breakdown of individual member performance.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="it_time_sub" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.lname, Emp_Contact.name, IT_Percent.it_hours, IT_Percent.it_time_percent
FROM Emp_Contact,
	(SELECT IT_Hours.emp_id, COALESCE(IT_Hours.it_hours,0) AS it_hours, COALESCE(((IT_Hours.it_hours/Ttl_hours.ttl_hours)*100),0) AS it_time_percent
	FROM
		(SELECT Emp_Contact.emp_id, COALESCE(SUM(hours),0) AS it_hours
		FROM Time_Entry, Emp_Contact
		WHERE Time_Entry.emp_id=*Emp_Contact.emp_id
			AND Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#)
			AND Time_Entry.project_id=1113
			AND EXTRACT(MONTH FROM Time_Entry.date)=#attributes.admin_month#
			AND EXTRACT(YEAR FROM Time_Entry.date)=#attributes.admin_year#
		GROUP BY Emp_Contact.emp_id)
	AS IT_Hours,
		(SELECT Emp_Contact.emp_id, SUM(hours) AS ttl_hours
		FROM Time_Entry, Emp_Contact
		WHERE Time_Entry.emp_id=*Emp_Contact.emp_id
			AND Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#)
			AND EXTRACT(MONTH FROM Time_Entry.date)=#attributes.admin_month#
			AND EXTRACT(YEAR FROM Time_Entry.date)=#attributes.admin_year#
		GROUP BY Emp_Contact.emp_id)
	AS Ttl_hours
	WHERE IT_Hours.emp_id=Ttl_Hours.emp_id)
AS IT_Percent
WHERE Emp_Contact.emp_id=IT_Percent.emp_id
ORDER BY Emp_Contact.lname, Emp_Contact.name, Emp_Contact.emp_id
</cfquery>
</cfsilent>
