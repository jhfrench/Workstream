
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
/*EXECUTE LOOP : #emp_id_loop#*/
	<cfloop query="get_prospectives">
		<cfif isdefined("attributes.accept_#task_id#")>
			<cfloop list="#emp_id_loop#" index="ii">
				<cfif evaluate("attributes.t#task_id#_#ii#") NEQ 0>
				UPDATE Forecast_Assignment
				SET active_ind=0
				WHERE active_ind=1
					AND forecast_id=#variables.forecast_id#
					AND task_id=#task_id#
					AND emp_id=#ii#;

				INSERT INTO Forecast_Assignment (forecast_id, task_id, emp_id,
					hours_budgeted)
				VALUES (#variables.forecast_id#, #task_id#, #ii#,
					#evaluate("attributes.t#task_id#_#ii#")#);

				/*update team membership*/
				DELETE FROM Team
				WHERE Team.role_id=4
					AND Team.task_id=#task_id#
					AND Team.emp_id=#ii#;

				INSERT INTO Team (task_id, emp_id, role_id)
				VALUES(#task_id#, #ii#, 4);
				</cfif>
			</cfloop>
		</cfif>
	</cfloop>
</cfquery>
</cfif>
</cfsilent>

