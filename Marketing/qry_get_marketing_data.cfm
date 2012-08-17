
<!--Marketing/qry_get_marketing_data.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query to get all the marketing information for the marketing module 

	||
	Edits:
	$Log$
	||
	Variables:- ->sortby1: a variable set so the grid can be filtered by the columns
		- ->sortby2: a variable set so the grid can be filtered by the columns
		- ->sortby3: a variable set so the grid can be filtered by the columns
	END FUSEDOC --->

<!---    <cfquery name="marketing" datasource="#application.datasources.main#">
SELECT marketing.marketing_id, Marketing.Projected_Revenue, Marketing.Probability, 
    Marketing.project_code, Marketing.project_id, 
    (cast(EXTRACT(MONTH FROM Marketing.StatusAboveDate) AS varchar(2)) || '/' || cast(datepart(dd, Marketing.StatusAboveDate) AS varchar(2)) || '/' || cast(EXTRACT(YEAR FROM Marketing.StatusAboveDate) AS varchar(4))) as StatusAboveDate, 
    (cast(EXTRACT(MONTH FROM Marketing.StatusInDate) AS varchar(2)) || '/' || cast(datepart(dd, Marketing.StatusInDate) AS varchar(2)) || '/' || cast(EXTRACT(YEAR FROM Marketing.StatusInDate) AS varchar(4))) as StatusInDate, 
    (cast(EXTRACT(MONTH FROM Marketing.StatusBestFewDate) AS varchar(2)) || '/' || cast(datepart(dd, Marketing.StatusBestFewDate) AS varchar(2)) || '/' || cast(EXTRACT(YEAR FROM Marketing.StatusBestFewDate) AS varchar(4))) as StatusBestFewDate,
(cast(EXTRACT(MONTH FROM Marketing.StatusContractDate) AS varchar(2)) || '/' || cast(datepart(dd, Marketing.StatusContractDate) AS varchar(2)) || '/' || cast(EXTRACT(YEAR FROM Marketing.StatusContractDate) AS varchar(4))) as StatusContractDate, 
    Marketing.Converted_To_CustomerCode, 
    Marketing.Company_Size, Marketing.Overview,
    Project.active_ind, Emp_Contact.emp_id,
    Emp_Contact.Name, Emp_Contact.LName, Location.Address1 as paddress, 
    Location.Address2 as saddress, Location.City, Location.State, Location.Zip, 
    Phone.Phone_Number AS phone, Phone.Extension, 
    Email.Email, 
    Emp_Contact1.Name || '  ' || Emp_Contact1.LName AS source, 
    Emp_Contact1.emp_id AS source_id, Project.description, 

task_info.task_id, 
task_info.last_task,
(cast(EXTRACT(MONTH FROM task_info.Date) AS varchar(2)) || '/' || cast(datepart(dd, task_info.Date) AS varchar(2)) || '/' || cast(EXTRACT(YEAR FROM task_info.Date) AS varchar(4))) as [Date]

FROM (select top 1 project_id, task_id, task.name as last_task, (select max(Time_Entry.work_date) from time_entry where task.task_id = time_entry.task_id) as [date]
	from Task 
	where project_id = 504
ORDER BY task_id desc
    ) as task_info RIGHT OUTER JOIN
    Marketing
	INNER JOIN Project ON Marketing.project_id = Project.project_id
	LEFT OUTER JOIN  Marketing_Emp
	INNER JOIN Emp_Contact ON Marketing_Emp.emp_id = Emp_Contact.emp_id ON Project.project_id = Marketing_Emp.project_id
	LEFT OUTER JOIN  Emp_Contact Emp_Contact1 ON Marketing.Source = Emp_Contact1.emp_id ON task_info.project_id = Project.project_id
	LEFT OUTER JOIN  Location ON Location.Location_Type_Id = 1
	AND Emp_Contact.emp_id = Location.emp_id
	LEFT OUTER JOIN  Phone ON Phone.Phone_type_id = 1
	AND Emp_Contact.emp_id = Phone.emp_id
	LEFT OUTER JOIN  Email ON Email.email_type_id = 1
	AND Emp_Contact.emp_id = Email.emp_id
WHERE (Marketing.project_code LIKE '6005.%')
<cfif SortBy1 is not 'None'>and (#SortBy1# like '%#SortBy1stuff#%'</cfif>
<cfif sortBy2 is not 'None'>#SortBy2andor# #SortBy2# like '%#SortBy2stuff#%'</cfif>
<cfif SortBy3 is not 'None'>#SortBy3andor# #SortBy3# like '%#SortBy3stuff#%'</cfif>
<cfif SortBy1   is not 'None' or SortBy2 is not 'None'  or SortBy3 is not 'None' >)</cfif> 
GROUP BY task_info.last_task,task_info.task_id, Marketing.Projected_Revenue, 
    Marketing.Probability, Marketing.project_id, 
    Marketing.StatusAboveDate, Marketing.StatusInDate, 
    Marketing.StatusBestFewDate, Marketing.StatusContractDate, 
    Marketing.Converted_To_CustomerCode, 
    Marketing.Company_Size, Marketing.Overview, 
    Emp_Contact.Name, Emp_Contact.LName, Location.Address1, 
    Location.Address2, Location.City, Location.State, Location.Zip, 
    Phone.Phone_Number, Phone.Extension, Email.Email, 
    Marketing.project_code, Emp_Contact1.Name, 
    Emp_Contact1.Name || '  ' || Emp_Contact1.LName, 
    Project.description, task_info.Date, Project.active_ind, 
    Emp_Contact1.emp_id, marketing.marketing_id, Emp_Contact.emp_id
</cfquery> --->

<cfquery name="marketing" datasource="#application.datasources.main#">
Select *
From Marketing_For_Web_Query
</cfquery>

</cfsilent>



