
<!--Customers/qry_get_engagement.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am used with the edit engagement screen, I select the particular engagement that the user wants to edit.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:08  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:20-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_engagement" datasource="#application.datasources.main#">
    SELECT Project.Description, Project.project_code, Project.budget, 
    REF_Billable.Billable_Type, project.billable_type_id, project.active_id,
    REF_Active_Indicator.Active_Ind_Type, Flat_Rate.Months, project.company_id,
    Flat_Rate.rate_end_date, Flat_Rate.rate_start_date
FROM Project
	INNER JOIN REF_Billable ON Project.billable_type_id = REF_Billable.billable_type_id
	INNER JOIN REF_Active_Indicator ON Project.Active_ID = REF_Active_Indicator.Active_Ind LEFT OUTER
     JOIN
    Flat_Rate ON Project.project_id = Flat_Rate.project_id
WHERE project.project_id = #attributes.project_id#
</cfquery>
</cfsilent>
