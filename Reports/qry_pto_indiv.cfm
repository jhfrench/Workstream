
<!--Reports/qry_PTO_Indiv.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfquery name="Showhours" datasource="#application.datasources.main#">          
	SELECT Time_entry.hours, Time_entry.date
	FROM PTO_Hours INNER JOIN
	    Emp_contact ON PTO_Hours.emp_id = Emp_contact.emp_id INNER JOIN
	    Time_entry ON PTO_Hours.emp_id = Time_entry.emp_id
	WHERE (emp_contact.emp_id = '#attributes.drill_down#') AND (Time_entry.project_id IN (SELECT project_id
																							FROM Project
																							WHERE project_type_id = 1)) 
									and year(time_entry.date) = year(CURRENT_TIMESTAMP)
	ORDER BY Time_entry.date
	</cfquery>