
<!--Reports/index.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the FUSEBOX for the Reports module of the spiffy Nucleus designed workstream system. 

	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<!--- App Global and local settings includes --->
<cfinclude template = "../app_global.cfm">
<cfinclude template = "app_local.cfm">

<cf_bodycontent>

	<cfswitch expression = "#attributes.fuseaction#">
	
		<!---Begin Report Menu Screen --->
		<cfcase value = "home">
			<cfset request.pagetitle = "report menu">
			<cfinclude template = "pag_report.cfm">
		</cfcase>
		<!--- End Report Menu Screen--->
		
		<cfcase value = "lost_time_input">
			<cfset request.pagetitle = "Lost time">
			<cfinclude template = "pag_lost_time_input.cfm">
		</cfcase>

		<cfcase value = "lost_time">
			<cfset request.pagetitle = "Lost time">
			<cfinclude template = "pag_lost_time.cfm">
		</cfcase>

		<cfcase value = "admin_planning">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Admin/Planning Efficiency">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Admin/Planning Efficiency">
			<cfset variables.project_name = "Admin/Planning">
			<cfset variables.project_id = 1112>
			<cfinclude template = "pag_efficiency_report.cfm">
		</cfcase>

		<!--- Begin Anniversary report --->
		<cfcase value = "anniversary_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Anniversary">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Anniversary Report">
			<cfinclude template = "pag_anniv_report_input.cfm">
		</cfcase>

		<cfcase value = "anniversary">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Anniversary">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Anniversary Report">
			<cfinclude template = "pag_anniv_report.cfm">
		</cfcase>
		<!--- End Anniversary Report --->
		
		<!--- Begin Billable Hours Report --->
		<cfcase value = "billable_hours_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Billable Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Billable Hours Report">
			<cfinclude template = "pag_billable_hours_input.cfm">
		</cfcase>

		<cfcase value = "billable_hours">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Billable Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Billable Hours Report">
			<cfinclude template = "pag_billable_hours.cfm">
		</cfcase>
		<!--- End Billable hours report --->
		
		<!--- Begin Code Report --->
		<cfcase value = "code_report_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Code Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Code Report">
			<cfinclude template = "pag_code_report_input.cfm">
		</cfcase>

		<cfcase value = "code_report">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Code Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Code Report">
			<cfinclude template = "pag_code_report.cfm">
		</cfcase>
		<!--- End Code Report --->
		
		<!--- Begin contractors --->
		<cfcase value = "contractors_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Contractors">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Contractors Report">
			<cfinclude template = "pag_contractor_report_input.cfm">
		</cfcase>

		<cfcase value = "contractors">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Contractors">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Contractors Report">
			<cfinclude template = "pag_contractor_report.cfm">
		</cfcase>
		<!--- End contractors report --->
		<cfcase value = "deadline_management">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Deadline Management">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Deadline Management Report">
			<cfinclude template = "pag_deadline_management.cfm">
		</cfcase>

		<cfcase value = "employee_force">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Personal Forceplanner">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Employee ForcePlanner">
			<cfinclude template = "pag_employee_force.cfm">
		</cfcase>

		<cfcase value = "engagement_dashboard">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "New engagements">	
			<cfset request.pagetitle = "New Engagement Report">
			<cfinclude template = "pag_engagement_dashboard.cfm">
		</cfcase>

		<cfcase value = "engagement_dashboard_staff">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "New engagements">	
			<cfset request.pagetitle = "New Engagement Report">
			<cfinclude template = "pag_engagement_dashboard_Staff.cfm">
		</cfcase>

		<cfcase value = "expense_report_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Expense Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Expense Report Input">
			<cfinclude template = "pag_expense_report_input.cfm">
		</cfcase>

		<cfcase value = "expense_report">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Expense Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Expense Report">
			<cfinclude template = "pag_expense_report.cfm">
		</cfcase>

		<!--- <cfcase value = "expense_entry">
			<cfset request.pagetitle = "Expense Entry">
			<cfinclude template = "pag_expense_entry.cfm">
		</cfcase>
 --->
		<cfcase value = "gross_hours_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Gross Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Gross Hours Report">
			<cfinclude template = "pag_gross_hours_input.cfm">
		</cfcase>

		<cfcase value = "gross_hours_input_ytd">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Gross Hours - Breakdown">	
			<!--- <cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->
 --->
			<cfset request.pagetitle = "Gross Hours Report - Breakdown">
			<cfinclude template = "pag_gross_hours_input_ytd.cfm">
		</cfcase>
		
		<cfcase value = "gross_hours">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Gross Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Gross Hours Report">
			<cfinclude template = "pag_gross_hours.cfm">
		</cfcase>

		<cfcase value = "gross_hours_ytd">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Gross Hours - Breakdown">	
			<!--- <cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->
 --->
			<cfset request.pagetitle = "Gross Hours Report - Breakdown">
			<cfinclude template = "pag_gross_hours_ytd.cfm">
		</cfcase>

		<cfcase value = "Hours_By_Code_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Hours By Code">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Hours By Code Report">
			<cfinclude template = "pag_hours_by_code_input.cfm">
		</cfcase>

		<cfcase value = "Hours_By_Code">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Hours By Code">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Hours By Code Report">
			<cfinclude template = "pag_hours_by_code.cfm">
		</cfcase>

		<cfcase value = "individual_hours_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Individual Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Individual Hours Report">
			<cfinclude template = "pag_individual_hours_input.cfm">
		</cfcase>

		<cfcase value = "individual_hours">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Individual Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Individual Hours Report">
			<cfinclude template = "pag_individual_hours.cfm">
		</cfcase>

		<cfcase value = "ip_report">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Implementation Analysis Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Implementation Analysis Report">
			<cfinclude template = "pag_ip_report.cfm">
		</cfcase>

		<cfcase value = "it_time">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "IT Time">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "IT Time">
			<cfset variables.project_name = "IT">
			<cfset variables.project_id = 1113>
			<cfinclude template = "pag_efficiency_report.cfm">
		</cfcase>

		<cfcase value = "Leadership_hours_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Leadership Time Reports">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Leadership Hours Report">
			<cfinclude template = "pag_leader_hours_report_input.cfm">
		</cfcase>

		<cfcase value = "Leadership_hours">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Leadership Time Reports">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Leadership Hours Report">
			<cfinclude template = "pag_leader_hours_report.cfm">
		</cfcase>

		<cfcase value = "Manager_cross_tab_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Manager's Cross Tab Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Manager's Cross Tab Report">
			<cfinclude template = "pag_manager_cross_tab_input.cfm">
		</cfcase>

		<cfcase value = "Manager_cross_tab">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Manager's Cross Tab Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Manager's Cross Tab Report">
			<cfinclude template = "pag_manager_cross_tab.cfm">
		</cfcase>

		<cfcase value = "Manager_cross_tab_mail">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Manager's Cross Tab Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfinclude template = "pag_crosstab_mail.cfm">
		</cfcase>

		<cfcase value = "manager_hours">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Manager Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->
			
			<cfset request.pagetitle = "Manager Hours Report">
			<cfinclude template = "pag_manager_hours.cfm">
		</cfcase>

		<cfcase value = "manager_hours_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Manager Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->
			
			<cfset request.pagetitle = "Manager Hours Report">
			<cfinclude template = "pag_manager_hours_input.cfm">
		</cfcase>

		<cfcase value = "manager_individual_hours">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Manager Individual Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->
		
			<cfset request.pagetitle = "Manager's Individual Hours Report">
			<cfinclude template = "pag_mgr_Indiv_Hours.cfm">
		</cfcase>

		<cfcase value = "manager_individual_hours_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Manager Individual Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Manager's Individual Hours Report">
			<cfinclude template = "pag_Manager_Individual_Hours_input.cfm">
		</cfcase>

		<cfcase value = "new_engagement_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "New engagements">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "New Engagement Report">
			<cfinclude template = "pag_new_engage_input.cfm">
		</cfcase>

		<cfcase value = "new_engagement_output">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "New engagements">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "New Engagement Report">
			<cfinclude template = "pag_new_engage_output.cfm">
		</cfcase>

		<cfcase value = "non_billable_hours">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Non Billable Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Non-Billable Hours Report">
			<cfinclude template = "pag_NON_billable_hours.cfm">
		</cfcase>

		<cfcase value = "non_billable_hours_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Non Billable Hours">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Non-Billable Hours Report">
			<cfinclude template = "pag_non_billable_hours_input.cfm">
		</cfcase>

		<cfcase value = "overtime">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Overtime">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Overtime Report">
			<cfinclude template = "pag_overtime_report.cfm">
		</cfcase>

		<cfcase value = "overtime_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Overtime">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Overtime Report">
			<cfinclude template = "pag_overtime_report.cfm">
		</cfcase>
		<!--- End Overtime Report--->
		
		<!--- Begin Personal Summary Report --->
		<cfcase value = "personal_summary">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Personal Hours Summary">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->
		
			<cfset request.pagetitle = "My Hours Report">
			<cfinclude template = "pag_personal_summary.cfm">
		</cfcase>

		
		<!--- Begin PTO (non-accrual) Report --->
		<cfcase value = "pto">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "PTO Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "PTO Report">
			<cfinclude template = "pag_pto_report.cfm">
		</cfcase>

		<cfcase value = "pto_accrual_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "PTO Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "PTO Report">
			<cfinclude template = "pag_pto_accrual.cfm">
		</cfcase>

		<cfcase value = "pto_detail">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "PTO Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Detail PTO Report">
			<cfinclude template = "pag_pto_accrual_detail.cfm">
		</cfcase>

		<cfcase value = "pto_drill_down">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "PTO Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "PTO Report Detail">
			<cfinclude template = "pag_pto_report_detail.cfm">
		</cfcase>

		<cfcase value = "pto_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "PTO Report">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "PTO Report">
			<cfinclude template = "pag_pto_report_input.cfm">
		</cfcase>

		<cfcase value = "supervisor_force">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Supervisor Forceplanner">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Supervisor ForcePlanner">
			<cfinclude template = "pag_supervisor_force.cfm">
		</cfcase>

		<cfcase value = "tech_support">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Tech Support">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Tech Support">
			<cfinclude template = "pag_tech_support.cfm">
		</cfcase>

		<cfcase value = "turnover">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "turnover">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Turnover Report">
			<cfinclude template = "pag_turnover_report.cfm">
		</cfcase>

		<cfcase value = "turnover_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "turnover">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Turnover Report">
			<cfinclude template = "pag_turnover_report_input.cfm">
		</cfcase>

		<cfcase value = "undertime">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Undertime">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Undertime Report">
			<cfinclude template = "pag_undertime_report.cfm">
		</cfcase>

		<cfcase value = "undertime_input">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Undertime">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Undertime Report">
			<cfinclude template = "pag_undertime_report_input.cfm">
		</cfcase>

		<cfcase value = "sales_report">
			<!--- set security object name and check for access --->
			<cfset attributes.object_name = "Monthly Sales">	
			<cfinclude template = "#request.dir_level#common_files/act_object_access.cfm">
			<!--- User has access --->

			<cfset request.pagetitle = "Monthly Revenue Report">
			<cfinclude template = "pag_revenue_report.cfm">
		</cfcase>
		
		
		<!--- Begin Default Case --->
		<cfdefaultcase>
			<cfset request.pagetitle = "Report Menu">
			<cfinclude template = "pag_report.cfm">
		</cfdefaultcase>
		<!--- End Default case --->
	</cfswitch>
	
</cf_bodycontent>

<cfinclude template = "../common_files/app_layout.cfm">
