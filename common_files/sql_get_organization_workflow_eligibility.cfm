/* common_files/sql_get_organization_workflow_eligibility.cfm
	Author: Jeromy French */
<cfoutput>
SELECT Hierarchy_Assignment.parent_organization_id, SUM(Hierarchy_Assignment.active_ind) AS child_count, SUM(COALESCE(Workflow_Progress.active_ind,0)) AS workflow_count,
	MAX(Workflow_Progress.created_date) AS created_date
FROM Hierarchy_Assignment
	INNER JOIN Link_Program_Year_Hierarchy ON Hierarchy_Assignment.l_p_y_h_id=Link_Program_Year_Hierarchy.l_p_y_h_id
	INNER JOIN (
		/*We only need to check on organizations that have fund controls*/
		SELECT Fund_Control.organization_id
		FROM Fund_Control
			INNER JOIN Link_Program_Year_Fund ON Fund_Control.l_p_y_f_id=Link_Program_Year_Fund.l_p_y_f_id
		WHERE Fund_Control.active_ind=1
			AND Link_Program_Year_Fund.active_ind=1
			AND Link_Program_Year_Fund.program_year_id=#attributes.program_year_id#
			AND Fund_Control.control-Fund_Control.institutional_budget+Fund_Control.carry_in+Fund_Control.additional_budget!=0 /*A funds record is only considered valid if it has ABR, CAB or CI*/
		GROUP BY Fund_Control.organization_id
	) Fund_Control ON Hierarchy_Assignment.organization_id=Fund_Control.organization_id
	LEFT OUTER JOIN (
		SELECT Workflow_Progress.organization_id, Workflow_Progress.active_ind, Workflow_Progress.created_date
		FROM Workflow_Progress
			INNER JOIN (
				/*only deal with current phasing plan version*/
				SELECT MAX(phasing_plan_version_id) AS phasing_plan_version_id
				FROM Phasing_Plan_Version
				WHERE active_ind=1
					AND program_year_id=#attributes.program_year_id#
				) Phasing_Plan_Version ON Workflow_Progress.phasing_plan_version_id=Phasing_Plan_Version.phasing_plan_version_id
		WHERE Workflow_Progress.active_ind=1
			AND Workflow_Progress.phasing_plan_status_id=#attributes.phasing_plan_status_id#
	) Workflow_Progress ON Hierarchy_Assignment.organization_id=Workflow_Progress.organization_id
WHERE Hierarchy_Assignment.active_ind=1<cfif isdefined("attributes.organization_id")>
	AND Hierarchy_Assignment.parent_organization_id=#attributes.organization_id#</cfif>
	AND Link_Program_Year_Hierarchy.program_year_id=#attributes.program_year_id#
GROUP BY Hierarchy_Assignment.parent_organization_id
</cfoutput>
