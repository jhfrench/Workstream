
<!--Directory/qry_emp_benefits_entry.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a benefit record.
	||
	Name: Damon Scott
	||
	Edits: 
	
	||
	
 --->

<cfquery name="get_old_benefit" datasource="#application.datasources.main#">
SELECT TOP 1 benefit_id
FROM Benefit
WHERE emp_id = '#attributes.emp_id#'
	AND active_ind = 1
ORDER BY date_start DESC
</cfquery>

<cfif get_old_benefit.recordcount>
	<cfset variables.deactivate_record = 1>
<cfelse>
	<cfset variables.deactivate_record = 0>
</cfif>
	
<cfquery name="emp_benefits_entry" datasource="#application.datasources.main#">
INSERT INTO Benefit (emp_id, benefit_type_id, date_start,
	 active_ind, benefit_amount, note)
VALUES (#attributes.emp_id#, '#attributes.benefit_type#', '#date_start#',
	 1, #benefit_amount#, '#note#')
</cfquery>

<cfif variables.deactivate_record>
	<cfquery name="emp_benefits_update" datasource="#application.datasources.main#">
		UPDATE Benefit
		SET date_end = #Now()#,
			active_ind = 0
		WHERE benefit_id = #get_old_benefit.benefit_id#
	</cfquery>
</cfif>

</cfsilent>

