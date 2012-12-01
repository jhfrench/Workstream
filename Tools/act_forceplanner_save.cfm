
<!--Tools/act_forceplanner_save.cfm
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
<cftransaction isolation="read_committed">
	<cfinclude template="qry_get_forecast.cfm">
	<cfif get_forecast.recordcount EQ 0>
		<cfinclude template="qry_insert_forecast.cfm">
	</cfif>
	<cfquery name="update_task" datasource="#application.datasources.main#">
	/*EXECUTE LOOP*/
	<cfloop list="#attributes.list_prospective_task_id#" index="variables.task_id">
		<cfif listfind(attributes.accept_task,variables.task_id)>
			UPDATE Task
			SET status_id=#evaluate("attributes.task_status#variables.task_id#")#,
				due_date=#createodbcdatetime(evaluate("attributes.task_due_date#variables.task_id#"))#<cfif isnumeric(evaluate("attributes.task_assigned#variables.task_id#"))>,
				budgeted_hours=(
					SELECT COALESCE(SUM(Time_Entry.hours),0)
					FROM Time_Entry
					WHERE Time_Entry.active_ind=1
						AND task_id=#variables.task_id#
						AND date < '#month(now())#/1/#year(now())#'
				)+#evaluate("attributes.task_assigned#variables.task_id#")#</cfif>
			WHERE task_id=#variables.task_id#;
			
			UPDATE Team
			SET active_ind=0
			WHERE Team.active_ind=1
				AND Team.role_id=4
				AND Team.task_id=#variables.task_id#
				AND Team.user_account_id IN (#attributes.list_subordinate_user_account_id#);
				
			UPDATE Forecast_Assignment
			SET active_ind=0
			WHERE active_ind=1
				AND forecast_id=#variables.forecast_id#
				AND task_id=#variables.task_id#
				AND user_account_id IN (#attributes.list_subordinate_user_account_id#);
				<cfloop list="#attributes.list_subordinate_user_account_id#" index="variables.user_account_id">
					<cfif evaluate("attributes.t#variables.task_id#_#ii#") NEQ 0>
	
					INSERT INTO Forecast_Assignment (forecast_id, task_id, user_account_id,
						hours_budgeted, created_by)
					VALUES (#variables.forecast_id#, #variables.task_id#, #variables.user_account_id#,
						#evaluate("attributes.t#variables.task_id#_#ii#")#, #variables.user_identification#);
	
					/*update team membership*/
					INSERT INTO Team (task_id, user_account_id, role_id,
						created_by)
					VALUES(#variables.task_id#, #variables.user_account_id#, 4,
						#variables.user_identification#);
					</cfif>
				</cfloop>
		<cfelse>
			UPDATE Forecast_Assignment
			SET active_ind=0
			WHERE active_ind=1
				AND forecast_id=#variables.forecast_id#
				AND task_id=#variables.task_id#;

			UPDATE Task
			SET status_id=10 /* I think we're going for prospective here */
			WHERE task_id=#variables.task_id#;
		</cfif>
	</cfloop>
	</cfquery>
</cftransaction>
</cfsilent>