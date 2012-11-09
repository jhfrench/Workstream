
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
/*EXECUTE LOOP: #variables.subordinates_user_account_id#*/
	<cfloop query="get_prospectives">
		<cfif isdefined("attributes.accept_#task_id#")>
		UPDATE Team
		SET active_ind=0
		WHERE Team.role_id=4
			AND Team.task_id=#task_id#
			AND user_account_id IN (#variables.subordinates_user_account_id#);
			<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
				<cfif evaluate("attributes.t#task_id#_#ii#") NEQ 0>
				UPDATE Forecast_Assignment
				SET active_ind=0
				WHERE active_ind=1
					AND forecast_id=#variables.forecast_id#
					AND task_id=#task_id#
					AND user_account_id=#variables.user_account_id#;

				INSERT INTO Forecast_Assignment (forecast_id, task_id, user_account_id,
					hours_budgeted)
				VALUES (#variables.forecast_id#, #task_id#, #variables.user_account_id#,
					#evaluate("attributes.t#task_id#_#ii#")#);

				/*update team membership*/
				INSERT INTO Team (task_id, user_account_id, role_id,
					created_by)
				VALUES(#task_id#, #variables.user_account_id#, 4,
					#variables.user_identification#);
				</cfif>
			</cfloop>
		</cfif>
	</cfloop>
</cfquery>
</cfif>
</cfsilent>

