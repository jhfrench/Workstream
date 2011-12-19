
<!--Customers/act_edit_engagement_billing.cfm
	Author: Jeromy French  -->
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
<cfquery name="edit_engagement_billing" datasource="#application.datasources.main#">
<!--- all types --->
UPDATE Project
SET Project.budget=#attributes.budget#, Project.LOE =#attributes.LOE#
WHERE Project.project_id=#attributes.project_id#
<cfswitch expression="#attributes.billable_type_id#">
<cfcase value="3">
<!--- flat-rate --->
DELETE
FROM Flat_Rate
WHERE project_id=#attributes.project_id#
INSERT INTO Flat_Rate(project_id,start_date,end_date,months,budget)
VALUES (#attributes.project_id#,#CreateODBCDate(attributes.start_date)#,#CreateODBCDate(attributes.end_date)#,#attributes.months#,#attributes.budget#)
</cfcase>
<cfcase value="4">
<!--- per-incident --->
DELETE
FROM Incident_Rate
WHERE project_id=#attributes.project_id#
INSERT INTO Incident_Rate(project_id,charge)
VALUES (#attributes.project_id#,#attributes.charge#)
</cfcase>
</cfswitch>
</cfquery>
<cfif engagement_dashboard_return EQ 1>
	<cflocation url="../index.cfm?fuseaction=Reports.engagement_dashboard&customer_id_filter=#customer_id_filter#&ie_emp_id_filter=#ie_emp_id_filter#&sort=#sort#&###Project_ID#" addtoken="no">
</cfif>
</cfsilent>

