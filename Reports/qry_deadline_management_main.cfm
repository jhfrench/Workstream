
<!--Reports/qry_deadline_management_main.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the data displayed in the main part of the Deadline Management report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:50  stetzer
	<>

	Revision 1.1  2001-11-08 09:33:13-05  french
	Added condition to remove tasks due in the future.

	Revision 1.0  2001-11-08 09:14:52-05  french
	Adding deadline management report.

	||
	--> get_subordinates.emp_id: query results from common_files/qry_get_subordinates.cfm
	<-- due_year: number containing a year
	<-- due_month: number containing a month
	<-- on_time_percent: decimal number that indicates the number of tasks in the given due_year and due_month that were completed on time or early.
	END FUSEDOC --->
<cfquery name="deadline_management_main" datasource="#application.datasources.main#">
SELECT YEAR(On_Time.due_date) AS due_year, MONTH(On_Time.due_date) AS due_month, (AVG(on_time)*100) AS on_time_percent
FROM
	(SELECT due_date, (CASE WHEN DATEDIFF(hh,complete_date,due_date) > -24 THEN 1.00 ELSE 0.00 END) AS on_time
	FROM Task, Team
	WHERE Team.task_id=Task.task_id
		AND complete_date IS NOT NULL
		AND due_date IS NOT NULL
		AND due_date <= GETDATE()
		AND Team.roll_id=1
		AND Team.emp_id IN (#valuelist(get_subordinates.emp_id)#))
AS On_Time
GROUP BY YEAR(On_Time.due_date), MONTH(On_Time.due_date)
ORDER BY due_year DESC, due_month DESC
</cfquery>
</cfsilent>

