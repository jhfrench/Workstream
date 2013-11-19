
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
<cfset variables.current_month=createodbcdate("#year(now())#-#month(now())#-01")>
<cftransaction isolation="read_committed">
	<cfinclude template="qry_get_forecast.cfm">
	<cfif get_forecast.recordcount EQ 0>
		<cfinclude template="qry_insert_forecast.cfm">
	</cfif>
	<cfquery name="update_task" datasource="#application.datasources.main#">
	UPDATE Link_Task_Task_Status
	SET active_ind=0
	WHERE task_id IN (<cfqueryparam value="#attributes.list_prospective_task_id#" cfsqltype="cf_sql_integer" list="true" />);

	/*loop through and process accepted tasks*/
	<cfloop list="#attributes.accept_task#" index="variables.task_id">
		UPDATE Task
		SET due_date=#createodbcdatetime(evaluate("attributes.task_due_date#variables.task_id#"))#<cfif isnumeric(evaluate("attributes.task_assigned#variables.task_id#"))>,
			budgeted_hours=(
				SELECT COALESCE(SUM(Time_Entry.hours),0)
				FROM Time_Entry
				WHERE Time_Entry.active_ind=1
					AND task_id=<cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />
					AND work_date < <cfqueryparam value="#variables.current_month#" cfsqltype="cf_sql_date" />
			)+#evaluate("attributes.task_assigned#variables.task_id#")#</cfif>
		WHERE task_id=<cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />;

		INSERT INTO Link_Task_Task_Status (task_id, task_status_id, created_by)
		VALUES (<cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />, #evaluate("attributes.task_status#variables.task_id#")#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);

		UPDATE Team
		SET active_ind=0
		WHERE Team.active_ind=1
			AND Team.role_id=4
			AND Team.task_id=<cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />
			AND Team.user_account_id IN (<cfqueryparam value="#attributes.list_subordinate_user_account_id#" cfsqltype="cf_sql_integer" list="true" />);

		UPDATE Forecast_Assignment
		SET active_ind=0
		WHERE active_ind=1
			AND forecast_id=<cfqueryparam value="#variables.forecast_id#" cfsqltype="cf_sql_integer" />
			AND task_id=<cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />
			AND user_account_id IN (<cfqueryparam value="#attributes.list_subordinate_user_account_id#" cfsqltype="cf_sql_integer" list="true" />);
			<cfloop list="#attributes.list_subordinate_user_account_id#" index="variables.user_account_id">
				<cfif evaluate("attributes.t#variables.task_id#_#variables.user_account_id#") NEQ 0>

				INSERT INTO Forecast_Assignment (forecast_id, task_id, user_account_id,
					hours_budgeted, created_by)
				VALUES (<cfqueryparam value="#variables.forecast_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.user_account_id#" cfsqltype="cf_sql_integer" />,
					#evaluate("attributes.t#variables.task_id#_#variables.user_account_id#")#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);

				/*update team membership*/
				INSERT INTO Team (task_id, user_account_id, role_id,
					created_by)
				VALUES(<cfqueryparam value="#variables.task_id#" cfsqltype="cf_sql_integer" />, <cfqueryparam value="#variables.user_account_id#" cfsqltype="cf_sql_integer" />, 4,
					<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />);
				</cfif>
			</cfloop>
	</cfloop>

	/*process tasks that were considered (attributes.list_prospective_task_id) but weren't accepted (attributes.accept_task);
		-deactivate tasks from Forecast_Assignment for current forecast_id,
		-status should be "on-hold" if time has been previously entered, "prospective" if not*/
	UPDATE Forecast_Assignment
	SET active_ind=0
	WHERE active_ind=1
		AND forecast_id=<cfqueryparam value="#variables.forecast_id#" cfsqltype="cf_sql_integer" />
		AND task_id IN (<cfqueryparam value="#attributes.list_prospective_task_id#" cfsqltype="cf_sql_integer" list="true" />)
		AND task_id NOT IN (<cfqueryparam value="#attributes.accept_task#" cfsqltype="cf_sql_integer" list="true" />);

	INSERT INTO Link_Task_Task_Status (task_id, task_status_id, created_by)
	SELECT Task.task_id,
		CASE
			WHEN COALESCE(Time_Entry.entry_count,0) > 0 THEN 9 /* on-hold */
			ELSE 10 /* prospective */
		END AS task_status_id,
		<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" /> AS created_by
	FROM Task
		LEFT OUTER JOIN (
			SELECT task_id, COUNT(task_id) AS entry_count
			FROM Time_Entry
			WHERE active_ind=1
				AND hours > 0
			GROUP BY task_id
		) Time_Entry ON Task.task_id=Time_Entry.task_id
	WHERE Task.task_id IN (<cfqueryparam value="#attributes.list_prospective_task_id#" cfsqltype="cf_sql_integer" list="true" />)
		AND Task.task_id NOT IN (<cfqueryparam value="#attributes.accept_task#" cfsqltype="cf_sql_integer" list="true" />);
	</cfquery>
</cftransaction>
</cfsilent>