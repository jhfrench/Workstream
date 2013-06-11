
<!--Customers/act_edit_project_billing.cfm
	Author: Jeromy French -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I make changes to billing details.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="edit_project_billing" datasource="#application.datasources.main#">
<!--- all types --->
UPDATE Project
SET budget=#attributes.budget#,
	loe=#attributes.loe#
WHERE project_id=#attributes.project_id#
<cfswitch expression="#attributes.billable_type_id#">
	<cfcase value="3">
	<!--- flat-rate --->
	DELETE FROM Flat_Rate
	WHERE project_id=#attributes.project_id#;

	INSERT INTO Flat_Rate(project_id, rate_start_date, rate_end_date,
		months, budget)
	VALUES (#attributes.project_id#, #createodbcdate(attributes.start_date)#, #createodbcdate(attributes.end_date)#,
		#attributes.months#, #attributes.budget#);
	</cfcase>
	<cfcase value="4">
	<!--- per-incident --->
	DELETE FROM Incident_Rate
	WHERE project_id=#attributes.project_id#;

	INSERT INTO Incident_Rate(project_id,charge)
	VALUES (#attributes.project_id#,#attributes.charge#);
	</cfcase>
</cfswitch>
</cfquery>
</cfsilent>
<div class="alert alert-success">
	<strong>No problem!</strong>
	<cfif listcontains(variables.allowed_business_function_id,634)><p><a href="index.cfm?fuseaction=Reports.project_dashboard" class="btn">Check out the project dashboard</a></p></cfif>
</div>
