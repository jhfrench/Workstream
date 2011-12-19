
<!--Marketing/qry_get_contact_count.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:13  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:45-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_contact_count" datasource="#application.datasources.main#">
    SELECT MAX(people) AS loop_count
FROM (SELECT COUNT(marketing_emp.emp_id) AS people
      FROM Time_Entry LEFT OUTER JOIN
          Task ON 
          Time_Entry.Task_ID = Task.Task_ID RIGHT OUTER JOIN
          Marketing INNER JOIN
          Project ON 
          Marketing.Project_ID = Project.project_id LEFT OUTER JOIN
          Marketing_Emp INNER JOIN
          Emp_Contact ON 
          Marketing_Emp.Emp_id = Emp_Contact.Emp_ID ON 
          Project.project_id = Marketing_Emp.Project_id LEFT OUTER
           JOIN
          Emp_Contact Emp_Contact1 ON 
          Marketing.Source = Emp_Contact1.Emp_ID ON 
          Task.Project_id = Project.project_id LEFT OUTER JOIN
          Location ON Location.Location_Type_Id = 1 AND 
          Emp_Contact.Emp_ID = Location.Emp_ID LEFT OUTER JOIN
          Phone ON Phone.Phone_type_id = 1 AND 
          Emp_Contact.Emp_ID = Phone.Emp_ID LEFT OUTER JOIN
          Email ON Email.Email_Type_ID = 1 AND 
          Emp_Contact.Emp_ID = Email.Emp_ID
      WHERE (Marketing.project_code LIKE '6005.%')
	 <cfif SortBy1 is not 'None'>and (#SortBy1# like '%#SortBy1stuff#%'</cfif>
<cfif sortBy2 is not 'None'>#SortBy2andor# #SortBy2# like '%#SortBy2stuff#%'</cfif>
<cfif SortBy3 is not 'None'>#SortBy3andor# #SortBy3# like '%#SortBy3stuff#%'</cfif>
<cfif SortBy1   is not 'None' or SortBy2 is not 'None'  or SortBy3 is not 'None' >)</cfif> 
      GROUP BY marketing.project_id) AS test
</cfquery>

</cfsilent>

