
<!--Directory/qry_get_emp_job_titles.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees job title info.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log: 

	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	
 --->
<cfquery name="get_emp_job_titles" datasource="#application.datasources.main#">
	SELECT     job_title_id, date_start, date_end, title
FROM         Job_Title
WHERE     (emp_id = #attributes.emp_id#)
	<!--- AND Job_Title.active_ind = 1 --->
	
</cfquery>
</cfsilent>
