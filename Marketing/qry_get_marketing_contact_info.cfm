
<!--Marketing/qry_get_marketing_contact_info.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the information for the second CFGRID in the marketing section, this grid displays the information on people (address, phone, ect.)

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:14  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:44-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfquery name="get_marketing_contact_info" datasource="#application.datasources.main#">
    SELECT Email.Email, Phone.Phone_Number, Phone.Extension, 
    Location.Address1, Location.Address2, Location.City, 
    Location.State, Location.Zip, Emp_Contact.LName, 
    Emp_Contact.Name, emp_contact.emp_id
FROM Emp_Contact LEFT OUTER JOIN
    Email ON Emp_Contact.Emp_ID = Email.Emp_ID AND 
    Email.Email_Type_ID = 1 LEFT OUTER JOIN
    Location ON Location.Location_Type_Id = 1 AND 
    Emp_Contact.Emp_ID = Location.Emp_ID LEFT OUTER JOIN
    Phone ON Phone.Phone_type_id = 1 AND 
    Emp_Contact.Emp_ID = Phone.Emp_ID
WHERE (Emp_Contact.Emp_ID = #attributes.emp_id#)
</cfquery>
