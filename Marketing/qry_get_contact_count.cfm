
<!--Marketing/qry_get_contact_count.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_contact_count" datasource="#application.datasources.main#">
SELECT MAX(people) AS loop_count
FROM (
	SELECT COUNT(marketing_emp.emp_id) AS people
	FROM Time_Entry
		LEFT OUTER JOIN Task ON Time_Entry.Task_ID = Task.Task_ID
		RIGHT OUTER JOIN Marketing
		INNER JOIN Project ON Marketing.project_id = Project.project_id
		LEFT OUTER JOIN Marketing_Emp
		INNER JOIN Emp_Contact ON Marketing_Emp.emp_id=Emp_Contact.emp_id 
			AND Project.project_id = Marketing_Emp.project_id LEFT OUTER
		INNER JOIN Emp_Contact Emp_Contact1 ON Marketing.Source = Emp_Contact1.emp_id 
			AND Task.project_id = Project.project_id
		LEFT OUTER JOIN  Location ON Location.Location_Type_Id = 1
			AND Emp_Contact.emp_id=Location.emp_id
		LEFT OUTER JOIN Phone ON Phone.Phone_type_id = 1
			AND Emp_Contact.emp_id=Phone.emp_id
		LEFT OUTER JOIN Email ON Email.email_type_id = 1
			AND Emp_Contact.emp_id=Email.emp_id
		WHERE Time_Entry.active_ind=1
		AND Marketing.project_code LIKE '6005.%'<cfif SortBy1 is not 'None'>
		AND (#SortBy1# like '%#SortBy1stuff#%'</cfif><cfif sortBy2 is not 'None'>#SortBy2andor# #SortBy2# like '%#SortBy2stuff#%'</cfif><cfif SortBy3 is not 'None'>#SortBy3andor# #SortBy3# like '%#SortBy3stuff#%'</cfif><cfif SortBy1 is not 'None' or SortBy2 is not 'None'  or SortBy3 is not 'None' >)</cfif> 
GROUP BY marketing.project_id) AS test
</cfquery>
</cfsilent>