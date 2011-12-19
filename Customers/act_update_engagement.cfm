
<!--Customers/act_update_engagement.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I do the update to the engagement tables.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:33  daugherty
	Initial revision

	Revision 1.2  2001-11-15 10:13:04-05  long
	Changed the isolation level from Serializable to read_committed

	(KL | 9/12/2001) Bug fix so that the "Flat-Rate" function works right.
	(KL | 9/17/2001) Bug fix so that the "Flat-Rate" function works right.
	||
	-->project_id:  the id that indicates the engagement.
	END FUSEDOC --->

<cftransaction isolation="READ_COMMITTED">
<cfquery name="update_project" datasource="#application.datasources.main#">
UPDATE Project
SET description='#attributes.description#',
	project_code='#attributes.project_code#',
	budget=#attributes.budget#,
	billable_id=#attributes.billable_id#,
	active_id=#attributes.active_id#,
	company_id=#attributes.company_id#
WHERE Project_id=#project_id#
</cfquery>

<cfif billable_id eq 3>

	<cfquery name="get_flat_rate" datasource="#application.datasources.main#">
        SELECT project_id
		FROM Flat_Rate
		WHERE project_id=#attributes.project_id#
     </cfquery>
	<cfif get_flat_rate.recordcount>
		<cfquery name="update_flat_rate" datasource="#application.datasources.main#">
		UPDATE flat_rate
		SET months=#attributes.months#,
			start_date=#createodbcdate(attributes.start_date)#,
			end_date=#createodbcdate(attributes.end_date)#,
			budget=#attributes.budget#
		WHERE project_id=#attributes.project_id#
		</cfquery>
	<cfelse>
		<cfquery name="insert_flat_rate" datasource="#application.datasources.main#">
		INSERT INTO Flat_Rate (project_code, months, start_date,
			end_date, project_id, budget)
		VALUES ('#attributes.project_code#', #attributes.months#, '#attributes.start_date#',
			'#attributes.end_date#', #attributes.project_id#, #attributes.budget#)
		</cfquery>
	</cfif>
	
<cfelse>
	<cfquery name="delete_flat_rate" datasource="#application.datasources.main#">
        DELETE flat_rate
		WHERE project_id=#attributes.project_id#
     </cfquery>		
</cfif>

<cfquery name="delete_old" datasource="#application.datasources.main#">
DELETE Project_Visible_To
WHERE project_id=#attributes.project_id#
<cfloop list="#attributes.visible_to#" index="ii">
INSERT INTO Project_Visible_To (project_id, company_id)
VALUES (#attributes.project_id#, #ii#)
</cfloop>
</cfquery>

<cfif isdefined("task_id")>
	<cfloop list="#task_id#" index="ii">
		<cfquery name="complete_tasks" datasource="#application.datasources.main#">
		UPDATE Task
		SET status_id=11,
			complete_date=GETDATE()
		WHERE task_id=#ii#
		</cfquery> 
	</cfloop>
</cfif>
</cftransaction>
