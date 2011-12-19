
<!--Marketing/Qry_only_marketing.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:21  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:40-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfquery name="only_marketing" datasource="#application.datasources.main#">
    	select *
	from marketing
	where company_id IN(#session.workstream_company_select_list#)
</cfquery>
I use emp_id and a REF_*_type_id as the key.
{
     Location.Address1, 
     Location.Address2, Location.City, Location.State, Location.Zip, 
    
    Phone.Phone_Number AS phone, Phone.Extension, 
   
    Email.Email, 
 }   
    I use emp_id as the key
    {
    Emp_Contact.Name, Emp_Contact.LName,
    }
    I use project_id as the key
    {
    Project.Description, 
 Project.Active_ID 
    }
    
    
   
    Time_Entry,Task, Marketing,  Project, Marketing_Emp, Emp_Contact, Location, Phone, Email 

WHERE (Marketing.Project_Code LIKE '6005.%')
</cfsilent>
