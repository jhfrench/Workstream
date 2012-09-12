
<!--Tools/qry_insert_forecast_assignment.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfif attributes.sum_assigned GT 0>
<cfquery name="insert_forecast_assignment" datasource="#application.datasources.main#">
/*EXECUTE LOOP: #variables.subordinates_emp_id#*/
	<cfloop query="get_prospectives">
		<cfif isdefined("attributes.accept_#task_id#")>
		UPDATE Team
		SET active_ind=0
		WHERE Team.role_id=4
			AND Team.task_id=#task_id#
			AND emp_id IN (#variables.subordinates_emp_id#);
			<cfloop list="#variables.subordinates_emp_id#" index="variables.emp_id">
				<cfif evaluate("attributes.t#task_id#_#ii#") NEQ 0>
				UPDATE Forecast_Assignment
				SET active_ind=0
				WHERE active_ind=1
					AND forecast_id=#variables.forecast_id#
					AND task_id=#task_id#
					AND emp_id=#variables.emp_id#;

				INSERT INTO Forecast_Assignment (forecast_id, task_id, emp_id,
					hours_budgeted)
				VALUES (#variables.forecast_id#, #task_id#, #variables.emp_id#,
					#evaluate("attributes.t#task_id#_#ii#")#);

				/*update team membership*/
				INSERT INTO Team (task_id, emp_id, role_id)
				VALUES(#task_id#, #variables.emp_id#, 4);
				</cfif>
			</cfloop>
		</cfif>
	</cfloop>
</cfquery>
</cfif>
</cfsilent>

