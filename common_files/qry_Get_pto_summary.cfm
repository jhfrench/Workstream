
<!-- common_files/qry_get_pto_summary.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the rollup of the PTO HOURS report

	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
	
<cfquery name="pto_hours" datasource="#application.datasources.main#">
  	SELECT [name], lname, ec.emp_id, ISNULL(hours_taken_table.hours_taken, 0) as PTO_hours_used, ISNULL(earned_hours,0) as PTO_hours_earned, 
ISNULL(hours_earned.Earned_hours,0) - ISNULL(hours_taken_table.hours_taken,0)  as remain
	FROM
 		(SELECT SUM(te.hours) as hours_taken, emp_id
		FROM time_entry te
  		WHERE te.date >= (select pto_start_date from REF_companies where company_id = #session.workstream_company_id#) 
  		<cfif NOT listcontainsnoCase(attributes.form_Pin,"ALL" )> 
		 	AND (te.Emp_ID IN (#PreserveSingleQuotes(attributes.form_Pin)#))
		</cfif>
  		AND te.Project_id IN (SELECT project_id
								FROM Project
								WHERE project_type_id = 1)
		GROUP BY Emp_id) as hours_taken_table,

		(SELECT SUM(pg.granted_hours) as Earned_hours, emp_id
		FROM pto_grant pg
   		WHERE 1=1 
  		<cfif NOT listcontainsnoCase(attributes.form_Pin,"ALL" )> 
		 	AND (pg.Emp_ID IN (#PreserveSingleQuotes(attributes.form_Pin)#))
		</cfif>
		GROUP BY Emp_id) as hours_earned, 
		Emp_contact ec, security, company  
	WHERE ec.emp_id *= hours_taken_table.emp_id 
	AND security.emp_id = ec.emp_id
	AND company.emp_id = ec.emp_id
	AND hours_earned.emp_id =* ec.emp_id
	AND security.disable <> 1
	AND security.Disable_PTO <> 1
	AND company IN (#session.workstream_company_select_list#)
	
	<cfif NOT listcontainsnoCase(attributes.form_Pin,"ALL" )> 
	 	AND (ec.Emp_ID IN (#PreserveSingleQuotes(attributes.form_Pin)#))
	</cfif>
	
	ORDER BY company, lname, [name]
    </cfquery>
</cfsilent>
