
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
	Revision 1.1  2005/03/09 18:12:41  stetzer
	<>

	Revision 1.1  2001-11-13 20:04:16-05  french
	Adding hours to sub chart.

	Revision 1.0  2001-11-07 16:37:07-05  french
	Adding team details to bottom of admin/planning report.

	Revision 1.0  2001-11-05 18:00:11-05  french
	Initial file creation and coding.

	||
	END FUSEDOC --->
<cfquery name="admin_planning_sub" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.lname, Emp_Contact.name, Admin_Planning_Percent.admin_hours, Admin_Planning_Percent.admin_planning_percent
FROM Emp_Contact,
	(SELECT Admin_Hours.emp_id, ISNULL(Admin_Hours.admin_hours,0) AS admin_hours, ISNULL(((Admin_Hours.admin_hours/Ttl_hours.ttl_hours)*100),0) AS admin_planning_percent
	FROM
		(SELECT Emp_Contact.emp_id, ISNULL(SUM(hours),0) AS admin_hours
		FROM Time_Entry, Emp_Contact
		WHERE Time_Entry.emp_id=*Emp_Contact.emp_id
			AND Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#)
			AND Time_Entry.project_id=1112
			AND MONTH(Time_Entry.date)=#attributes.admin_month#
			AND YEAR(Time_Entry.date)=#attributes.admin_year#
		GROUP BY Emp_Contact.emp_id)
	AS Admin_Hours,
		(SELECT Emp_Contact.emp_id, SUM(hours) AS ttl_hours
		FROM Time_Entry, Emp_Contact
		WHERE Time_Entry.emp_id=*Emp_Contact.emp_id
			AND Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#)
			AND MONTH(Time_Entry.date)=#attributes.admin_month#
			AND YEAR(Time_Entry.date)=#attributes.admin_year#
		GROUP BY Emp_Contact.emp_id)
	AS Ttl_hours
	WHERE Admin_Hours.emp_id=Ttl_Hours.emp_id)
AS Admin_Planning_Percent
WHERE Emp_Contact.emp_id=Admin_Planning_Percent.emp_id
ORDER BY Emp_Contact.lname, Emp_Contact.name, Emp_Contact.emp_id
</cfquery>
</cfsilent>
