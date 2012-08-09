
<!--Reports/qry_efficiency_report_sub.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the efficiency report breakdown of individual member performance.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="efficiency_report_sub" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.lname, Emp_Contact.name, Efficiency_Percent.efficiency_hours, Efficiency_Percent.efficiency_percent
FROM Emp_Contact,
	(
	SELECT Efficiency_Hours.emp_id, COALESCE(Efficiency_Hours.efficiency_hours,0) AS efficiency_hours, COALESCE(((Efficiency_Hours.efficiency_hours/Ttl_hours.ttl_hours)*100),0) AS efficiency_percent
	FROM (
			SELECT Emp_Contact.emp_id, COALESCE(SUM(hours),0) AS efficiency_hours
			FROM Emp_Contact
				LEFT OUTER JOIN Time_Entry ON Emp_Contact.emp_id=Time_Entry.emp_id
					AND Time_Entry.project_id=#variables.project_id#
					AND Time_Entry.active_ind=1
					AND EXTRACT(MONTH FROM Time_Entry.date)=#attributes.admin_month#
					AND EXTRACT(YEAR FROM Time_Entry.date)=#attributes.admin_year#
			WHERE  Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#)
			GROUP BY Emp_Contact.emp_id
		) AS Efficiency_Hours,
		(
			SELECT Emp_Contact.emp_id, SUM(hours) AS ttl_hours
			FROM Emp_Contact
				LEFT OUTER JOIN Time_Entry ON Emp_Contact.emp_id=Time_Entry.emp_id
					AND Time_Entry.active_ind=1
					AND EXTRACT(MONTH FROM Time_Entry.date)=#attributes.admin_month#
					AND EXTRACT(YEAR FROM Time_Entry.date)=#attributes.admin_year#
			WHERE Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#)
			GROUP BY Emp_Contact.emp_id
		) AS Ttl_hours
	WHERE Efficiency_Hours.emp_id=Ttl_Hours.emp_id
	) AS Efficiency_Percent
WHERE Emp_Contact.emp_id=Efficiency_Percent.emp_id
ORDER BY Emp_Contact.lname, Emp_Contact.name, Emp_Contact.emp_id
</cfquery>
</cfsilent>
