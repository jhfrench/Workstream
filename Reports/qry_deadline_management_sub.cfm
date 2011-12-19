
<!--Reports/qry_deadline_management_sub.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data used in the deadline management report breakdown of individual member performance.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:52  stetzer
	<>

	Revision 1.1  2001-11-08 09:33:14-05  french
	Added condition to remove tasks due in the future.

	Revision 1.0  2001-11-08 09:14:53-05  french
	Adding deadline management report.

	||
	--> get_subordinates.emp_id: query results from common_files/qry_get_subordinates.cfm
	<-- emp_id: number that uniquely identifies an employee
	<-- lname: string containing the last name of an employee
	<-- name: string containing the first name of an employee
	<-- on_time: decimal number that indicates the percent of tasks an employee has completed on time or early in the specified month
	END FUSEDOC --->
<cfquery name="deadline_management_sub" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.lname, Emp_Contact.name, (AVG(on_time)*100) AS on_time
FROM Emp_Contact,
	(SELECT emp_id, due_date, (CASE WHEN DATEDIFF(hh,complete_date,due_date) > -24 THEN 1.00 ELSE 0.00 END) AS on_time
	FROM Task, Team
	WHERE Team.task_id=Task.task_id
		AND Task.complete_date IS NOT NULL
		AND Task.due_date IS NOT NULL
		AND due_date <= GETDATE()
		AND Team.roll_id=1
		AND Team.emp_id IN (#valuelist(get_subordinates.emp_id)#)
		AND MONTH(Task.due_date)=#attributes.admin_month#
		AND YEAR(Task.due_date)=#attributes.admin_year#)
AS On_Time
WHERE Emp_Contact.emp_id=On_Time.emp_id
GROUP BY Emp_Contact.lname, Emp_Contact.name, Emp_Contact.emp_id
ORDER BY Emp_Contact.lname, Emp_Contact.name, Emp_Contact.emp_id
</cfquery>
</cfsilent>

