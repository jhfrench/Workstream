
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
	Revision 1.12  2005/08/26 18:06:02  stetzer
	<>

	Revision 1.11  2005-08-26 13:50:43-04  stetzer
	<>

	Revision 1.10  2005-08-26 13:44:22-04  stetzer
	<>

	Revision 1.9  2005-08-26 13:39:54-04  stetzer
	<>

	Revision 1.8  2005-08-26 13:33:49-04  stetzer
	<>

	Revision 1.7  2005-08-26 13:32:02-04  stetzer
	<>

	Revision 1.6  2005-08-26 13:29:43-04  stetzer
	<>

	Revision 1.5  2005-08-26 13:25:59-04  stetzer
	<>

	Revision 1.4  2005-08-26 11:16:30-04  stetzer
	<>

	Revision 1.3  2005-08-26 11:13:48-04  stetzer
	<>

	Revision 1.2  2005-08-26 11:06:16-04  stetzer
	<>

	Revision 1.1  2005-08-26 09:58:04-04  stetzer
	Added LOE

	Revision 1.0  2005-02-15 15:45:26-05  daugherty
	Initial revision

	Revision 1.2  2002-01-24 16:21:44-05  french
	Added date formatting to variables being passed into case 3.

	Revision 1.1  2001-10-11 10:56:42-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfquery name="edit_engagement_billing" datasource="#application.datasources.main#">
<!--- all types --->
UPDATE Project
SET Project.budget=#attributes.budget#, Project.LOE =#attributes.LOE#
WHERE Project.project_id=#attributes.project_id#
<cfswitch expression="#attributes.billable_id#">
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
	<cflocation url="../index.cfm?fuseaction=Reports.Engagement_Dashboard&customers_id_filter=#customers_id_filter#&ie_emp_id_filter=#ie_emp_id_filter#&sort=#sort#&###Project_ID#" addtoken="no">
</cfif>
</cfsilent>

