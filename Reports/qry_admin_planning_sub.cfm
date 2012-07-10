
<!--Reports/qry_admin_planning_sub.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the admin_planning report breakdown of individual member performance.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="admin_planning_sub" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.lname, Emp_Contact.name, Admin_Planning_Percent.admin_hours, Admin_Planning_Percent.admin_planning_percent
FROM Emp_Contact,
	(SELECT Admin_Hours.emp_id, COALESCE(Admin_Hours.admin_hours,0) AS admin_hours, COALESCE(((Admin_Hours.admin_hours/Ttl_hours.ttl_hours)*100),0) AS admin_planning_percent
	FROM
		(SELECT Emp_Contact.emp_id, COALESCE(SUM(hours),0) AS admin_hours
		FROM Time_Entry, Emp_Contact
		WHERE Time_Entry.emp_id=*Emp_Contact.emp_id
			AND Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#)
			AND Time_Entry.project_id=1112
			AND EXTRACT(MONTH FROM Time_Entry.date)=#attributes.admin_month#
			AND EXTRACT(YEAR FROM Time_Entry.date)=#attributes.admin_year#
		GROUP BY Emp_Contact.emp_id)
	AS Admin_Hours,
		(SELECT Emp_Contact.emp_id, SUM(hours) AS ttl_hours
		FROM Time_Entry, Emp_Contact
		WHERE Time_Entry.emp_id=*Emp_Contact.emp_id
			AND Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#)
			AND EXTRACT(MONTH FROM Time_Entry.date)=#attributes.admin_month#
			AND EXTRACT(YEAR FROM Time_Entry.date)=#attributes.admin_year#
		GROUP BY Emp_Contact.emp_id)
	AS Ttl_hours
	WHERE Admin_Hours.emp_id=Ttl_Hours.emp_id)
AS Admin_Planning_Percent
WHERE Emp_Contact.emp_id=Admin_Planning_Percent.emp_id
ORDER BY Emp_Contact.lname, Emp_Contact.name, Emp_Contact.emp_id
</cfquery>
</cfsilent>
